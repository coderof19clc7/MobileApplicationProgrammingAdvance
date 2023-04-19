import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_info.dart';

class ScheduleInfoResponse extends BaseResponse {
  final List<ScheduleInfo>? scheduleOfTutor;

  @override
  List<Object?> get props => [...super.props, scheduleOfTutor];

  const ScheduleInfoResponse({
    super.message,
    this.scheduleOfTutor,
  });

  factory ScheduleInfoResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<ScheduleInfo>? scheduleOfTutor;
    if (mapJson['scheduleOfTutor'] != null) {
      scheduleOfTutor = [];
      for (final v in mapJson['scheduleOfTutor'] as List) {
        scheduleOfTutor.add(ScheduleInfo.fromJson(v));
      }
    }

    return ScheduleInfoResponse(
      message: mapJson['message'] as String?,
      scheduleOfTutor: scheduleOfTutor,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (scheduleOfTutor != null) {
      map['scheduleOfTutor'] = scheduleOfTutor!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  ScheduleInfoResponse copyWith({
    String? message,
    List<ScheduleInfo>? scheduleOfTutor,
  }) {
    return ScheduleInfoResponse(
      message: message ?? this.message,
      scheduleOfTutor: scheduleOfTutor ?? this.scheduleOfTutor,
    );
  }

  @override
  String toString() {
    return 'ScheduleResponse{'
        ' message: $message,'
        ' scheduleOfTutor: $scheduleOfTutor'
        ' }';
  }
}
