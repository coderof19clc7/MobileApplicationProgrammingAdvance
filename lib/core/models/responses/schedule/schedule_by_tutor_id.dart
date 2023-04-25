import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_detail.dart';

@immutable
class ScheduleByTutorID {
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? createdAt;
  final bool? isBooked;
  final List<ScheduleDetail>? scheduleDetails;

//<editor-fold desc="Data Methods">
  const ScheduleByTutorID({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.scheduleDetails,
  });

  factory ScheduleByTutorID.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<ScheduleDetail>? scheduleDetails;
    if (mapJson['scheduleDetails'] != null) {
      scheduleDetails = [];
      for (final v in mapJson['scheduleDetails'] as List) {
        scheduleDetails.add(ScheduleDetail.fromJson(v));
      }
    }

    return ScheduleByTutorID(
      id: mapJson['id'] as String?,
      tutorId: mapJson['tutorId'] as String?,
      startTime: mapJson['startTime'] as String?,
      endTime: mapJson['endTime'] as String?,
      startTimestamp: mapJson['startTimestamp'] as int?,
      endTimestamp: mapJson['endTimestamp'] as int?,
      createdAt: mapJson['createdAt'] as String?,
      isBooked: mapJson['isBooked'] as bool?,
      scheduleDetails: scheduleDetails,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['tutorId'] = tutorId;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['createdAt'] = createdAt;
    map['isBooked'] = isBooked;
    if (scheduleDetails != null) {
      map['scheduleDetails'] = scheduleDetails!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ScheduleByTutorID &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              tutorId == other.tutorId &&
              startTime == other.startTime &&
              endTime == other.endTime &&
              startTimestamp == other.startTimestamp &&
              endTimestamp == other.endTimestamp &&
              createdAt == other.createdAt &&
              isBooked == other.isBooked &&
              listEquals(scheduleDetails, other.scheduleDetails));

  @override
  int get hashCode =>
      id.hashCode ^
      tutorId.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      startTimestamp.hashCode ^
      endTimestamp.hashCode ^
      createdAt.hashCode ^
      isBooked.hashCode ^
      scheduleDetails.hashCode;

  @override
  String toString() {
    return 'ScheduleInfo{'
        ' id: $id,'
        ' tutorId: $tutorId,'
        ' startTime: $startTime,'
        ' endTime: $endTime,'
        ' startTimestamp: $startTimestamp,'
        ' endTimestamp: $endTimestamp,'
        ' createdAt: $createdAt,'
        ' isBooked: $isBooked,'
        ' scheduleDetails: $scheduleDetails,'
        ' }';
  }

  ScheduleByTutorID copyWith({
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    int? startTimestamp,
    int? endTimestamp,
    String? createdAt,
    bool? isBooked,
    List<ScheduleDetail>? scheduleDetails,
  }) {
    return ScheduleByTutorID(
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
      createdAt: createdAt ?? this.createdAt,
      isBooked: isBooked ?? this.isBooked,
      scheduleDetails: scheduleDetails ?? this.scheduleDetails,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['tutorId'] = tutorId;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['createdAt'] = createdAt;
    map['isBooked'] = isBooked;
    if (scheduleDetails != null) {
      map['scheduleDetails'] = scheduleDetails!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  factory ScheduleByTutorID.fromMap(Map<String, dynamic> map) {

    List<ScheduleDetail>? scheduleDetails;
    if (map['scheduleDetails'] != null) {
      scheduleDetails = [];
      for (final v in map['scheduleDetails'] as List) {
        scheduleDetails.add(ScheduleDetail.fromMap(v as Map<String, dynamic>));
      }
    }

    return ScheduleByTutorID(
      id: map['id'] as String?,
      tutorId: map['tutorId'] as String?,
      startTime: map['startTime'] as String?,
      endTime: map['endTime'] as String?,
      startTimestamp: map['startTimestamp'] as int?,
      endTimestamp: map['endTimestamp'] as int?,
      createdAt: map['createdAt'] as String?,
      isBooked: map['isBooked'] as bool?,
      scheduleDetails: scheduleDetails,
    );
  }

//</editor-fold>
}
