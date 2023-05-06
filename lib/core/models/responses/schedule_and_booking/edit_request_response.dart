import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';

class EditRequestResponse extends BaseResponse {
  const EditRequestResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  @override
  List<Object?> get props => [...super.props, data];

  factory EditRequestResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    return EditRequestResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null
          ? (mapJson['data'] as List).map((e) {
        try {
          return int.parse(e.toString());
        } catch (e) {
          return 0;
        }
      }).toList()
          : null,
    );
  }

  final List<int>? data;

  EditRequestResponse copyWith({
    int? statusCode,
    String? message,
    List<int>? data,
  }) => EditRequestResponse(
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
      map['data'] = data;
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          super == other &&
              other is EditRequestResponse &&
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
      'data': data,
    };
  }

  factory EditRequestResponse.fromMap(Map<String, dynamic> map) {
    return EditRequestResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null
          ? (map['data'] as List).map((e) {
            try {
              return int.parse(e.toString());
            } catch (e) {
              return 0;
            }
      }).toList()
          : null,
    );
  }
}
