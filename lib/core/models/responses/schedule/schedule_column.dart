import 'package:one_one_learn/core/models/responses/schedule/schedule_cell.dart';

class ScheduleColumn {
  final DateTime? date;
  final List<ScheduleCell>? scheduleCells;

//<editor-fold desc="Data Methods">
  const ScheduleColumn({
    this.date,
    this.scheduleCells,
  });

  factory ScheduleColumn.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<ScheduleCell>? scheduleCells;
    if (mapJson['scheduleCells'] != null) {
      scheduleCells = [];
      for (final v in mapJson['scheduleCells'] as List) {
        scheduleCells.add(ScheduleCell.fromJson(v));
      }
    }

    return ScheduleColumn(
      date: mapJson['date'] as DateTime?,
      scheduleCells: scheduleCells,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;

    if (scheduleCells != null) {
      map['scheduleCells'] = scheduleCells!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  @override
  String toString() {
    return 'ScheduleColumn{'
        ' date: $date,'
        ' scheduleCells: $scheduleCells,'
        ' }';
  }

  ScheduleColumn copyWith({
    DateTime? date,
    List<ScheduleCell>? scheduleCells,
  }) {
    return ScheduleColumn(
      date: date ?? this.date,
      scheduleCells: scheduleCells ?? this.scheduleCells,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['date'] = date;

    if (scheduleCells != null) {
      map['scheduleCells'] = scheduleCells!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  factory ScheduleColumn.fromMap(Map<String, dynamic> map) {

    List<ScheduleCell>? scheduleCells;
    if (map['scheduleCells'] != null) {
      scheduleCells = [];
      for (final v in map['scheduleCells'] as List) {
        scheduleCells.add(ScheduleCell.fromJson(v));
      }
    }

    return ScheduleColumn(
      date: map['date'] as DateTime?,
      scheduleCells: scheduleCells,
    );
  }

//</editor-fold>
}
