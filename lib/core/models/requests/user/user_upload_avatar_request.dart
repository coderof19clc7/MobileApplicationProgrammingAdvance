import 'package:dio/dio.dart';
import 'package:one_one_learn/core/models/requests/base_request.dart';

class UserUploadAvatarRequest extends BaseRequest {
  final MultipartFile? avatar;

//<editor-fold desc="Data Methods">
  const UserUploadAvatarRequest({
    this.avatar,
  });

  factory UserUploadAvatarRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return UserUploadAvatarRequest(
      avatar: mapJson['avatar'] != null ? mapJson['avatar'] as MultipartFile : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (avatar != null) {
      data['avatar'] = avatar;
    }
    return data;
  }

  @override
  List<Object?> get props => [avatar];

  @override
  String toString() {
    return 'UserUploadAvatarRequest{'
        ' avatar: $avatar,'
        ' }';
  }

  UserUploadAvatarRequest copyWith({
    MultipartFile? avatar,
  }) {
    return UserUploadAvatarRequest(avatar: avatar ?? this.avatar);
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
    };
  }

  factory UserUploadAvatarRequest.fromMap(Map<String, dynamic> map) {
    return UserUploadAvatarRequest(
      avatar: map['avatar'] as MultipartFile?,
    );
  }

//</editor-fold>
}
