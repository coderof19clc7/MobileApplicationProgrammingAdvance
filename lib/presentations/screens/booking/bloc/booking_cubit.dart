
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/booking_schedule_request.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/schedule_by_tutor_id_request.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_schedule_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_cell.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_column.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_by_tutor_id_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_info.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_table.dart';
import 'package:one_one_learn/core/models/responses/user/user_info_response.dart';
import 'package:one_one_learn/core/network/repositories/booking_repository.dart';
import 'package:one_one_learn/core/network/repositories/schedule_repository.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';

part 'booking_state.dart';

class BookingCubit extends WidgetCubit<BookingState> {
  BookingCubit({required String tutorId, required String tutorName})
      : super(widgetState: BookingState(tutorId: tutorId, tutorName: tutorName)) {
    onChangeStartDateTime(getToDayDate());
  }

  final userRepository = injector<UserRepository>();
  final bookingRepository = injector<BookingRepository>();
  final _scheduleRepository = injector<ScheduleRepository>();
  // List<String> headerData = [];
  final _initialColumn = [
    ...List.generate(
      48,
          (index) => ScheduleCell(
        startTimestamp: DateTime(
          1970,
          1,
          1,
          (index / 2).truncate(), // 14 / 2 = 7 ; 15 / 2 = 7.5 -> 7
          index.isOdd ? 30 : 0, // 14 -> 0 ; 15 -> 30
        ), // 07:00 ; 07:30
        endTimestamp: DateTime(
          1970,
          1,
          1,
          (index / 2).truncate(), // 14 / 2 = 7 ; 15 / 2 = 7.5 -> 7
          index.isOdd ? 55 : 25, // 14 -> 25 ; 15 -> 55
        ), // 07:25 ; 07:55
      ),
    )
  ];

  @override
  void onWidgetCreated() {}

  DateTime getToDayDate() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void onChangeStartDateTime(DateTime newStartDateTime) {
    final newEndDateTime = newStartDateTime.add(const Duration(days: 6));
    emitNewState(state.copyWith(
      currentStartDateTime: newStartDateTime,
      currentEndDateTime: newEndDateTime,
    ));

    // initialize table if needed
    if (state.scheduleTable.days?.isNotEmpty != true) {
      initScheduleTable();
    }

    getScheduleOfTutor(newStartDateTime, newEndDateTime);
  }

  void initScheduleTable() {
    final startTimestamp = state.currentStartDateTime ?? getToDayDate();
    final endTimestamp = state.currentEndDateTime ?? startTimestamp.add(const Duration(days: 6));

    final dayTimes = <ScheduleColumn>[];
    for (var i = 0; i < 7; i++) {
      final dayTime = startTimestamp.add(Duration(days: i));
      dayTimes.add(ScheduleColumn(
        date: dayTime,
        scheduleCells: _initialColumn.map((e) => e).toList(),
      ));
      if (dayTime.difference(endTimestamp).inDays > 0) {
        break;
      }
    }
    emitNewState(state.copyWith(
      scheduleTable: ScheduleTable(days: dayTimes),
    ));
  }

  Future<void> getScheduleOfTutor(DateTime startTimestamp, DateTime endTimestamp, {
    bool showLoading = true,
  }) async {
    final scheduleByTutorIDResponse = await fetchApi<ScheduleByTutorIDResponse>(
      () async => _scheduleRepository.getScheduleOfTutor(
        query: ScheduleByTutorIdRequest(
          tutorId: state.tutorId,
          startTimestamp: startTimestamp.millisecondsSinceEpoch,
          endTimestamp: endTimestamp.millisecondsSinceEpoch,
        ),
      ),
      showLoading: showLoading,
    );

    initScheduleTable();
    final scheduleTable = state.scheduleTable.copyWith();

    // organize schedules into table
    if (scheduleByTutorIDResponse != null) {
      if (scheduleByTutorIDResponse.statusCode == ApiStatusCode.success) {
        final scheduleOfTutor = scheduleByTutorIDResponse.scheduleOfTutor ?? <ScheduleInfo>[];
        if (scheduleOfTutor.isNotEmpty) {
          for (final scheduleInfo in scheduleOfTutor) {
            if (scheduleInfo.startTimestamp != null) {
              // convert to model using DateTime instead of unix timestamp
              final scheduleCell = ScheduleCell.fromScheduleInfo(scheduleInfo);
              // find which dayTime the schedule belongs to
              final columnIndex = scheduleTable.days?.indexWhere(
                (column) => column.date?.day == scheduleCell.startTimestamp?.day
              ) ?? -1;
              if (columnIndex > -1) {
                // find which time slot the schedule belongs to
                final rowIndex = scheduleTable.days?[columnIndex].scheduleCells?.indexWhere(
                  (info) => info.startTimestamp?.hour == scheduleCell.startTimestamp?.hour
                      && info.startTimestamp?.minute == scheduleCell.startTimestamp?.minute,
                ) ?? -1;
                if (rowIndex > -1) {
                  // replace initial cell with schedule
                  scheduleTable.days?[columnIndex].scheduleCells?[rowIndex] = scheduleCell;
                }
              }
            }
          }
        }
      }
    }

    emitNewState(state.copyWith(scheduleTable: scheduleTable));
  }

  void onChangeWeekButtonTap(int action) {
    final currentStartDateTime = state.currentStartDateTime ?? getToDayDate();
    final newStartDateTime = action == 0
        ? getToDayDate()
        : currentStartDateTime.add(Duration(days: action * 7));
    onChangeStartDateTime(newStartDateTime);
  }

  Future<void> bookingSchedule(String scheduleId, String notes, {
    Future<void> Function()? onBookingComplete,
  }) async {
    final bookingScheduleResponse = await fetchApi<BookingScheduleResponse>(
      () async => bookingRepository.bookingSchedule(
        bookingScheduleRequest: BookingScheduleRequest(
          scheduleDetailIds: [scheduleId], note: notes,
        ),
      ),
      showLoading: false,
    );

    // list future callback to run after the booking is completed
    final listFutureCallbackToRun = <Future<void>>[
      getScheduleOfTutor(
        state.currentStartDateTime ?? getToDayDate(),
        state.currentEndDateTime ?? getToDayDate().add(const Duration(days: 6)),
        showLoading: false,
      ),
    ];

    var needShowSuccessToast = false;
    if (bookingScheduleResponse != null) {
      if (bookingScheduleResponse.statusCode == ApiStatusCode.success) {
        needShowSuccessToast = true;
      }
    }

    if (onBookingComplete != null) {
      listFutureCallbackToRun.add(onBookingComplete());
    }
    await Future.wait(listFutureCallbackToRun);
    if (needShowSuccessToast) {
      showSuccessToast(bookingScheduleResponse?.message);
    }
  }
}
