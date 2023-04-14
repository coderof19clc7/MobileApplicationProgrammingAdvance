import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';

class UserInfoResponse extends BaseResponse {
  final UserInfo? data;

  @override
  List<Object?> get props => [...super.props, data];

//<editor-fold desc="Data Methods">
  const UserInfoResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (statusCode != null) {
      map['statusCode'] = statusCode;
    }
    if (message != null) {
      map['message'] = message;
    }
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

  factory UserInfoResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return UserInfoResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null ? UserInfo.fromJson(mapJson['data']) : null,
    );
  }

  @override
  String toString() {
    return 'UserInfoResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' data: $data,'
        ' }';
  }

  UserInfoResponse copyWith({
    int? statusCode,
    String? message,
    UserInfo? data,
  }) {
    return UserInfoResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (statusCode != null) {
      map['statusCode'] = statusCode;
    }
    if (message != null) {
      map['message'] = message;
    }
    if (data != null) {
      map['data'] = data!.toMap();
    }
    return map;
  }

  factory UserInfoResponse.fromMap(Map<String, dynamic> map) {
    return UserInfoResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null ? UserInfo.fromMap(
        map['data'] as Map<String, dynamic>,
      ) : null,
    );
  }

//</editor-fold>
}