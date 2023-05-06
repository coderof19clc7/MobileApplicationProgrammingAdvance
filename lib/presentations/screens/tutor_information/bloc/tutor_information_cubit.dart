import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/report/report_tutor_request.dart';
import 'package:one_one_learn/core/models/responses/feedback/feed_back.dart';
import 'package:one_one_learn/core/models/responses/feedback/feedback_list_response.dart';
import 'package:one_one_learn/core/models/responses/report/report_tutor_response.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info_response.dart';
import 'package:one_one_learn/core/network/repositories/feedback_repository.dart';
import 'package:one_one_learn/core/network/repositories/report_repository.dart';
import 'package:one_one_learn/core/network/repositories/tutor_repository.dart';

part 'tutor_information_state.dart';

class TutorInformationCubit extends WidgetCubit<TutorInformationState> {
  TutorInformationCubit({required String tutorId})
      : super(widgetState: TutorInformationState(tutorId: tutorId));

  final _tutorRepository = injector<TutorRepository>();
  final _feedbackRepository = injector<FeedbackRepository>();
  final _reportRepository = injector<ReportRepository>();
  final int feedBackPerPage = 12;

  List<FeedBack?> get initialLoadMoreAbleFeedBackList => <FeedBack?>[null, null, null];

  @override
  void onWidgetCreated() {}

  Future<void> getTutorInformation() async {
    emit(state.copyWith(isLoadingData: true));
    final tutorInfoResponse = await fetchApi<TutorInfoResponse>(
      () async => _tutorRepository.getTutorInfoById(state.tutorId),
      showLoading: false,
    );

    if (tutorInfoResponse != null) {
      if (tutorInfoResponse.statusCode == ApiStatusCode.success) {
        emit(state.copyWith(tutorInformation: tutorInfoResponse.data));
      }
    }
    emit(state.copyWith(isLoadingData: false));
  }

  void updateFavoriteStatus({required bool isFavorite}) {
    emit(state.copyWith(
      tutorInformation: state.tutorInformation?.copyWith(isFavorite: isFavorite),
    ));
  }

  bool canListFeedbackLoadMore() {
    if (state.feedbackList.isEmpty) {
      return false;
    }
    return state.feedbackList.last == null;
  }

  List<FeedBack?> getRealCurrentFeedbackList() {
    return canListFeedbackLoadMore()
        ? state.feedbackList.sublist(0, state.feedbackList.length - 3)
        : state.feedbackList;
  }

  Future<void> getListFeedback() async {
    emit(state.copyWith(isLoadingMoreFeedback: true));
    if (kDebugMode) {
      print('nextPage: ${state.feedbackNextPage}');
    }
    final feedbackListResponse = await fetchApi<FeedbackListResponse>(
      () async => _feedbackRepository.getListFeedback(
        tutorId: state.tutorId,
        page: state.feedbackNextPage,
        perPage: feedBackPerPage,
      ),
      showLoading: false,
    );

    if (kDebugMode) {
      print('currentFeedbackListLength: ${
          canListFeedbackLoadMore() ? state.feedbackList.length - 3 : state.feedbackList.length
      }');
    }
    if (feedbackListResponse != null) {
      if (feedbackListResponse.statusCode == ApiStatusCode.success) {
        var newPage = state.feedbackNextPage;
        final newFeedbackList = feedbackListResponse.data?.rows ?? <FeedBack?>[];
        if (newFeedbackList.isNotEmpty) {
          final removeRange = newPage * feedBackPerPage - getRealCurrentFeedbackList().length;
          newFeedbackList.removeRange(
            0, removeRange < feedBackPerPage ? feedBackPerPage - removeRange : 0,
          );
        }
        if (kDebugMode) {
          print('newFeedbackList: ${newFeedbackList.length}');
        }
        var finalNewFeedbackList = <FeedBack?>[];

        // combine current list and new list
        final currentList = getRealCurrentFeedbackList();
        finalNewFeedbackList = newFeedbackList.isEmpty ? [...currentList] : [...currentList, ...newFeedbackList];
        if (finalNewFeedbackList.length != currentList.length) {
          finalNewFeedbackList.addAll([null, null, null]);
        }
        if (kDebugMode) {
          print('finalNewFeedbackList: ${finalNewFeedbackList.length}');
        }
        if (finalNewFeedbackList.length >= newPage * feedBackPerPage) {
          newPage += 1;
        }

        emit(state.copyWith(
          feedbackNextPage: newPage,
          feedbackTotal: feedbackListResponse.data?.count?.toInt() ?? 0,
          feedbackList: [...finalNewFeedbackList],
        ));
      } else {
        emit(state.copyWith(feedbackList: [...getRealCurrentFeedbackList()]));
      }
    } else {
      emit(state.copyWith(feedbackList: [...getRealCurrentFeedbackList()]));
    }

    emit(state.copyWith(isLoadingMoreFeedback: false));
  }

  Future<void> sendReportTutor(String content) async {
    final reportTutorResponse = await fetchApi<ReportTutorResponse>(
      () async => _reportRepository.sendReportTutor(
        reportTutorRequest: ReportTutorRequest(
          tutorId: state.tutorId, content: content,
        ),
      ),
      showLoading: false,
    );

    if (reportTutorResponse != null) {
      if (reportTutorResponse.statusCode == ApiStatusCode.success) {
        showSuccessToast(reportTutorResponse.message);
      }
    }
  }
}
