import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/schedule/schedule_by_tutor_id_request.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_cell.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_column.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_by_tutor_id_response.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_table.dart';
import 'package:one_one_learn/core/network/repositories/schedule_repository.dart';

part 'booking_state.dart';

class BookingCubit extends WidgetCubit<BookingState> {
  BookingCubit({
    required String tutorId,
  }) : super(widgetState: BookingState(tutorId: tutorId));

  final _scheduleRepository = injector<ScheduleRepository>();
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

  Future getScheduleOfTutor(DateTime startTimestamp, DateTime endTimestamp) async {
    final scheduleInfoResponse = await fetchApi(
      () async => _scheduleRepository.getScheduleOfTutor(
        query: ScheduleByTutorIdRequest(
          tutorId: state.tutorId,
          startTimestamp: startTimestamp.millisecondsSinceEpoch,
          endTimestamp: endTimestamp.millisecondsSinceEpoch,
        ),
      ),
    );

    // initialize table
    final days = <ScheduleColumn>[];

    for (var i = 0; i < 7; i++) {
      final day = startTimestamp.add(Duration(days: i));
      days.add(ScheduleColumn(
        date: day,
        scheduleCells: _initialColumn.map((e) => e).toList(),
      ));
      if (day.day >= endTimestamp.day) {
        break;
      }
    }

    final scheduleTable = ScheduleTable(days: days);

    // organize schedules into table
    if (scheduleInfoResponse != null && scheduleInfoResponse is ScheduleByTutorIDResponse && scheduleInfoResponse.scheduleOfTutor != null && scheduleInfoResponse.scheduleOfTutor!.isNotEmpty) {
      for (final scheduleInfo in scheduleInfoResponse.scheduleOfTutor!) {
        if (scheduleInfo.startTimestamp != null) {
          // convert to model using DateTime instead of unix timestamp
          final scheduleCell = ScheduleCell.fromScheduleInfo(scheduleInfo);
          // find which day the schedule belongs to
          final columnIndex = scheduleTable.days!.indexWhere((column) => column.date!.day == scheduleCell.startTimestamp!.day);
          if (columnIndex > -1) {
            // find which time slot the schedule belongs to
            final rowIndex = scheduleTable.days![columnIndex].scheduleCells!.indexWhere(
              (info) => info.startTimestamp!.hour == scheduleCell.startTimestamp!.hour && info.startTimestamp!.minute == scheduleCell.startTimestamp!.minute,
            );
            if (rowIndex > -1) {
              // replace initial cell with schedule
              scheduleTable.days![columnIndex].scheduleCells![rowIndex] = scheduleCell;
            }
          }
        }
      }
    }
    
    emit(state.copyWith(scheduleTable: scheduleTable));
  }

  @override
  void onWidgetCreated() {}
}
