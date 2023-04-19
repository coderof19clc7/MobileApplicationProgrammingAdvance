import 'package:one_one_learn/core/models/responses/schedule/schedule_detail.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_info.dart';

class ScheduleCell {
  final String? id;
  final String? tutorId;
  final DateTime? startTimestamp;
  final DateTime? endTimestamp;
  final bool? isBooked;
  final List<ScheduleDetail>? scheduleDetails;

//<editor-fold desc="Data Methods">
  const ScheduleCell({
    this.id,
    this.tutorId,
    this.startTimestamp,
    this.endTimestamp,
    this.isBooked,
    this.scheduleDetails,
  });

  factory ScheduleCell.fromScheduleInfo(ScheduleInfo info) {
    return ScheduleCell(
      id: info.id,
      startTimestamp: DateTime.fromMillisecondsSinceEpoch(info.startTimestamp!, isUtc: true).toLocal(),
      endTimestamp: DateTime.fromMillisecondsSinceEpoch(info.endTimestamp!, isUtc: true).toLocal(),
      isBooked: info.isBooked,
      scheduleDetails: info.scheduleDetails,
      tutorId: info.tutorId,
    );
  }

  factory ScheduleCell.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<ScheduleDetail>? scheduleDetails;
    if (mapJson['scheduleDetails'] != null) {
      scheduleDetails = [];
      for (final v in mapJson['scheduleDetails'] as List) {
        scheduleDetails.add(ScheduleDetail.fromJson(v));
      }
    }

    return ScheduleCell(
      id: mapJson['id'] as String?,
      tutorId: mapJson['tutorId'] as String?,
      startTimestamp: mapJson['startTimestamp'] as DateTime?,
      endTimestamp: mapJson['endTimestamp'] as DateTime?,
      isBooked: mapJson['isBooked'] as bool?,
      scheduleDetails: scheduleDetails,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (scheduleDetails != null) {
      map['scheduleDetails'] = scheduleDetails!.map((v) => v.toJson()).toList();
    }

    map['id'] = id;
    map['tutorId'] = tutorId;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['isBooked'] = isBooked;
    return map;
  }

  @override
  String toString() {
    return 'ScheduleCell{'
        ' id: $id,'
        ' tutorId: $tutorId,'
        ' startTimestamp: $startTimestamp,'
        ' endTimestamp: $endTimestamp,'
        ' isBooked: $isBooked,'
        ' scheduleDetails: $scheduleDetails,'
        ' scheduleDetails: $scheduleDetails,'
        ' }';
  }

  ScheduleCell copyWith({
    String? id,
    String? tutorId,
    DateTime? startTimestamp,
    DateTime? endTimestamp,
    bool? isBooked,
    List<ScheduleDetail>? scheduleDetails,
  }) {
    return ScheduleCell(
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
      isBooked: isBooked ?? this.isBooked,
      scheduleDetails: scheduleDetails ?? this.scheduleDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tutorId': tutorId,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'isBooked': isBooked,
      'scheduleDetails': scheduleDetails,
    };
  }

  factory ScheduleCell.fromMap(Map<String, dynamic> map) {

    List<ScheduleDetail>? scheduleDetails;
    if (map['scheduleDetails'] != null) {
      scheduleDetails = [];
      for (final v in map['scheduleDetails'] as List) {
        scheduleDetails.add(ScheduleDetail.fromJson(v));
      }
    }

    return ScheduleCell(
      id: map['id'] as String?,
      tutorId: map['tutorId'] as String?,
      startTimestamp: map['startTimestamp'] as DateTime?,
      endTimestamp: map['endTimestamp'] as DateTime?,
      isBooked: map['isBooked'] as bool?,
      scheduleDetails: scheduleDetails,
    );
  }
//</editor-fold>
}
