import 'package:flutter/foundation.dart';

@immutable
class SaveReportLessonInfo {
  const SaveReportLessonInfo({
    this.id,
    this.bookingId,
    this.reasonId,
    this.note,
    this.updatedAt,
    this.createdAt,
  });

  factory SaveReportLessonInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return SaveReportLessonInfo(
      id: mapJson['id'] as String?,
      bookingId: mapJson['bookingId'] as String?,
      reasonId: mapJson['reasonId'] as int?,
      note: mapJson['note'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      createdAt: mapJson['createdAt'] as String?,
    );
  }

  final String? id;
  final String? bookingId;
  final int? reasonId;
  final String? note;
  final String? updatedAt;
  final String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['bookingId'] = bookingId;
    map['reasonId'] = reasonId;
    map['note'] = note;
    map['updatedAt'] = updatedAt;
    map['createdAt'] = createdAt;
    return map;
  }

  SaveReportLessonInfo copyWith({
    String? id,
    String? bookingId,
    int? reasonId,
    String? note,
    String? updatedAt,
    String? createdAt,
  }) => SaveReportLessonInfo(
    id: id ?? this.id,
    bookingId: bookingId ?? this.bookingId,
    reasonId: reasonId ?? this.reasonId,
    note: note ?? this.note,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
  );

  @override
  String toString() {
    return 'SaveReportLessonInfo{'
        ' id: $id,'
        ' bookingId: $bookingId,'
        ' reasonId: $reasonId,'
        ' note: $note,'
        ' updatedAt: $updatedAt,'
        ' createdAt: $createdAt'
        ' }';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SaveReportLessonInfo &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              bookingId == other.bookingId &&
              reasonId == other.reasonId &&
              note == other.note &&
              updatedAt == other.updatedAt &&
              createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^
      bookingId.hashCode ^
      reasonId.hashCode ^
      note.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bookingId': bookingId,
      'reasonId': reasonId,
      'note': note,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory SaveReportLessonInfo.fromMap(Map<String, dynamic> map) {
    return SaveReportLessonInfo(
      id: map['id'] as String?,
      bookingId: map['bookingId'] as String?,
      reasonId: map['reasonId'] as int?,
      note: map['note'] as String?,
      updatedAt: map['updatedAt'] as String?,
      createdAt: map['createdAt'] as String?,
    );
  }
}
