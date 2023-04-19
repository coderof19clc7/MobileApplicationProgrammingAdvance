import 'package:one_one_learn/core/models/responses/schedule/schedule_column.dart';

class ScheduleTable {
  final List<ScheduleColumn>? days;

//<editor-fold desc="Data Methods">
  const ScheduleTable({
    this.days,
  });

  factory ScheduleTable.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<ScheduleColumn>? days;
    if (mapJson['days'] != null) {
      days = [];
      for (final v in mapJson['days'] as List) {
        days.add(ScheduleColumn.fromJson(v));
      }
    }

    return ScheduleTable(
      days: days,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (days != null) {
      map['days'] = days!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  @override
  String toString() {
    return 'ScheduleTable{'
        ' days: $days,'
        ' }';
  }

  ScheduleTable copyWith({
    List<ScheduleColumn>? days,
  }) {
    return ScheduleTable(
      days: days ?? this.days,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    if (days != null) {
      map['days'] = days!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  factory ScheduleTable.fromMap(Map<String, dynamic> map) {

    List<ScheduleColumn>? days;
    if (map['days'] != null) {
      days = [];
      for (final v in map['days'] as List) {
        days.add(ScheduleColumn.fromJson(v));
      }
    }

    return ScheduleTable(
      days: days,
    );
  }

//</editor-fold>
}
