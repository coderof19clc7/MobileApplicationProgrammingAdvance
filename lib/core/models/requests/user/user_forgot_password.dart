import 'package:one_one_learn/core/models/requests/base_request.dart';

class UserForgotPasswordRequest extends BaseRequest {
  final String? email;

//<editor-fold desc="Data Methods">
  const UserForgotPasswordRequest({
    this.email,
  });

  factory UserForgotPasswordRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return UserForgotPasswordRequest(
      email: mapJson['email'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }

  @override
  List<Object?> get props => [email];

  @override
  String toString() {
    return 'UserForgotPasswordRequest{ email: $email }';
  }

  UserForgotPasswordRequest copyWith({
    String? email,
  }) {
    return UserForgotPasswordRequest(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory UserForgotPasswordRequest.fromMap(Map<String, dynamic> map) {
    return UserForgotPasswordRequest(
      email: map['email'] as String?,
    );
  }

//</editor-fold>
}
