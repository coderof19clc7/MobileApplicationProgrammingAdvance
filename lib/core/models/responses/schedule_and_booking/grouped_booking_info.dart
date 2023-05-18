import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/feedback/feed_back.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';

@immutable
class GroupedBookingInfo {
  final bool isExpanded;
  final bool isReviewed;
  final String? id;
  final TutorInfo? tutorInfo;
  final DateTime? startTimestamp;
  final DateTime? endTimestamp;
  final int classDuration;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final List<String> requestList;
  final List<FeedBack> feedbackList;
  final List<BookingInfo?>? bookingInfoList;

//<editor-fold desc="Data Methods">
  const GroupedBookingInfo({
    this.isExpanded = false,
    this.isReviewed = false,
    this.id,
    this.tutorInfo,
    this.startTimestamp,
    this.endTimestamp,
    this.classDuration = 0,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.requestList = const [],
    this.feedbackList = const [],
    this.bookingInfoList,
  });

  factory GroupedBookingInfo.fromBookingInfoList(List<BookingInfo?> infoList) {
    final startTimeStampInt = infoList[0]?.scheduleDetailInfo?.startPeriodTimestamp;
    final endTimeStampInt = infoList.last?.scheduleDetailInfo?.endPeriodTimestamp;
    final classDuration = (endTimeStampInt ?? 0) - (startTimeStampInt ?? 0);
    final requestList = <String>[];
    final feedbackList = <FeedBack>[];
    var firstIndexOfReviewedSession = -1;
    for (var i = 0; i < infoList.length; i++) {
      final info = infoList[i];
      if (info?.studentRequest != null && info?.studentRequest?.isNotEmpty == true) {
        requestList.add(info?.studentRequest ?? '');
      }
      if (info?.feedbacks != null) {
        feedbackList.addAll([...info?.feedbacks ?? <FeedBack>[]]);
      }
      if (info?.classReview != null && firstIndexOfReviewedSession == -1) {
        firstIndexOfReviewedSession = i;
      }
    }

    return GroupedBookingInfo(
      feedbackList: feedbackList,
      isReviewed: firstIndexOfReviewedSession != -1,
      id: infoList[0]?.id,
      tutorInfo: infoList[0]?.scheduleDetailInfo?.scheduleInfo?.tutorInfo,
      startTimestamp: startTimeStampInt != null
          ? DateTime.fromMillisecondsSinceEpoch(startTimeStampInt, isUtc: true).toLocal()
          : null,
      endTimestamp: endTimeStampInt != null
          ? DateTime.fromMillisecondsSinceEpoch(endTimeStampInt, isUtc: true).toLocal()
          : null,
      classDuration: classDuration,
      tutorMeetingLink: infoList[0]?.tutorMeetingLink,
      studentMeetingLink: infoList[0]?.studentMeetingLink,
      requestList: requestList,
      bookingInfoList: infoList,
    );
  }

  factory GroupedBookingInfo.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<BookingInfo?>? bookingInfoList;
    if (mapJson['bookingInfoList'] != null) {
      bookingInfoList = <BookingInfo?>[];
      for (final v in mapJson['bookingInfoList'] as List) {
        bookingInfoList.add(BookingInfo.fromJson(v));
      }
    }

    if (bookingInfoList != null) {
      return GroupedBookingInfo.fromBookingInfoList(bookingInfoList);
    }

