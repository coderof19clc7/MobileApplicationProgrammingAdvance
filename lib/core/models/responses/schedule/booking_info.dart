import 'package:flutter/foundation.dart';

@immutable
class BookingInfo {
  final String? id;
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? userId;
  final String? scheduleDetailId;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final String? studentRequest;
  final String? tutorReview;
  final String? scoreByTutor;
  final String? createdAt;
  final String? updatedAt;
  final String? recordUrl;
  final int? cancelReasonId;
  final String? lessonPlanId;
  final String? cancelNote;
  final String? calendarId;
  final bool? isDeleted;

//<editor-fold desc="Data Methods">
  const BookingInfo({
    this.id,
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    this.isDeleted,
  });

  factory BookingInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    return BookingInfo(
      id: mapJson['id'] as String?,
      createdAtTimeStamp: mapJson['createdAtTimeStamp'] as int?,
      updatedAtTimeStamp: mapJson['updatedAtTimeStamp'] as int?,
      userId: mapJson['userId'] as String?,
      scheduleDetailId: mapJson['scheduleDetailId'] as String?,
      tutorMeetingLink: mapJson['tutorMeetingLink'] as String?,
      studentMeetingLink: mapJson['studentMeetingLink'] as String?,
      studentRequest: mapJson['studentRequest'] as String?,
      tutorReview: mapJson['tutorReview'] as String?,
      scoreByTutor: mapJson['scoreByTutor'] as String?,
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      recordUrl: mapJson['recordUrl'] as String?,
      cancelReasonId: mapJson['cancelReasonId'] as int?,
      lessonPlanId: mapJson['lessonPlanId'] as String?,
      isDeleted: mapJson['isDeleted'] as bool?,
      cancelNote: mapJson['cancelNote'] as String?,
      calendarId: mapJson['calendarId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['createdAtTimeStamp'] = createdAtTimeStamp;
    map['updatedAtTimeStamp'] = updatedAtTimeStamp;
    map['userId'] = userId;
    map['scheduleDetailId'] = scheduleDetailId;
    map['tutorMeetingLink'] = tutorMeetingLink;
    map['studentMeetingLink'] = studentMeetingLink;
    map['studentRequest'] = studentRequest;
    map['tutorReview'] = tutorReview;
    map['scoreByTutor'] = scoreByTutor;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['recordUrl'] = recordUrl;
    map['cancelReasonId'] = cancelReasonId;
    map['calendarId'] = calendarId;
    map['cancelNote'] = cancelNote;
    map['lessonPlanId'] = lessonPlanId;
    map['isDeleted'] = isDeleted;

    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAtTimeStamp == other.createdAtTimeStamp &&
          updatedAtTimeStamp == other.updatedAtTimeStamp &&
          userId == other.userId &&
          scheduleDetailId == other.scheduleDetailId &&
          tutorMeetingLink == other.tutorMeetingLink &&
          studentMeetingLink == other.studentMeetingLink &&
          studentRequest == other.studentRequest &&
          tutorReview == other.tutorReview &&
          scoreByTutor == other.scoreByTutor &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          recordUrl == other.recordUrl &&
          cancelReasonId == other.cancelReasonId &&
          lessonPlanId == other.lessonPlanId &&
          cancelNote == other.cancelNote &&
          calendarId == other.calendarId &&
          isDeleted == other.isDeleted;

  @override
  int get hashCode =>
      id.hashCode ^
      createdAtTimeStamp.hashCode ^
      updatedAtTimeStamp.hashCode ^
      userId.hashCode ^
      scheduleDetailId.hashCode ^
      tutorMeetingLink.hashCode ^
      studentMeetingLink.hashCode ^
      studentRequest.hashCode ^
      tutorReview.hashCode ^
      scoreByTutor.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      recordUrl.hashCode ^
      cancelReasonId.hashCode ^
      lessonPlanId.hashCode ^
      cancelNote.hashCode ^
      calendarId.hashCode ^
      isDeleted.hashCode;

  @override
  String toString() {
    return 'BookingInfo{'
        ' id: $id,'
        ' createdAtTimeStamp: $createdAtTimeStamp,'
        ' updatedAtTimeStamp: $updatedAtTimeStamp,'
        ' userId: $userId,'
        ' scheduleDetailId: $scheduleDetailId,'
        ' tutorMeetingLink: $tutorMeetingLink,'
        ' studentMeetingLink: $studentMeetingLink,'
        ' studentRequest: $studentRequest,'
        ' tutorReview: $tutorReview,'
        ' scoreByTutor: $scoreByTutor,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' recordUrl: $recordUrl,'
        ' cancelReasonId: $cancelReasonId,'
        ' cancelNote: $cancelNote,'
        ' lessonPlanId: $lessonPlanId,'
        ' calendarId: $calendarId,'
        ' isDeleted: $isDeleted,'
        ' }';
  }

  BookingInfo copyWith({
    String? id,
    int? createdAtTimeStamp,
    int? updatedAtTimeStamp,
    String? userId,
    String? scheduleDetailId,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    String? studentRequest,
    String? tutorReview,
    String? scoreByTutor,
    String? createdAt,
    String? updatedAt,
    String? recordUrl,
    int? cancelReasonId,
    String? cancelNote,
    String? lessonPlanId,
    String? calendarId,
    bool? isDeleted,
  }) {
    return BookingInfo(
      id: id ?? this.id,
      createdAtTimeStamp: createdAtTimeStamp ?? this.createdAtTimeStamp,
      updatedAtTimeStamp: updatedAtTimeStamp ?? this.updatedAtTimeStamp,
      userId: userId ?? this.userId,
      scheduleDetailId: scheduleDetailId ?? this.scheduleDetailId,
      tutorMeetingLink: tutorMeetingLink ?? this.tutorMeetingLink,
      studentMeetingLink: studentMeetingLink ?? this.studentMeetingLink,
      studentRequest: studentRequest ?? this.studentRequest,
      tutorReview: tutorReview ?? this.tutorReview,
      scoreByTutor: scoreByTutor ?? this.scoreByTutor,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      recordUrl: recordUrl ?? this.recordUrl,
      cancelReasonId: cancelReasonId ?? this.cancelReasonId,
      cancelNote: cancelNote ?? this.cancelNote,
      lessonPlanId: lessonPlanId ?? this.lessonPlanId,
      calendarId: calendarId ?? this.calendarId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAtTimeStamp': createdAtTimeStamp,
      'updatedAtTimeStamp': updatedAtTimeStamp,
      'userId': userId,
      'scheduleDetailId': scheduleDetailId,
      'tutorMeetingLink': tutorMeetingLink,
      'studentMeetingLink': studentMeetingLink,
      'studentRequest': studentRequest,
      'tutorReview': tutorReview,
      'scoreByTutor': scoreByTutor,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'recordUrl': recordUrl,
      'cancelReasonId': cancelReasonId,
      'cancelNote': cancelNote,
      'lessonPlanId': lessonPlanId,
      'calendarId': calendarId,
      'isDeleted': isDeleted,
    };
  }

  factory BookingInfo.fromMap(Map<String, dynamic> map) {
    return BookingInfo(
      id: map['id'] as String?,
      createdAtTimeStamp: map['createdAtTimeStamp'] as int?,
      updatedAtTimeStamp: map['updatedAtTimeStamp'] as int?,
      userId: map['userId'] as String?,
      scheduleDetailId: map['scheduleDetailId'] as String?,
      tutorMeetingLink: map['tutorMeetingLink'] as String?,
      studentMeetingLink: map['studentMeetingLink'] as String?,
      studentRequest: map['studentRequest'] as String?,
      tutorReview: map['tutorReview'] as String?,
      scoreByTutor: map['scoreByTutor'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      recordUrl: map['recordUrl'] as String?,
      cancelReasonId: map['cancelReasonId'] as int?,
      cancelNote: map['cancelNote'] as String?,
      lessonPlanId: map['lessonPlanId'] as String?,
      calendarId: map['calendarId'] as String?,
      isDeleted: map['isDeleted'] as bool?,
    );
  }

//</editor-fold>
}
