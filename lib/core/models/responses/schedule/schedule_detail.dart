import 'package:one_one_learn/core/models/responses/booking/booking_info.dart';

class ScheduleDetail {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final String? createdAt;
  final String? updatedAt;
  final List<BookingInfo>? bookingInfo;

//<editor-fold desc="Data Methods">
  const ScheduleDetail({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
  });

  factory ScheduleDetail.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    List<BookingInfo>? bookingInfo;
    if (mapJson['bookingInfo'] != null) {
      bookingInfo = [];
      for (final v in mapJson['bookingInfo'] as List) {
        bookingInfo.add(BookingInfo.fromJson(v));
      }
    }

    return ScheduleDetail(
      id: mapJson['id'] as String?,
      scheduleId: mapJson['scheduleId'] as String?,
      startPeriod: mapJson['startPeriod'] as String?,
      endPeriod: mapJson['endPeriod'] as String?,
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      bookingInfo: bookingInfo,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['scheduleId'] = scheduleId;
    map['startPeriod'] = startPeriod;
    map['endPeriod'] = endPeriod;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;

    if (bookingInfo != null) {
      map['bookingInfo'] = bookingInfo!.map((v) => v.toJson()).toList();
    }

    return map;
  }

  @override
  String toString() {
    return 'ScheduleDetail{'
        ' startPeriodTimestamp: $startPeriodTimestamp,'
        ' endPeriodTimestamp: $endPeriodTimestamp,'
        ' id: $id,'
        ' scheduleId: $scheduleId,'
        ' startPeriod: $startPeriod,'
        ' endPeriod: $endPeriod,'
        ' createdAt: $createdAt,'
        ' updatedAt: $updatedAt,'
        ' bookingInfo: $bookingInfo,'
        ' bookingInfo: $bookingInfo,'
        ' }';
  }

  ScheduleDetail copyWith({
    int? startPeriodTimestamp,
    int? endPeriodTimestamp,
    String? id,
    String? scheduleId,
    String? startPeriod,
    String? endPeriod,
    String? createdAt,
    String? updatedAt,
    List<BookingInfo>? bookingInfo,
  }) {
    return ScheduleDetail(
      startPeriodTimestamp: startPeriodTimestamp ?? this.startPeriodTimestamp,
      endPeriodTimestamp: endPeriodTimestamp ?? this.endPeriodTimestamp,
      id: id ?? this.id,
      scheduleId: scheduleId ?? this.scheduleId,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bookingInfo: bookingInfo ?? this.bookingInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startPeriodTimestamp': startPeriodTimestamp,
      'endPeriodTimestamp': endPeriodTimestamp,
      'id': id,
      'scheduleId': scheduleId,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'bookingInfo': bookingInfo,
    };
  }

  factory ScheduleDetail.fromMap(Map<String, dynamic> map) {
    List<BookingInfo>? bookingInfo;
    if (map['bookingInfo'] != null) {
      bookingInfo = [];
      for (final v in map['bookingInfo'] as List) {
        bookingInfo.add(BookingInfo.fromJson(v));
      }
    }

    return ScheduleDetail(
      startPeriodTimestamp: map['startPeriodTimestamp'] as int?,
      endPeriodTimestamp: map['endPeriodTimestamp'] as int?,
      id: map['id'] as String?,
      scheduleId: map['scheduleId'] as String?,
      startPeriod: map['startPeriod'] as String?,
      endPeriod: map['endPeriod'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      bookingInfo: bookingInfo,
    );
  }

//</editor-fold>
}