    return GroupedBookingInfo(
      isExpanded: mapJson['isExpanded'] as bool? ?? false,
      isReviewed: mapJson['isReviewed'] as bool? ?? false,
      id: mapJson['id'] as String?,
      tutorInfo: mapJson['tutorInfo'] != null
          ? TutorInfo.fromJson(mapJson['tutorInfo'])
          : null,
      startTimestamp: mapJson['startTimestamp'] as DateTime?,
      endTimestamp: mapJson['endTimestamp'] as DateTime?,
      classDuration: mapJson['classDuration'] as int? ?? 0,
      tutorMeetingLink: mapJson['tutorMeetingLink'] as String?,
      studentMeetingLink: mapJson['studentMeetingLink'] as String?,
      requestList: mapJson['requestList'] != null
          ? (mapJson['requestList'] as List).map((v) => v as String? ?? '').toList()
          : [],
      feedbackList: mapJson['feedbackList'] != null
          ? (mapJson['feedbackList'] as List).map(FeedBack.fromJson).toList()
          : [],
      bookingInfoList: mapJson['bookingInfoList'] != null ? bookingInfoList : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['isExpanded'] = isExpanded;
    map['isReviewed'] = isReviewed;
    map['id'] = id;
    map['tutorInfo'] = tutorInfo?.toJson();
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['classDuration'] = classDuration;
    map['tutorMeetingLink'] = tutorMeetingLink;
    map['studentMeetingLink'] = studentMeetingLink;
    map['requestList'] = requestList;
    map['feedbackList'] = feedbackList.map((e) => e.toJson()).toList();

    if (bookingInfoList != null) {
      map['bookingInfoList'] = bookingInfoList?.map((v) => v?.toJson()).toList();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GroupedBookingInfo &&
              runtimeType == other.runtimeType &&
              isExpanded == other.isExpanded &&
              isReviewed == other.isReviewed &&
              id == other.id &&
              tutorInfo == other.tutorInfo &&
              startTimestamp == other.startTimestamp &&
              endTimestamp == other.endTimestamp &&
              classDuration == other.classDuration &&
              tutorMeetingLink == other.tutorMeetingLink &&
              studentMeetingLink == other.studentMeetingLink &&
              listEquals(requestList, other.requestList) &&
              listEquals(feedbackList, other.feedbackList) &&
              listEquals(bookingInfoList, other.bookingInfoList);

  @override
  int get hashCode =>
      isExpanded.hashCode ^
      isReviewed.hashCode ^
      id.hashCode ^
      tutorInfo.hashCode ^
      startTimestamp.hashCode ^
      endTimestamp.hashCode ^
      classDuration.hashCode ^
      tutorMeetingLink.hashCode ^
      studentMeetingLink.hashCode ^
      requestList.hashCode ^
      feedbackList.hashCode ^
      bookingInfoList.hashCode;

  @override
  String toString() {
    return 'GroupedBookingInfo{'
        ' isExpanded: $isExpanded,'
        ' isReviewed: $isReviewed,'
        ' id: $id,'
        ' tutorInfo: $tutorInfo,'
        ' startTimestamp: $startTimestamp,'
        ' endTimestamp: $endTimestamp,'
        ' classDuration: $classDuration,'
        ' tutorMeetingLink: $tutorMeetingLink,'
        ' studentMeetingLink: $studentMeetingLink,'
        ' requestList: $requestList,'
        ' feedbackList: $feedbackList,'
        ' bookingInfoList: $bookingInfoList,'
        ' }';
  }

  GroupedBookingInfo copyWith({
    bool? isExpanded,
    bool? isReviewed,
    String? id,
    TutorInfo? tutorInfo,
    DateTime? startTimestamp,
    DateTime? endTimestamp,
    int? classDuration,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    List<String>? requestList,
    List<FeedBack>? feedbackList,
    List<BookingInfo?>? bookingInfoList,
  }) {

    return GroupedBookingInfo(
      isExpanded: isExpanded ?? this.isExpanded,
      isReviewed: isReviewed ?? this.isReviewed,
      id: id ?? this.id,
      tutorInfo: tutorInfo ?? this.tutorInfo,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
      classDuration: classDuration ?? this.classDuration,
      tutorMeetingLink: tutorMeetingLink ?? this.tutorMeetingLink,
      studentMeetingLink: studentMeetingLink ?? this.studentMeetingLink,
      requestList: requestList ?? this.requestList,
      feedbackList: feedbackList ?? this.feedbackList,
      bookingInfoList: bookingInfoList ?? this.bookingInfoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isExpanded': isExpanded,
      'isReviewed': isReviewed,
      'id': id,
      'tutorInfo': tutorInfo?.toMap(),
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'classDuration': classDuration,
      'tutorMeetingLink': tutorMeetingLink,
      'studentMeetingLink': studentMeetingLink,
      'requestList': requestList,
      'feedbackList': feedbackList.map((x) => x.toMap()).toList(),
      'bookingInfoList': bookingInfoList?.map((x) => x?.toMap()).toList(),
    };
  }

  factory GroupedBookingInfo.fromMap(Map<String, dynamic> map) {

    List<BookingInfo>? bookingInfoList;
    if (map['bookingInfoList'] != null) {
      bookingInfoList = [];
      for (final v in map['bookingInfoList'] as List) {
        bookingInfoList.add(BookingInfo.fromMap(v as Map<String, dynamic>));
      }
    }

    if (bookingInfoList != null) {
      return GroupedBookingInfo.fromBookingInfoList(bookingInfoList);
    }

    return GroupedBookingInfo(
      isExpanded: map['isExpanded'] as bool? ?? false,
      isReviewed: map['isReviewed'] as bool? ?? false,
      id: map['id'] as String?,
      tutorInfo: map['tutorInfo'] != null
          ? TutorInfo.fromMap(map['tutorInfo'] as Map<String, dynamic>)
          : null,
      startTimestamp: map['startTimestamp'] as DateTime?,
      endTimestamp: map['endTimestamp'] as DateTime?,
      classDuration: map['classDuration'] as int? ?? 0,
      tutorMeetingLink: map['tutorMeetingLink'] as String?,
      studentMeetingLink: map['studentMeetingLink'] as String?,
      requestList: map['requestList'] != null
          ? (map['requestList'] as List).map((v) => v as String? ?? '').toList()
          : [],
      feedbackList: map['feedbackList'] != null
          ? (map['feedbackList'] as List).map((v) => FeedBack.fromMap(v as Map<String, dynamic>)).toList()
          : [],
      bookingInfoList: bookingInfoList,
    );
  }
//</editor-fold>
}
