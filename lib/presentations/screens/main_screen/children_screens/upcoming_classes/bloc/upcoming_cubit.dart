import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/booking_list_request.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/cancel_schedule_request.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/edit_request_request.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/call/call_total_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booked_classes_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/edit_request_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/core/network/repositories/booking_repository.dart';
import 'package:one_one_learn/core/network/repositories/call_repository.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends WidgetCubit<UpcomingState> {
  UpcomingCubit._() : super(widgetState: const UpcomingState());

  final perPage = 10;
  final bookingRepository = injector<BookingRepository>();
  final callRepository = injector<CallRepository>();

  static UpcomingCubit? _instance;
  static UpcomingCubit getInstance() {
    if (kDebugMode) {
      print('UpcomingCubit _instance?.isClosed: ${_instance?.isClosed}');
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
    refreshUpcomingScreen(isInitializeScreen: true);
  }

  Future<void> refreshUpcomingScreen({bool isInitializeScreen = false}) async {
    getListStudentBookedClasses(reloadAllCurrentList: !isInitializeScreen);
    getTotalLearningTime();
  }

  Future<void> getTotalLearningTime() async {
    emitNewState(state.copyWith(isLoadingTotalCall: true));
    final callTotalResponse = await fetchApi<CallTotalResponse>(
      callRepository.getTotalCallMinute,
      showLoading: false,
    );

    int? newTotal;
    if (callTotalResponse != null) {
      if (kDebugMode) {
        print('callTotalResponse: $callTotalResponse');
      }
      newTotal = callTotalResponse.total;
    }
    emitNewState(state.copyWith(isLoadingTotalCall: false, totalCall: newTotal));
  }

  bool canListBookingInfoLoadMore() {
    // return state.listCourses.length < state.total;
    if (state.groupedBookingInfoList.isEmpty) {
      return false;
    }
    return state.groupedBookingInfoList.last == null;
  }

  List<GroupedBookingInfo?> getRealCurrentList() {
    final currentGroupedList = [...state.groupedBookingInfoList];
    if (canListBookingInfoLoadMore()) {
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
      result = (secondClassStartTime ?? 0) - (firstClassEndTime ?? 0) <= (5 * 60 * 1000);
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
        state.groupedBookingInfoList.removeLast();
      }

      for (var i = 0; i < dataAmount; i++) {
        if (i == 0 && result.isEmpty) {
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
    }

    return result;
  }

  Future<void> getListStudentBookedClasses({bool reloadAllCurrentList = false}) async {
    emitNewState(state.copyWith(isLoadingMore: true));

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
        var currentTotal = state.currentTotal;
        final newListBookingInfo = bookedClassesResponse.data?.rows ?? <BookingInfo?>[];
        if (!reloadAllCurrentList && newListBookingInfo.isNotEmpty) {
          final newLength = newListBookingInfo.length;
          final removeRange = perPage - (nextPage * perPage - currentTotal);
          newListBookingInfo.removeRange(
            0, removeRange <= newLength ? removeRange : newLength,
          );
        }

        // convert into grouped list
        final list2DVersion = convert1DListTo2DList(
          newListBookingInfo, isReloadCurrentList: reloadAllCurrentList,
        );
        final newListTotal = newListBookingInfo.length;
        final newGroupedBookingInfoList = list2DVersion.map((e) {
          return e != null ? GroupedBookingInfo.fromBookingInfoList(e) : null;
        }).toList();
        if (kDebugMode) {
          print('newGroupedBookingInfoList: ${newGroupedBookingInfoList.length}');
        }

        var finalNewGroupedList = <GroupedBookingInfo?>[];
        if (reloadAllCurrentList) {
          finalNewGroupedList = [
            ...newGroupedBookingInfoList, ...[null, null, null],
          ];
          currentTotal = newListTotal;
        } else {
          currentTotal += newListTotal;
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
        if (currentTotal >= nextPage * perPage) {
          nextPage += 1;
        } else {
          while (nextPage * perPage - currentTotal > perPage) {
            nextPage -= 1;
          }
        }

        emitNewState(state.copyWith(
          nextPage: nextPage,
          total: bookedClassesResponse.data?.count?.toInt() ?? 0,
          currentTotal: currentTotal,
          groupedBookingInfoList: finalNewGroupedList,
        ));
      } else {
        emitNewState(state.copyWith(
          groupedBookingInfoList: [...getRealCurrentList()],
        ));
      }
    } else {
      emitNewState(state.copyWith(
        groupedBookingInfoList: [...getRealCurrentList()],
      ));
    }

    emitNewState(state.copyWith(isLoadingMore: false));
  }

  Future<void> editStudentRequestForBookingInfo(String bookingInfoId, String newNote) async {
    final editRequestResponse = await fetchApi<EditRequestResponse>(
      () => bookingRepository.editRequestOfBookingInfo(
        bookingInfoId: bookingInfoId,
        editRequestRequest: EditRequestRequest(studentRequest: newNote),
      ),
      showLoading: false,
    );

    if (editRequestResponse != null && editRequestResponse.statusCode == ApiStatusCode.success) {
      editRequestResponse.message?.let(showSuccessToast);
    }

    await getListStudentBookedClasses(reloadAllCurrentList: true);
  }

  Future<void> cancelScheduleDetail(String scheduleDetailId, int cancelReasonId, String note) async {
    final cancelScheduleResponse = await fetchApi<BaseResponse>(
          () => bookingRepository.cancelScheduleDetail(
        cancelScheduleRequest: CancelScheduleRequest(
          scheduleDetailId: scheduleDetailId,
          cancelInfo: CancelInfo(cancelReasonId: cancelReasonId, note: note)
        )
      ),
      showLoading: false,
    );

    if (cancelScheduleResponse != null && cancelScheduleResponse.statusCode == ApiStatusCode.success) {
      cancelScheduleResponse.message?.let(showSuccessToast);
    }

    await getListStudentBookedClasses(reloadAllCurrentList: true);
  }

  void toggleExpandCollapse(int index) {
    final currentList = [...state.groupedBookingInfoList];
    if (index < 0 || index >= currentList.length) {
      return;
    }
    final currentGroupedItem = currentList[index];
    if (currentGroupedItem != null) {
      currentList[index] = currentGroupedItem.copyWith(isExpanded: !currentGroupedItem.isExpanded);
      emitNewState(state.copyWith(groupedBookingInfoList: currentList));
    }
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
