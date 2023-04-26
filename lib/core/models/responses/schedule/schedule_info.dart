import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_detail.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';

@immutable
class ScheduleInfo {
  final String? date;
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? createdAt;
  final String? updateAt;
  final bool? isDeleted;
  final bool? isBooked;
  final TutorInfo? tutorInfo;
  final List<ScheduleDetail>? scheduleDetails;

//<editor-fold desc="Data Methods">
  const ScheduleInfo({
    this.date,
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.updateAt,
    this.isDeleted,
    this.isBooked,
    this.tutorInfo,
    this.scheduleDetails,
  });

  factory ScheduleInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<ScheduleDetail>? scheduleDetails;
    if (mapJson['scheduleDetails'] != null) {
      scheduleDetails = [];
      for (final v in mapJson['scheduleDetails'] as List) {
        scheduleDetails.add(ScheduleDetail.fromJson(v));
      }
    }

    return ScheduleInfo(
      date: mapJson['date'] as String?,
      id: mapJson['id'] as String?,
      tutorId: mapJson['tutorId'] as String?,
      startTime: mapJson['startTime'] as String?,
      endTime: mapJson['endTime'] as String?,
      startTimestamp: mapJson['startTimestamp'] as int?,
      endTimestamp: mapJson['endTimestamp'] as int?,
      createdAt: mapJson['createdAt'] as String?,
      updateAt: mapJson['updateAt'] as String?,
      isDeleted: mapJson['isDeleted'] as bool?,
      isBooked: mapJson['isBooked'] as bool?,
      tutorInfo: mapJson['tutorInfo'] != null
          ? TutorInfo.fromJson(mapJson['tutorInfo'])
          : null,
      scheduleDetails: scheduleDetails,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['date'] = date;
    map['id'] = id;
    map['tutorId'] = tutorId;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['createdAt'] = createdAt;
    map['updateAt'] = updateAt;
    map['isDeleted'] = isDeleted;
    map['isBooked'] = isBooked;
    if (tutorInfo != null) {
      map['tutorInfo'] = tutorInfo!.toJson();
    }
    if (scheduleDetails != null) {
      map['scheduleDetails'] = scheduleDetails!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ScheduleInfo &&
              runtimeType == other.runtimeType &&
              date == other.date &&
              id == other.id &&
              tutorId == other.tutorId &&
              startTime == other.startTime &&
              endTime == other.endTime &&
              startTimestamp == other.startTimestamp &&
              endTimestamp == other.endTimestamp &&
              createdAt == other.createdAt &&
              updateAt == other.updateAt &&
              isDeleted == other.isDeleted &&
              isBooked == other.isBooked  &&
              tutorInfo == other.tutorInfo &&
              listEquals(scheduleDetails, other.scheduleDetails));

  @override
  int get hashCode =>
      date.hashCode ^
      id.hashCode ^
      tutorId.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      startTimestamp.hashCode ^
      endTimestamp.hashCode ^
      createdAt.hashCode ^
      updateAt.hashCode ^
      isDeleted.hashCode ^
      isBooked.hashCode ^
      tutorInfo.hashCode ^
      scheduleDetails.hashCode;

  @override
  String toString() {
    return 'ScheduleInfo{'
        ' date: $date,'
        ' id: $id,'
        ' tutorId: $tutorId,'
        ' startTime: $startTime,'
        ' endTime: $endTime,'
        ' startTimestamp: $startTimestamp,'
        ' endTimestamp: $endTimestamp,'
        ' createdAt: $createdAt,'
        ' updateAt: $updateAt,'
        ' isDeleted: $isDeleted,'
        ' isBooked: $isBooked,'
        ' tutorInfo: $tutorInfo,'
        ' scheduleDetails: $scheduleDetails,'
        ' }';
  }

  ScheduleInfo copyWith({
    String? date,
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    int? startTimestamp,
    int? endTimestamp,
    String? createdAt,
    String? updateAt,
    bool? isDeleted,
    bool? isBooked,
    TutorInfo? tutorInfo,
    List<ScheduleDetail>? scheduleDetails,
  }) {
    return ScheduleInfo(
      date: date ?? this.date,
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      isDeleted: isDeleted ?? this.isDeleted,
      isBooked: isBooked ?? this.isBooked,
      tutorInfo: tutorInfo ?? this.tutorInfo,
      scheduleDetails: scheduleDetails ?? this.scheduleDetails,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    map['date'] = date;
    map['id'] = id;
    map['tutorId'] = tutorId;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['createdAt'] = createdAt;
    map['updateAt'] = updateAt;
    map['isDeleted'] = isDeleted;
    map['isBooked'] = isBooked;
    if (tutorInfo != null) {
      map['tutorInfo'] = tutorInfo!.toJson();
    }
    if (scheduleDetails != null) {
      map['scheduleDetails'] = scheduleDetails!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  factory ScheduleInfo.fromMap(Map<String, dynamic> map) {

    List<ScheduleDetail>? scheduleDetails;
    if (map['scheduleDetails'] != null) {
      scheduleDetails = [];
      for (final v in map['scheduleDetails'] as List) {
        scheduleDetails.add(ScheduleDetail.fromMap(v as Map<String, dynamic>));
      }
    }

    return ScheduleInfo(
      date: map['date'] as String?,
      id: map['id'] as String?,
      tutorId: map['tutorId'] as String?,
      startTime: map['startTime'] as String?,
      endTime: map['endTime'] as String?,
      startTimestamp: map['startTimestamp'] as int?,
      endTimestamp: map['endTimestamp'] as int?,
      createdAt: map['createdAt'] as String?,
      updateAt: map['updateAt'] as String?,
      isDeleted: map['isDeleted'] as bool?,
      isBooked: map['isBooked'] as bool?,
      tutorInfo: map['tutorInfo'] != null
          ? TutorInfo.fromMap(map['tutorInfo'] as Map<String, dynamic>)
          : null,
      scheduleDetails: scheduleDetails,
    );
  }

//</editor-fold>
}
