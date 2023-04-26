import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_cell.dart';

@immutable
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleColumn &&
          runtimeType == other.runtimeType &&
          date == other.date &&
         listEquals(scheduleCells, other.scheduleCells);

  @override
  int get hashCode => date.hashCode ^ scheduleCells.hashCode;

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
        scheduleCells.add(ScheduleCell.fromMap(v as Map<String, dynamic>));
      }
    }

    return ScheduleColumn(
      date: map['date'] as DateTime?,
      scheduleCells: scheduleCells,
    );
  }

//</editor-fold>
}
