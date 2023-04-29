import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';

@immutable
class GroupedBookingInfo {
  final bool isExpanded;
  final String? id;
  final String? tutorId;
  final String? tutorName;
  final String? tutorAvatar;
  final DateTime? startTimestamp;
  final DateTime? endTimestamp;
  final int classDuration;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final List<String> requestList;
  final List<BookingInfo?>? bookingInfoList;

//<editor-fold desc="Data Methods">
  const GroupedBookingInfo({
    this.isExpanded = false,
    this.id,
    this.tutorId,
    this.tutorName,
    this.tutorAvatar,
    this.startTimestamp,
    this.endTimestamp,
    this.classDuration = 0,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.requestList = const [],
    this.bookingInfoList,
  });

  factory GroupedBookingInfo.fromBookingInfoList(List<BookingInfo?> infoList) {
    final startTimeStampInt = infoList[0]?.scheduleDetailInfo?.startPeriodTimestamp;
    final endTimeStampInt = infoList.last?.scheduleDetailInfo?.endPeriodTimestamp;
    final classDuration = (endTimeStampInt ?? 0) - (startTimeStampInt ?? 0);
    final requestList = <String>[];
    for (final info in infoList) {
      if (info?.studentRequest != null && info?.studentRequest?.isNotEmpty == true) {
        requestList.add(info?.studentRequest ?? '');
      }
    }
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
      id: mapJson['id'] as String?,
      tutorId: mapJson['tutorId'] as String?,
      tutorName: mapJson['tutorName'] as String?,
      tutorAvatar: mapJson['tutorAvatar'] as String?,
      startTimestamp: mapJson['startTimestamp'] as DateTime?,
      endTimestamp: mapJson['endTimestamp'] as DateTime?,
      classDuration: mapJson['classDuration'] as int? ?? 0,
      tutorMeetingLink: mapJson['tutorMeetingLink'] as String?,
      studentMeetingLink: mapJson['studentMeetingLink'] as String?,
      requestList: mapJson['requestList'] != null
          ? (mapJson['requestList'] as List).map((v) => v as String? ?? '').toList()
          : [],
      bookingInfoList: mapJson['bookingInfoList'] != null ? bookingInfoList : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['isExpanded'] = isExpanded;
    map['id'] = id;
    map['tutorId'] = tutorId;
    map['tutorName'] = tutorName;
    map['tutorAvatar'] = tutorAvatar;
    map['startTimestamp'] = startTimestamp;
    map['endTimestamp'] = endTimestamp;
    map['classDuration'] = classDuration;
    map['tutorMeetingLink'] = tutorMeetingLink;
    map['studentMeetingLink'] = studentMeetingLink;
    map['requestList'] = requestList;

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
              id == other.id &&
              tutorId == other.tutorId &&
              tutorName == other.tutorName &&
              tutorAvatar == other.tutorAvatar &&
              startTimestamp == other.startTimestamp &&
              endTimestamp == other.endTimestamp &&
              classDuration == other.classDuration &&
              tutorMeetingLink == other.tutorMeetingLink &&
              studentMeetingLink == other.studentMeetingLink &&
              listEquals(requestList, other.requestList) &&
              listEquals(bookingInfoList, other.bookingInfoList);

  @override
  int get hashCode =>
      isExpanded.hashCode ^
      id.hashCode ^
      tutorId.hashCode ^
      tutorName.hashCode ^
      tutorAvatar.hashCode ^
      startTimestamp.hashCode ^
      endTimestamp.hashCode ^
      classDuration.hashCode ^
      tutorMeetingLink.hashCode ^
      studentMeetingLink.hashCode ^
      requestList.hashCode ^
      bookingInfoList.hashCode;

  @override
  String toString() {
    return 'GroupedBookingInfo{'
        ' isExpanded: $isExpanded,'
        ' id: $id,'
        ' tutorId: $tutorId,'
        ' tutorName: $tutorName,'
        ' tutorAvatar: $tutorAvatar,'
        ' startTimestamp: $startTimestamp,'
        ' endTimestamp: $endTimestamp,'
        ' classDuration: $classDuration,'
        ' tutorMeetingLink: $tutorMeetingLink,'
        ' studentMeetingLink: $studentMeetingLink,'
        ' requestList: $requestList,'
        ' bookingInfoList: $bookingInfoList,'
        ' }';
  }

  GroupedBookingInfo copyWith({
    bool? isExpanded,
    String? id,
    String? tutorId,
    String? tutorName,
    String? tutorAvatar,
    DateTime? startTimestamp,
    DateTime? endTimestamp,
    int? classDuration,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    List<String>? requestList,
    List<BookingInfo?>? bookingInfoList,
  }) {

    return GroupedBookingInfo(
      isExpanded: isExpanded ?? this.isExpanded,
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      tutorName: tutorName ?? this.tutorName,
      tutorAvatar: tutorAvatar ?? this.tutorAvatar,
      startTimestamp: startTimestamp ?? this.startTimestamp,
      endTimestamp: endTimestamp ?? this.endTimestamp,
      classDuration: classDuration ?? this.classDuration,
      tutorMeetingLink: tutorMeetingLink ?? this.tutorMeetingLink,
      studentMeetingLink: studentMeetingLink ?? this.studentMeetingLink,
      requestList: requestList ?? this.requestList,
      bookingInfoList: bookingInfoList ?? this.bookingInfoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isExpanded': isExpanded,
      'id': id,
      'tutorId': tutorId,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'classDuration': classDuration,
      'tutorMeetingLink': tutorMeetingLink,
      'studentMeetingLink': studentMeetingLink,
      'requestList': requestList,
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
      id: map['id'] as String?,
      tutorId: map['tutorId'] as String?,
      startTimestamp: map['startTimestamp'] as DateTime?,
      endTimestamp: map['endTimestamp'] as DateTime?,
      classDuration: map['classDuration'] as int? ?? 0,
      tutorMeetingLink: map['tutorMeetingLink'] as String?,
      studentMeetingLink: map['studentMeetingLink'] as String?,
      requestList: map['requestList'] != null
          ? (map['requestList'] as List).map((v) => v as String? ?? '').toList()
          : [],
      bookingInfoList: bookingInfoList,
    );
  }
//</editor-fold>
}
