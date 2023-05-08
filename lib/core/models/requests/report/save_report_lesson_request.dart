import 'package:one_one_learn/core/models/requests/base_request.dart';

class SaveReportLessonRequest extends BaseRequest {

  @override
  List<Object?> get props => [reasonId, note];

//<editor-fold desc="Data Methods">
  const SaveReportLessonRequest({
    this.bookingId,
    this.reasonId,
    this.note,
  });

  factory SaveReportLessonRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return SaveReportLessonRequest(
      bookingId: mapJson['bookingId'] as String?,
      reasonId: mapJson['reasonId'] as int?,
      note: mapJson['note'] as String?,
    );
  }

  final String? bookingId;
  final int? reasonId;
  final String? note;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (bookingId?.isNotEmpty == true) {
      map['bookingId'] = bookingId;
    }
    if (reasonId != null) {
      map['reasonId'] = reasonId;
    }
    if (note?.isNotEmpty == true) {
      map['note'] = note;
    }
    return map;
  }

  @override
  String toString() {
    return 'ReportTutorRequest{'
        ' bookingId: $bookingId,'
        ' reasonId: $reasonId,'
        ' note: $note,'
        ' }';
  }

  SaveReportLessonRequest copyWith({
    String? bookingId,
    int? reasonId,
    String? note,
  }) {
    return SaveReportLessonRequest(
      bookingId: bookingId ?? this.bookingId,
      reasonId: reasonId ?? this.reasonId,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'reasonId': reasonId,
      'note': note,
    };
  }

  factory SaveReportLessonRequest.fromMap(Map<String, dynamic> map) {
    return SaveReportLessonRequest(
      bookingId: map['bookingId'] as String?,
      reasonId: map['reasonId'] as int?,
      note: map['note'] as String?,
    );
  }

//</editor-fold>
}
