import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';

@immutable
class GroupedBookingInfo {
  final String? id;
  final String? tutorId;
  final String? tutorName;
  final String? tutorAvatar;
  final DateTime? startTimestamp;
  final DateTime? endTimestamp;
  final int classDuration;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final List<BookingInfo?>? bookingInfoList;

//<editor-fold desc="Data Methods">
  const GroupedBookingInfo({
    this.id,
    this.tutorId,
    this.tutorName,
    this.tutorAvatar,
    this.startTimestamp,
    this.endTimestamp,
    this.classDuration = 0,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.bookingInfoList,
  });

  factory GroupedBookingInfo.fromBookingInfoList(List<BookingInfo?> infoList) {
    final startTimeStampInt = infoList[0]?.scheduleDetailInfo?.startPeriodTimestamp;
    final endTimeStampInt = infoList.last?.scheduleDetailInfo?.endPeriodTimestamp;
    final classDuration = (endTimeStampInt ?? 0) - (startTimeStampInt ?? 0);
    return GroupedBookingInfo(
      id: infoList[0]?.id,
      tutorId: infoList[0]?.scheduleDetailInfo?.scheduleInfo?.tutorId,
      tutorName: infoList[0]?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name,
      tutorAvatar: infoList[0]?.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.avatar,
      startTimestamp: startTimeStampInt != null
          ? DateTime.fromMillisecondsSinceEpoch(startTimeStampInt, isUtc: true).toLocal()
          : null,
      endTimestamp: endTimeStampInt != null
          ? DateTime.fromMillisecondsSinceEpoch(endTimeStampInt, isUtc: true).toLocal()
          : null,
      classDuration: classDuration,
      tutorMeetingLink: infoList[0]?.tutorMeetingLink,
      studentMeetingLink: infoList[0]?.studentMeetingLink,
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
      id: mapJson['id'] as String?,
      tutorId: mapJson['tutorId'] as String?,
      tutorName: mapJson['tutorName'] as String?,
      tutorAvatar: mapJson['tutorAvatar'] as String?,
      startTimestamp: mapJson['startTimestamp'] as DateTime?,
      endTimestamp: mapJson['endTimestamp'] as DateTime?,
      classDuration: mapJson['classDuration'] as int? ?? 0,
      tutorMeetingLink: mapJson['tutorMeetingLink'] as String?,
      studentMeetingLink: mapJson['studentMeetingLink'] as String?,
      bookingInfoList: mapJson['bookingInfoList'] != null ? bookingInfoList : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = id;
    map['tutorId'] = tutorId;
    map['tutorName'] = tutorName;
    map['tutorAvatar'] = tutorAvatar;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['classDuration'] = classDuration;
    map['tutorMeetingLink'] = tutorMeetingLink;
    map['studentMeetingLink'] = studentMeetingLink;

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
              id == other.id &&
              tutorId == other.tutorId &&
              tutorName == other.tutorName &&
              tutorAvatar == other.tutorAvatar &&
              startTimestamp == other.startTimestamp &&
              endTimestamp == other.endTimestamp &&
              classDuration == other.classDuration &&
              tutorMeetingLink == other.tutorMeetingLink &&
              studentMeetingLink == other.studentMeetingLink &&
              listEquals(bookingInfoList, other.bookingInfoList);

  @override
  int get hashCode =>
      id.hashCode ^
      tutorId.hashCode ^
      tutorName.hashCode ^
      tutorAvatar.hashCode ^
      startTimestamp.hashCode ^
      endTimestamp.hashCode ^
      classDuration.hashCode ^
      tutorMeetingLink.hashCode ^
      studentMeetingLink.hashCode ^
      bookingInfoList.hashCode;

  @override
  String toString() {
    return 'GroupedBookingInfo{'
        ' id: $id,'
        ' tutorId: $tutorId,'
        ' tutorName: $tutorName,'
        ' tutorAvatar: $tutorAvatar,'
        ' startTimestamp: $startTimestamp,'
        ' endTimestamp: $endTimestamp,'
        ' classDuration: $classDuration,'
        ' tutorMeetingLink: $tutorMeetingLink,'
        ' studentMeetingLink: $studentMeetingLink,'
        ' bookingInfoList: $bookingInfoList,'
        ' }';
  }

  GroupedBookingInfo copyWith({
    String? id,
    String? tutorId,
    String? tutorName,
    String? tutorAvatar,
    DateTime? startTimestamp,
    DateTime? endTimestamp,
    int? classDuration,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    List<BookingInfo?>? bookingInfoList,
  }) {

    if (bookingInfoList != null) {
      return GroupedBookingInfo.fromBookingInfoList(bookingInfoList);
    }

    return GroupedBookingInfo(
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
      classDuration: classDuration ?? this.classDuration,
      tutorMeetingLink: tutorMeetingLink ?? this.tutorMeetingLink,
      studentMeetingLink: studentMeetingLink ?? this.studentMeetingLink,
      bookingInfoList: bookingInfoList ?? this.bookingInfoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tutorId': tutorId,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'classDuration': classDuration,
      'tutorMeetingLink': tutorMeetingLink,
      'studentMeetingLink': studentMeetingLink,
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
      id: map['id'] as String?,
      tutorId: map['tutorId'] as String?,
      startTimestamp: map['startTimestamp'] as DateTime?,
      endTimestamp: map['endTimestamp'] as DateTime?,
      classDuration: map['classDuration'] as int? ?? 0,
      tutorMeetingLink: map['tutorMeetingLink'] as String?,
      studentMeetingLink: map['studentMeetingLink'] as String?,
      bookingInfoList: bookingInfoList,
    );
  }
//</editor-fold>
}
