import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/booking/booked_classes_request.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booked_classes_response.dart';
import 'package:one_one_learn/core/network/repositories/booking_repository.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends WidgetCubit<UpcomingState> {
  UpcomingCubit._() : super(widgetState: const UpcomingState());

  final perPage = 10;
  final bookingRepository = injector<BookingRepository>();

  static UpcomingCubit? _instance;
  static UpcomingCubit getInstance() {
    if (kDebugMode) {
      print('TutorsCubit _instance?.isClosed: ${_instance?.isClosed}');
    }
    if (_instance == null || _instance?.isClosed == true) {
      if (kDebugMode) {
        var text = '';
        if (_instance == null) {
          text += '_instance is null, ';
        }
        if (_instance?.isClosed == true) {
          text += '_instance is closed, set to null and ';
          _instance = null;
        }
        print('$text create new _instance of UpcomingCubit');
      }
      _instance = UpcomingCubit._();
    }
    return _instance!;
  }

  @override
  void onWidgetCreated() {
    getListStudentBookedClasses();
  }

  Future<void> getListStudentBookedClasses() async {
    emit(state.copyWith(isLoadingMore: true));

    // search list by the filters amd page number
    final bookedClassesResponse = await fetchApi<BookedClassesResponse>(
          () => bookingRepository.getBookedClasses(query: BookedClassesRequest(
            page: state.nextPage,
            perPage: perPage,
            dateTimeGte: DateTime.now().millisecondsSinceEpoch,
            orderBy: 'meeting',
            sortBy: 'asc',
          )),
      showLoading: false,
    );

    if (kDebugMode) {
      print('bookedClassesResponse: $bookedClassesResponse');
    }

    // // handle the response
    // print('currentListLength: ${
    //     canListCoursesLoadMore() ? state.listCourses.length - 3 : state.listCourses.length
    // }');
    // if (coursesListResponse != null) {
    //   if (coursesListResponse.statusCode == ApiStatusCode.success) {
    //     final newListCourses = coursesListResponse.data?.rows ?? <CourseInformation?>[];
    //     var finalNewListCourses = <CourseInformation?>[];
    //     print('newListCourses: ${newListCourses.length}');
    //
    //     // combine current list and new list
    //     final newPage = state.nextPage + (newListCourses.isEmpty ? 0 : 1);
    //     final currentList = getRealCurrentList();
    //     finalNewListCourses = newListCourses.isEmpty ? [...currentList] : [...currentList, ...newListCourses];
    //     if (finalNewListCourses.length != currentList.length) {
    //       finalNewListCourses.addAll([null, null, null]);
    //     }
    //     print('finalNewListCourses: ${finalNewListCourses.length}');
    //
    //     emit(state.copyWith(
    //       nextPage: newPage,
    //       total: coursesListResponse.data?.count?.toInt() ?? 0,
    //       listCourses: [...finalNewListCourses],
    //     ));
    //   } else {
    //     emit(state.copyWith(
    //       listCourses: [...getRealCurrentList()],
    //     ));
    //   }
    // } else {
    //   emit(state.copyWith(
    //     listCourses: [...getRealCurrentList()],
    //   ));
    // }

    emit(state.copyWith(isLoadingMore: false));
  }

  @override
  Future<void> close() async {
    super.close();
    if (_instance?.isClosed == true) {
      if (kDebugMode) {
        print('UpcomingCubit _instance is closed --> set to null');
      }
      _instance = null;
    }
  }
}
