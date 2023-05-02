import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/class_review.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_detail.dart';

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
  final ScheduleDetail? scheduleDetailInfo;
  final ClassReview? classReview;
  final bool? showRecordUrl;
  final List<String>? studentMaterials;
  final List<String>? feedbacks;

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
    this.scheduleDetailInfo,
    this.classReview,
    this.showRecordUrl,
    this.studentMaterials,
    this.feedbacks,
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
      scheduleDetailInfo: mapJson['scheduleDetailInfo'] != null
          ? ScheduleDetail.fromJson(mapJson['scheduleDetailInfo'])
          : null,
      cancelNote: mapJson['cancelNote'] as String?,
      calendarId: mapJson['calendarId'] as String?,
      classReview: mapJson['classReview'] != null
          ? ClassReview.fromJson(mapJson['classReview'])
          : null,
      showRecordUrl: mapJson['showRecordUrl'] as bool?,
      studentMaterials: mapJson['studentMaterials'] != null
          ? (mapJson['studentMaterials'] as List).map((e) => e as String).toList()
          : null,
      feedbacks: mapJson['feedbacks'] != null
          ? (mapJson['feedbacks'] as List).map((e) => e as String).toList()
          : null,
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
    map['scheduleDetailInfo'] = scheduleDetailInfo?.toJson();
    map['classReview'] = classReview?.toJson();
    map['showRecordUrl'] = showRecordUrl;
    map['studentMaterials'] = studentMaterials;
    map['feedbacks'] = feedbacks;

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
          isDeleted == other.isDeleted &&
          scheduleDetailInfo == other.scheduleDetailInfo &&
          classReview == other.classReview &&
          showRecordUrl == other.showRecordUrl &&
          listEquals(studentMaterials, other.studentMaterials) &&
          listEquals(feedbacks, other.feedbacks);

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
      isDeleted.hashCode ^
      scheduleDetailInfo.hashCode ^
      classReview.hashCode ^
      showRecordUrl.hashCode ^
      studentMaterials.hashCode ^
      feedbacks.hashCode;

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
        ' scheduleDetailInfo: $scheduleDetailInfo,'
        ' classReview: $classReview,'
        ' showRecordUrl: $showRecordUrl,'
        ' studentMaterials: $studentMaterials,'
        ' feedbacks: $feedbacks,'
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
    ScheduleDetail? scheduleDetailInfo,
    ClassReview? classReview,
    bool? showRecordUrl,
    List<String>? studentMaterials,
    List<String>? feedbacks,
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
      scheduleDetailInfo: scheduleDetailInfo ?? this.scheduleDetailInfo,
      classReview: classReview ?? this.classReview,
      showRecordUrl: showRecordUrl ?? this.showRecordUrl,
      studentMaterials: studentMaterials ?? this.studentMaterials,
      feedbacks: feedbacks ?? this.feedbacks,
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
      'scheduleDetailInfo': scheduleDetailInfo?.toMap(),
      'classReview': classReview?.toMap(),
      'showRecordUrl': showRecordUrl,
      'studentMaterials': studentMaterials,
      'feedbacks': feedbacks,
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
      scheduleDetailInfo: map['scheduleDetailInfo'] != null
          ? ScheduleDetail.fromMap(map['scheduleDetailInfo'] as Map<String, dynamic>)
          : null,
      classReview: map['classReview'] != null
          ? ClassReview.fromMap(map['classReview'] as Map<String, dynamic>)
          : null,
      showRecordUrl: map['showRecordUrl'] as bool?,
      studentMaterials: map['studentMaterials'] != null
          ? (map['studentMaterials'] as List).map((e) => e as String).toList()
          : null,
      feedbacks: map['feedbacks'] != null
          ? (map['feedbacks'] as List).map((e) => e as String).toList()
          : null,
    );
  }

//</editor-fold>
}
