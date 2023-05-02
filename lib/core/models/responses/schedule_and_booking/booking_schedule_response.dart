import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';

class BookingScheduleResponse extends BaseResponse {
  const BookingScheduleResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  @override
  List<Object?> get props => [...super.props, data];

  factory BookingScheduleResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    return BookingScheduleResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null
          ? (mapJson['data'] as List).map(BookingInfo.fromJson).toList()
          : null,
    );
  }

  final List<BookingInfo>? data;

  BookingScheduleResponse copyWith({
    int? statusCode,
    String? message,
    List<BookingInfo>? data,
  }) => BookingScheduleResponse(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is BookingScheduleResponse &&
          runtimeType == other.runtimeType &&
          statusCode == other.statusCode &&
          message == other.message &&
          listEquals(data, other.data);

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'BookingScheduleResponse{ statusCode: $statusCode, message: $message, data: $data, }';
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory BookingScheduleResponse.fromMap(Map<String, dynamic> map) {
    return BookingScheduleResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null
          ? (map['data'] as List).map((e) => BookingInfo.fromMap(e as Map<String, dynamic>)).toList()
          : null,
    );
  }
}
