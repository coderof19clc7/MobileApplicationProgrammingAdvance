import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/booking_list_request.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booked_classes_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/core/network/repositories/booking_repository.dart';

part 'histories_state.dart';

class HistoriesCubit extends WidgetCubit<HistoriesState> {
  HistoriesCubit() : super(widgetState: const HistoriesState());

  final bookingRepository = injector<BookingRepository>();
  final perPage = 20;

  @override
  void onWidgetCreated() {}

  bool canListHistoryBookingInfoLoadMore() {
    // return state.listCourses.length < state.total;
    if (state.groupedHistoryBookingInfoList.isEmpty) {
      return false;
    }
    return state.groupedHistoryBookingInfoList.last == null;
  }

  List<GroupedBookingInfo?> getRealCurrentList() {
    final currentGroupedList = [...state.groupedHistoryBookingInfoList];
    if (canListHistoryBookingInfoLoadMore()) {
      currentGroupedList.removeRange(
        state.groupedHistoryBookingInfoList.length - 3, state.groupedHistoryBookingInfoList.length,
      );
    }
    return currentGroupedList;
  }

  bool is2ClassesContinuously (BookingInfo? firstClass, BookingInfo? secondClass) {
    var result = false;

    if (firstClass?.scheduleDetailInfo?.scheduleInfo?.tutorId
        == secondClass?.scheduleDetailInfo?.scheduleInfo?.tutorId
    ) {
      final firstClassStartTime = firstClass?.scheduleDetailInfo?.startPeriodTimestamp;
      final secondClassEndTime = secondClass?.scheduleDetailInfo?.endPeriodTimestamp;
      result = (firstClassStartTime ?? 0) - (secondClassEndTime ?? 0) <= (5 * 60 * 1000);
    }

    return result;
  }

  List<List<BookingInfo?>?> convert1DListTo2DList(List<BookingInfo?> list1D, {
    bool isReloadCurrentList = false,
  }) {
    var result = <List<BookingInfo?>?>[];
    if (list1D.isNotEmpty) {
      final dataAmount = list1D.length;
      final hasCurrentList = getRealCurrentList().isNotEmpty;
      if (!isReloadCurrentList && hasCurrentList) {
        result = [getRealCurrentList().last?.bookingInfoList];
        state.groupedHistoryBookingInfoList.removeLast();
      }

      for (var i = 0; i < dataAmount; i++) {
        if (i == 0 && result.isEmpty) {
          result.add([list1D[i]]);
        } else {
          final currentList = result.last;
          final currentItem = list1D[i];
          if (is2ClassesContinuously(currentList?.first, currentItem)) {
            currentList?.insert(0, currentItem);
          } else {
            result.add([currentItem]);
          }
        }
      }
    }

    return result;
  }

  Future<void> getListStudentHistories({bool reloadAllCurrentList = false}) async {
    emit(state.copyWith(isLoadingMore: true));

    // search list by the filters amd page number
    if (kDebugMode) {
      print('state.nextPage: ${state.nextPage}');
      print('now: ${DateTime.now().millisecondsSinceEpoch}');
      print('currentTotal: ${state.currentTotal}');
    }
    final bookedClassesResponse = await fetchApi<BookedClassesResponse>(
          () => bookingRepository.getBookedClasses(query: BookingListRequest(
        page: reloadAllCurrentList ? 1 : state.nextPage,
        perPage: reloadAllCurrentList
            ? state.nextPage * perPage
            : perPage,
        dateTimeLte: DateTime.now().millisecondsSinceEpoch,
        orderBy: 'meeting',
        sortBy: 'desc',
      )),
      showLoading: false,
    );

    // handle the response
    if (kDebugMode) {
      print('currentHistoryGroupedListLength: ${
          canListHistoryBookingInfoLoadMore()
              ? state.groupedHistoryBookingInfoList.length - 3
              : state.groupedHistoryBookingInfoList.length
      }');
    }
    if (bookedClassesResponse != null) {
      if (bookedClassesResponse.statusCode == ApiStatusCode.success) {
        var nextPage = state.nextPage;
        var currentTotal = state.currentTotal;
        final newListHistoryBookingInfo = bookedClassesResponse.data?.rows ?? <BookingInfo?>[];
        if (!reloadAllCurrentList && newListHistoryBookingInfo.isNotEmpty) {
          final removeRange = nextPage * perPage - currentTotal;
          newListHistoryBookingInfo.removeRange(
            0, removeRange < perPage ? perPage - removeRange : 0,
          );
        }

        // convert into grouped list
        final list2DVersion = convert1DListTo2DList(
          newListHistoryBookingInfo, isReloadCurrentList: reloadAllCurrentList,
        );
        final newListTotal = newListHistoryBookingInfo.length;
        final newHistoryGroupedBookingInfoList = list2DVersion.map((e) {
          return e != null ? GroupedBookingInfo.fromBookingInfoList(e) : null;
        }).toList();
        if (kDebugMode) {
          print('newHistoryGroupedBookingInfoList: ${newHistoryGroupedBookingInfoList.length}');
        }

        var finalNewHistoryGroupedList = <GroupedBookingInfo?>[];
        if (reloadAllCurrentList) {
          finalNewHistoryGroupedList = [
            ...newHistoryGroupedBookingInfoList, ...[null, null, null],
          ];
          currentTotal = newListTotal;
        } else {
          currentTotal += newListTotal;
          final currentList = [...getRealCurrentList()];
          finalNewHistoryGroupedList = newHistoryGroupedBookingInfoList.isEmpty
              ? [...currentList]
              : [...currentList, ...newHistoryGroupedBookingInfoList];
          if (finalNewHistoryGroupedList.length != currentList.length) {
            finalNewHistoryGroupedList.addAll([null, null, null]);
          }
          if (kDebugMode) {
            print('finalHistoryNewGroupedList: ${finalNewHistoryGroupedList.length}');
          }
        }
        if (currentTotal >= nextPage * perPage) {
          nextPage += 1;
        }

        emit(state.copyWith(
          nextPage: nextPage,
          total: bookedClassesResponse.data?.count?.toInt() ?? 0,
          currentTotal: currentTotal,
          groupedHistoryBookingInfoList: finalNewHistoryGroupedList,
        ));
      } else {
        emit(state.copyWith(
          groupedHistoryBookingInfoList: [...getRealCurrentList()],
        ));
      }
    } else {
      emit(state.copyWith(
        groupedHistoryBookingInfoList: [...getRealCurrentList()],
      ));
    }

    emit(state.copyWith(isLoadingMore: false));
  }
}
