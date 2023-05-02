import 'package:flutter/foundation.dart';

@immutable
class ReportTutorInfo {
  const ReportTutorInfo({
    this.id,
    this.userId,
    this.tutorId,
    this.content,
    this.updatedAt,
    this.createdAt,
  });

  factory ReportTutorInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return ReportTutorInfo(
      id: mapJson['id'] as String?,
      userId: mapJson['userId'] as String?,
      tutorId: mapJson['tutorId'] as String?,
      content: mapJson['content'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      createdAt: mapJson['createdAt'] as String?,
    );
  }

  final String? id;
  final String? userId;
  final String? tutorId;
  final String? content;
  final String? updatedAt;
  final String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['tutorId'] = tutorId;
    map['content'] = content;
    map['updatedAt'] = updatedAt;
    map['createdAt'] = createdAt;
    return map;
  }

  ReportTutorInfo copyWith({
    String? id,
    String? userId,
    String? tutorId,
    String? content,
    String? updatedAt,
    String? createdAt,
  }) => ReportTutorInfo(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    tutorId: tutorId ?? this.tutorId,
    content: content ?? this.content,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
  );

  @override
  String toString() {
    return 'ReportTutorInfo{'
        ' id: $id,'
        ' userId: $userId,'
        ' tutorId: $tutorId,'
        ' content: $content,'
        ' updatedAt: $updatedAt,'
        ' createdAt: $createdAt'
        ' }';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportTutorInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          tutorId == other.tutorId &&
          content == other.content &&
          updatedAt == other.updatedAt &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      tutorId.hashCode ^
      content.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'tutorId': tutorId,
      'content': content,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory ReportTutorInfo.fromMap(Map<String, dynamic> map) {
    return ReportTutorInfo(
      id: map['id'] as String?,
      userId: map['userId'] as String?,
      tutorId: map['tutorId'] as String?,
      content: map['content'] as String?,
      updatedAt: map['updatedAt'] as String?,
      createdAt: map['createdAt'] as String?,
    );
  }
}
