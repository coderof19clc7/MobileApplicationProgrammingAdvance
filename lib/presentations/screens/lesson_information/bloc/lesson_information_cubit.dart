import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/report/save_report_lesson_request.dart';
import 'package:one_one_learn/core/models/requests/user/user_feedback_tutor_request.dart';
import 'package:one_one_learn/core/models/responses/feedback/feed_back.dart';
import 'package:one_one_learn/core/models/responses/report/save_report_lesson_resposne.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/core/models/responses/user/user_feedback_tutor_response.dart';
import 'package:one_one_learn/core/network/repositories/lesson_report_repository.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

part 'lesson_information_state.dart';

class LessonInformationCubit extends WidgetCubit<LessonInformationState> {
  LessonInformationCubit({
    required GroupedBookingInfo groupedBookingInfo,
  }) : super(widgetState: LessonInformationState(groupedBookingInfo: groupedBookingInfo));

  final lessonReportRepository = injector<LessonReportRepository>();
  final userRepository = injector<UserRepository>();

  @override
  void onWidgetCreated() {}

  Future<void> reportBooking(String bookingId, int reasonId, String note) async {
    final saveReportLessonResponse = await fetchApi<SaveReportLessonResponse>(
      () => lessonReportRepository.saveReportLesson(
        saveReportLessonRequest: SaveReportLessonRequest(
          bookingId: bookingId,
          reasonId: reasonId,
          note: note,
        ),
      ),
      showLoading: false,
    );

    if (saveReportLessonResponse != null && saveReportLessonResponse.statusCode == ApiStatusCode.success) {
      saveReportLessonResponse.message?.let(showSuccessToast);
    }
  }

  Future<void> ratingBooking(String bookingId, int rating, String content, String userId, {
    Future<void> Function()? onFinishFeedback,
  }) async {
    final userFeedbackTutorResponse = await fetchApi<UserFeedbackTutorResponse>(
          () => userRepository.feedbackTutor(
        userFeedbackTutorRequest: UserFeedbackTutorRequest(
          rating: rating,
          content: content,
          bookingId: bookingId,
          userId: userId,
        ),
      ),
      showLoading: false,
    );

    var shouldShowSuccessToast = false;
    if (userFeedbackTutorResponse != null && userFeedbackTutorResponse.statusCode == ApiStatusCode.success) {
      shouldShowSuccessToast = true;
      if (userFeedbackTutorResponse.data != null) {
        final listBookingInfo = state.groupedBookingInfo.bookingInfoList;
        if (listBookingInfo?.first != null) {
          listBookingInfo?.first?.feedbacks?.add(userFeedbackTutorResponse.data!);
          final length = listBookingInfo?.length ?? 0;
          final newFeedbackList = <FeedBack>[];
          for (var i = 0; i < length; i++) {
            final info = listBookingInfo?[i];
            if (info?.feedbacks != null) {
              newFeedbackList.addAll([...info?.feedbacks ?? <FeedBack>[]]);
            }
          }
          emitNewState(state.copyWith(
            groupedBookingInfo: state.groupedBookingInfo.copyWith(
              bookingInfoList: listBookingInfo,
              feedbackList: newFeedbackList,
            ),
          ));
        }
      }
    }

    await onFinishFeedback?.call();

    if (shouldShowSuccessToast) {
      userFeedbackTutorResponse?.message?.let(showSuccessToast);
    }
  }
}
