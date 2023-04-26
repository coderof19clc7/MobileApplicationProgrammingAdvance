import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_info.dart';

@immutable
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
  final ScheduleInfo? scheduleInfo;
  final bool? isBooked;

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
    this.scheduleInfo,
    this.isBooked,
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
      startPeriodTimestamp: mapJson['startPeriodTimestamp'] as int?,
      endPeriodTimestamp: mapJson['endPeriodTimestamp'] as int?,
      id: mapJson['id'] as String?,
      scheduleId: mapJson['scheduleId'] as String?,
      startPeriod: mapJson['startPeriod'] as String?,
      endPeriod: mapJson['endPeriod'] as String?,
      createdAt: mapJson['createdAt'] as String?,
      updatedAt: mapJson['updatedAt'] as String?,
      bookingInfo: bookingInfo,
      scheduleInfo: mapJson['scheduleInfo'] != null
          ? ScheduleInfo.fromJson(mapJson['scheduleInfo'])
          : null,
      isBooked: mapJson['isBooked'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['startPeriodTimestamp'] = startPeriodTimestamp;
    map['endPeriodTimestamp'] = endPeriodTimestamp;
    map['id'] = id;
    map['scheduleId'] = scheduleId;
    map['startPeriod'] = startPeriod;
    map['endPeriod'] = endPeriod;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['isBooked'] = isBooked;

    if (bookingInfo != null) {
      map['bookingInfo'] = bookingInfo!.map((v) => v.toJson()).toList();
    }

    if (scheduleInfo != null) {
      map['scheduleInfo'] = scheduleInfo!.toJson();
    }

    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ScheduleDetail &&
              runtimeType == other.runtimeType &&
              startPeriodTimestamp == other.startPeriodTimestamp &&
              endPeriodTimestamp == other.endPeriodTimestamp &&
              id == other.id &&
              scheduleId == other.scheduleId &&
              startPeriod == other.startPeriod &&
              endPeriod == other.endPeriod &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt &&
              listEquals(bookingInfo, other.bookingInfo) &&
              scheduleInfo == other.scheduleInfo &&
              isBooked == other.isBooked);

  @override
  int get hashCode =>
      startPeriodTimestamp.hashCode ^
      endPeriodTimestamp.hashCode ^
      id.hashCode ^
      scheduleId.hashCode ^
      startPeriod.hashCode ^
      endPeriod.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      bookingInfo.hashCode ^
      scheduleInfo.hashCode ^
      isBooked.hashCode;

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
        ' scheduleInfo: $scheduleInfo,'
        ' isBooked: $isBooked,'
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
    ScheduleInfo? scheduleInfo,
    bool? isBooked,
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
      scheduleInfo: scheduleInfo ?? this.scheduleInfo,
      isBooked: isBooked ?? this.isBooked,
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
      'scheduleInfo': scheduleInfo,
      'isBooked': isBooked,
    };
  }

  factory ScheduleDetail.fromMap(Map<String, dynamic> map) {
    List<BookingInfo>? bookingInfo;
    if (map['bookingInfo'] != null) {
      bookingInfo = [];
      for (final v in map['bookingInfo'] as List) {
        bookingInfo.add(BookingInfo.fromMap(v as Map<String, dynamic>));
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
      scheduleInfo: map['scheduleInfo'] != null
          ? ScheduleInfo.fromMap(map['scheduleInfo'] as Map<String, dynamic>)
          : null,
      isBooked: map['isBooked'] as bool?,
    );
  }

//</editor-fold>
}
