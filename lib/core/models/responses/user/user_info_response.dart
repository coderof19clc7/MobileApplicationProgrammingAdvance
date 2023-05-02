import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';

class UserInfoResponse extends BaseResponse {
  final UserInfo? user;

  @override
  List<Object?> get props => [...super.props, user];

//<editor-fold desc="user Methods">
  const UserInfoResponse({
    super.statusCode,
    super.message,
    this.user,
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
    if (user != null) {
      map['user'] = user!.toJson();
    }
    return map;
  }

  factory UserInfoResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return UserInfoResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      user: mapJson['user'] != null ? UserInfo.fromJson(mapJson['user']) : null,
    );
  }

  @override
  String toString() {
    return 'UserInfoResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' user: $user,'
        ' }';
  }

  UserInfoResponse copyWith({
    int? statusCode,
    String? message,
    UserInfo? user,
  }) {
    return UserInfoResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      user: user ?? this.user,
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
    if (user != null) {
      map['user'] = user!.toMap();
    }
    return map;
  }

  factory UserInfoResponse.fromMap(Map<String, dynamic> map) {
    return UserInfoResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      user: map['user'] != null ? UserInfo.fromMap(
        map['user'] as Map<String, dynamic>,
      ) : null,
    );
  }

//</editor-fold>
}
