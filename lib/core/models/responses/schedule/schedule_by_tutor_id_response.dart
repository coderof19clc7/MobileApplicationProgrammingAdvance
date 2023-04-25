import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_by_tutor_id.dart';

class ScheduleByTutorIDResponse extends BaseResponse {
  final List<ScheduleByTutorID>? scheduleOfTutor;

  @override
  List<Object?> get props => [...super.props, scheduleOfTutor];

  const ScheduleByTutorIDResponse({
    super.statusCode,
    super.message,
    this.scheduleOfTutor,
  });

  factory ScheduleByTutorIDResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<ScheduleByTutorID>? scheduleOfTutor;
    if (mapJson['scheduleOfTutor'] != null) {
      scheduleOfTutor = [];
      for (final v in mapJson['scheduleOfTutor'] as List) {
        scheduleOfTutor.add(ScheduleByTutorID.fromJson(v));
      }
    }

    return ScheduleByTutorIDResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      scheduleOfTutor: scheduleOfTutor,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final mapJson = <String, dynamic>{};
    mapJson['statusCode'] = statusCode;
    mapJson['message'] = message;

    if (scheduleOfTutor != null) {
      mapJson['scheduleOfTutor'] = scheduleOfTutor!.map((v) => v.toJson()).toList();
    }

    return mapJson;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ScheduleByTutorIDResponse &&
              runtimeType == other.runtimeType &&
              statusCode == other.statusCode &&
              message == other.message &&
              listEquals(scheduleOfTutor, other.scheduleOfTutor));

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ scheduleOfTutor.hashCode;

  ScheduleByTutorIDResponse copyWith({
    int? statusCode,
    String? message,
    List<ScheduleByTutorID>? scheduleOfTutor,
  }) {
    return ScheduleByTutorIDResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      scheduleOfTutor: scheduleOfTutor ?? this.scheduleOfTutor,
    );
  }

  @override
  String toString() {
    return 'ScheduleResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' scheduleOfTutor: $scheduleOfTutor'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'scheduleOfTutor': scheduleOfTutor,
    };
  }

  factory ScheduleByTutorIDResponse.fromMap(Map<String, dynamic> map) {
    List<ScheduleByTutorID>? scheduleOfTutor;
    if (map['scheduleOfTutor'] != null) {
      scheduleOfTutor = [];
      for (final v in map['scheduleOfTutor'] as List) {
        scheduleOfTutor.add(ScheduleByTutorID.fromMap(v as Map<String, dynamic>));
      }
    }

    return ScheduleByTutorIDResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      scheduleOfTutor: scheduleOfTutor,
    );
  }
}
