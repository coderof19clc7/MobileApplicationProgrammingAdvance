import 'package:one_one_learn/core/models/requests/base_request.dart';

class ScheduleByTutorIdRequest extends BaseRequest {
  final String? tutorId;
  final int? startTimestamp;
  final int? endTimestamp;

  const ScheduleByTutorIdRequest({
    this.tutorId,
    this.startTimestamp,
    this.endTimestamp,
  });

  ScheduleByTutorIdRequest copyWith({
    String? tutorId,
    int? startTimestamp,
    int? endTimestamp,
  }) {
    return ScheduleByTutorIdRequest(
      tutorId: tutorId ?? this.tutorId,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
    );
  }

  factory ScheduleByTutorIdRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return ScheduleByTutorIdRequest(
      tutorId: mapJson['tutorId'] as String?,
      startTimestamp: mapJson['startTimestamp'] as int?,
      endTimestamp: mapJson['endTimestamp'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tutorId != null) {
      map['tutorId'] = tutorId;
    }
    if (startTimestamp != null) {
      map['startTimestamp'] = startTimestamp;
    }
    if (endTimestamp != null) {
      map['endTimestamp'] = endTimestamp;
    }
    return map;
  }

  @override
  List<Object?> get props => [tutorId, startTimestamp, endTimestamp];

  @override
  String toString() {
    return 'ScheduleQueryRequest{'
        ' tutorId: $tutorId,'
        ' startTimestamp: $startTimestamp,'
        ' endTimestamp: $endTimestamp'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'tutorId': tutorId,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
    };
  }

  factory ScheduleByTutorIdRequest.fromMap(Map<String, dynamic> map) {
    return ScheduleByTutorIdRequest(
      tutorId: map['tutorId'] as String?,
      startTimestamp: map['startTimestamp'] as int?,
      endTimestamp: map['endTimestamp'] as int?,
    );
  }
}
