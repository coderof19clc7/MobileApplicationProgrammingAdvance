import 'package:one_one_learn/core/models/requests/base_request.dart';

class BookingScheduleRequest extends BaseRequest {
  final String? note;
  final List<String>? scheduleDetailIds;

  const BookingScheduleRequest({
    this.note,
    this.scheduleDetailIds,
  });

  BookingScheduleRequest copyWith({
    String? note,
    List<String>? scheduleDetailIds,
  }) {
    return BookingScheduleRequest(
      note: note ?? this.note,
      scheduleDetailIds: scheduleDetailIds ?? this.scheduleDetailIds,
    );
  }

  factory BookingScheduleRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return BookingScheduleRequest(
      note: mapJson['note'] as String?,
      scheduleDetailIds: mapJson['scheduleDetailIds'] != null
          ? (mapJson['scheduleDetailIds'] as List).map((e) => e as String).toList()
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (note != null) map['note'] = note;
    if (scheduleDetailIds != null) map['scheduleDetailIds'] = scheduleDetailIds;
    return map;
  }

  @override
  List<Object?> get props => [note, scheduleDetailIds];

  @override
  String toString() {
    return 'BookingScheduleRequest{'
        ' note: $note,'
        ' scheduleDetailIds: $scheduleDetailIds,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'note': note,
      'scheduleDetailIds': scheduleDetailIds,
    };
  }

  factory BookingScheduleRequest.fromMap(Map<String, dynamic> map) {
    return BookingScheduleRequest(
      note: map['note'] as String?,
      scheduleDetailIds: map['scheduleDetailIds'] != null
          ? (map['scheduleDetailIds'] as List).map((e) => e as String).toList()
          : null,
    );
  }
}
