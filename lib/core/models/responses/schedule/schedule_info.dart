import 'package:one_one_learn/core/models/responses/schedule/schedule_detail.dart';

class ScheduleInfo {
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
  const ScheduleInfo({
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

  ScheduleInfo copyWith({
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
    return ScheduleInfo(
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

  factory ScheduleInfo.fromMap(Map<String, dynamic> map) {

    List<ScheduleDetail>? scheduleDetails;
    if (map['scheduleDetails'] != null) {
      scheduleDetails = [];
      for (final v in map['scheduleDetails'] as List) {
        scheduleDetails.add(ScheduleDetail.fromJson(v));
      }
    }

    return ScheduleInfo(
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
