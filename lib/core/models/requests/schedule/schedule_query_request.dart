import 'package:one_one_learn/core/models/requests/base_request.dart';

class ScheduleQueryRequest extends BaseRequest {
  final String? tutorId;
  final int? startTimestamp;
  final int? endTimestamp;

  const ScheduleQueryRequest({this.tutorId, this.startTimestamp, this.endTimestamp});

  ScheduleQueryRequest copyWith({String? tutorId, int? startTimestamp, int? endTimestamp}) {
    return ScheduleQueryRequest(
      tutorId: tutorId ?? this.tutorId,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tutorId'] = tutorId;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
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
}
