import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/booking/booked_classes_request.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booked_classes_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/core/network/repositories/booking_repository.dart';
import 'package:one_one_learn/core/network/repositories/call_repository.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends WidgetCubit<UpcomingState> {
  UpcomingCubit._() : super(widgetState: const UpcomingState());

  final perPage = 10;
  final bookingRepository = injector<BookingRepository>();
  final callRepository = injector<CallRepository>();

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
    getTotalLearningTime();
  }

  Future<void> getTotalLearningTime() async {
    emit(state.copyWith(isLoadingTotalCall: true));
    final totalLearningTime = await callRepository.getTotalCallMinute();
    if (kDebugMode) {
      print('totalLearningTime: $totalLearningTime');
    }
    emit(state.copyWith(isLoadingTotalCall: false, totalCall: totalLearningTime));
  }

  bool canListBookingInfoLoadMore() {
    // return state.listCourses.length < state.total;
    return state.groupedBookingInfoList.last == null;
  }

  List<GroupedBookingInfo?> getRealCurrentList() {
    final currentGroupedList = [...state.groupedBookingInfoList];
    if (currentGroupedList.last == null) {
      currentGroupedList.removeRange(
        state.groupedBookingInfoList.length - 3, state.groupedBookingInfoList.length,
      );
    }
    return currentGroupedList;
  }

  bool is2ClassesContinuously (BookingInfo? firstClass, BookingInfo? secondClass) {
    var result = false;

    if (firstClass?.scheduleDetailInfo?.scheduleInfo?.tutorId
        == secondClass?.scheduleDetailInfo?.scheduleInfo?.tutorId
    ) {
      final firstClassEndTime = firstClass?.scheduleDetailInfo?.endPeriodTimestamp;
      final secondClassStartTime = secondClass?.scheduleDetailInfo?.startPeriodTimestamp;
      result = (firstClassEndTime ?? 0) + (5 * 60 * 1000) <= (secondClassStartTime ?? 0);
    }

    return result;
  }

  List<List<BookingInfo?>?> convert1DListTo2DList(List<BookingInfo?> list1D) {
    final dataAmount = list1D.length;
    final result = <List<BookingInfo?>?>[];

    for (var i = 0; i < dataAmount; i++) {
      if (i == 0) {
        result.add([list1D[i]]);
      } else {
        final currentList = result.last;
        final currentItem = list1D[i];
        if (is2ClassesContinuously(currentList?.last, currentItem)) {
          currentList?.add(currentItem);
        } else {
          result.add([currentItem]);
        }
      }
    }
    return result;
  }

  Future<void> getListStudentBookedClasses({bool reloadAllCurrentList = false}) async {
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

    // handle the response
    if (kDebugMode) {
      print('currentGroupedListLength: ${
        canListBookingInfoLoadMore()
            ? state.groupedBookingInfoList.length - 3
            : state.groupedBookingInfoList.length
      }');
    }
    if (bookedClassesResponse != null) {
      if (bookedClassesResponse.statusCode == ApiStatusCode.success) {
        var nextPage = state.nextPage;
        final newListBookingInfo = bookedClassesResponse.data?.rows ?? <BookingInfo?>[];

        // convert into grouped list
        final list2DVersion = convert1DListTo2DList(newListBookingInfo);
        final newGroupedBookingInfoList = list2DVersion.map((e) {
          return e != null ? GroupedBookingInfo.fromBookingInfoList(e) : null;
        }).toList();
        if (kDebugMode) {
          print('newGroupedBookingInfoList: ${newGroupedBookingInfoList.length}');
        }

        var finalNewGroupedList = <GroupedBookingInfo?>[];
        if (reloadAllCurrentList) {
          finalNewGroupedList = [...newGroupedBookingInfoList];
          if (canListBookingInfoLoadMore()) {
            finalNewGroupedList.addAll([null, null, null]);
          }
        } else {
          nextPage = state.nextPage + (newGroupedBookingInfoList.isEmpty ? 0 : 1);
          final currentList = [...getRealCurrentList()];
          finalNewGroupedList = newGroupedBookingInfoList.isEmpty
              ? [...currentList]
              : [...currentList, ...newGroupedBookingInfoList];
          if (finalNewGroupedList.length != currentList.length) {
            finalNewGroupedList.addAll([null, null, null]);
          }
          if (kDebugMode) {
            print('finalNewGroupedList: ${finalNewGroupedList.length}');
          }
        }

        emit(state.copyWith(
          nextPage: nextPage,
          total: bookedClassesResponse.data?.count?.toInt() ?? 0,
          groupedBookingInfoList: finalNewGroupedList,
        ));
      } else {
        emit(state.copyWith(
          groupedBookingInfoList: [...getRealCurrentList()],
        ));
      }
    } else {
      emit(state.copyWith(
        groupedBookingInfoList: [...getRealCurrentList()],
      ));
    }

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
