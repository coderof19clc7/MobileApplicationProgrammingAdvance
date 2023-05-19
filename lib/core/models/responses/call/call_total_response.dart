import 'package:one_one_learn/core/models/responses/base_response.dart';

class CallTotalResponse extends BaseResponse {
  final int? total;

  @override
  List<Object?> get props => [...super.props, total];

  const CallTotalResponse({
    super.statusCode,
    super.message,
    this.total,
  });

  factory CallTotalResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    int? total;
    try {
      total = int.parse(mapJson['total'].toString());
    } catch (e) {
      total = null;
    }

    return CallTotalResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      total: total,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final mapJson = <String, dynamic>{};
    mapJson['statusCode'] = statusCode;
    mapJson['message'] = message;
    mapJson['total'] = total;

    return mapJson;
  }

  CallTotalResponse copyWith({
    int? statusCode,
    String? message,
    int? total,
  }) {
    return CallTotalResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      total: total ?? this.total,
    );
  }

  @override
  String toString() {
    return 'ScheduleResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' total: $total'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'total': total,
    };
  }

  factory CallTotalResponse.fromMap(Map<String, dynamic> map) {
    int? total;
    try {
      total = int.parse(map['total'].toString());
    } catch (e) {
      total = null;
    }

    return CallTotalResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      total: total,
    );
  }
}
