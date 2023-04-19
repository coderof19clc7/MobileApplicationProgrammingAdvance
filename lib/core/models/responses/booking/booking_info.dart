class BookingInfo {
  final String? id;
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? userId;
  final String? scheduleDetailId;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  // studentRequest
  // tutorReview
  // scoreByTutor
  final String? createdAt;
  final String? updatedAt;
  final String? recordUrl;
  final int? cancelReasonId;
  final String? lessonPlanId;
  // cancelNote
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
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
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
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      recordUrl: mapJson['recordUrl'] as String?,
      cancelReasonId: mapJson['cancelReasonId'] as int?,
      lessonPlanId: mapJson['lessonPlanId'] as String?,
      isDeleted: mapJson['isDeleted'] as bool?,
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
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['recordUrl'] = recordUrl;
    map['cancelReasonId'] = cancelReasonId;
    map['lessonPlanId'] = lessonPlanId;
    map['isDeleted'] = isDeleted;

    return map;
  }

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
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' recordUrl: $recordUrl,'
        ' cancelReasonId: $cancelReasonId,'
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
    String? createdAt,
    String? updatedAt,
    String? recordUrl,
    int? cancelReasonId,
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
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      recordUrl: recordUrl ?? this.recordUrl,
      cancelReasonId: cancelReasonId ?? this.cancelReasonId,
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'recordUrl': recordUrl,
      'cancelReasonId': cancelReasonId,
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
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      recordUrl: map['recordUrl'] as String?,
      cancelReasonId: map['cancelReasonId'] as int?,
      lessonPlanId: map['lessonPlanId'] as String?,
      calendarId: map['calendarId'] as String?,
      isDeleted: map['isDeleted'] as bool?,
    );
  }

//</editor-fold>
}
