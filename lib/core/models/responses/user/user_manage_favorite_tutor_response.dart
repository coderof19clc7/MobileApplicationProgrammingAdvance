import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/tutor/favorite_tutor_info.dart';

class UserManageFavoriteTutorResponse extends BaseResponse {
  final dynamic result;

  @override
  List<Object?> get props => [...super.props, result];

//<editor-fold desc="Data Methods">
  const UserManageFavoriteTutorResponse({
    super.statusCode,
    super.message,
    this.result,
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
    if (result != null) {
      if (result is FavoriteTutorInfo) {
        map['result'] = (result as FavoriteTutorInfo).toJson();
      } else {
        map['result'] = result;
      }
    }
    return map;
  }

  factory UserManageFavoriteTutorResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    dynamic result = 1;
    if (mapJson['result'] is Map<String, dynamic>) {
      result = FavoriteTutorInfo.fromJson(mapJson['result']);
    } else {
      result = mapJson['result'];
    }
    return UserManageFavoriteTutorResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      result: result,
    );
  }

  @override
  String toString() {
    return 'UserInfoResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' result: $result,'
        ' }';
  }

  UserManageFavoriteTutorResponse copyWith({
    int? statusCode,
    String? message,
    dynamic result,
  }) {
    return UserManageFavoriteTutorResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      result: result ?? this.result,
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
    if (result != null) {
      if (result is FavoriteTutorInfo) {
        map['result'] = (result as FavoriteTutorInfo).toMap();
      } else {
        map['result'] = result;
      }
    }
    return map;
  }

  factory UserManageFavoriteTutorResponse.fromMap(Map<String, dynamic> map) {
    dynamic result;
    if (map['result'] is Map<String, dynamic>) {
      result = FavoriteTutorInfo.fromMap(map['result'] as Map<String, dynamic>);
    } else {
      result = map['result'];
    }
    return UserManageFavoriteTutorResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      result: result,
    );
  }

//</editor-fold>
}
