import 'package:one_one_learn/core/models/requests/base_request.dart';

class AuthForgotPasswordRequest extends BaseRequest {
  final String? password;
  final String? newPassword;

//<editor-fold desc="Data Methods">
  const AuthForgotPasswordRequest({
    this.password,
    this.newPassword,
  });

  factory AuthForgotPasswordRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return AuthForgotPasswordRequest(
      password: mapJson['password'] as String?,
      newPassword: mapJson['newPassword'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['newPassword'] = newPassword;
    return map;
  }

  @override
  List<Object?> get props => [
    password,
    newPassword,
  ];

  @override
  String toString() {
    return 'AuthRequest{'
        ' password: $password,'
        ' newPassword: $newPassword,'
        ' }';
  }

  AuthForgotPasswordRequest copyWith({
    String? password,
    String? newPassword,
  }) {
    return AuthForgotPasswordRequest(
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'newPassword': newPassword,
    };
  }

  factory AuthForgotPasswordRequest.fromMap(Map<String, dynamic> map) {
    return AuthForgotPasswordRequest(
      password: map['password'] as String?,
      newPassword: map['newPassword'] as String?,
    );
  }

//</editor-fold>
}