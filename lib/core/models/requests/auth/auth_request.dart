import 'package:one_one_learn/core/models/requests/base_request.dart';

class AuthRequest extends BaseRequest {
  final String? email;
  final String? phone;
  final String? password;
  final String? newPassword;
  final String? otp;
  final dynamic source;

//<editor-fold desc="Data Methods">
  const AuthRequest({
    this.email,
    this.phone,
    this.password,
    this.newPassword,
    this.otp,
    this.source,
  });

  factory AuthRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return AuthRequest(
      email: mapJson['email'] as String?,
      phone: mapJson['phone'] as String?,
      password: mapJson['password'] as String?,
      newPassword: mapJson['newPassword'] as String?,
      otp: mapJson['otp'] as String?,
      source: mapJson['source'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (email != null) {
      map['email'] = email;
    }
    if (phone != null) {
      map['phone'] = phone;
    }
    if (password != null) {
      map['password'] = password;
    }
    if (newPassword != null) {
      map['newPassword'] = newPassword;
    }
    if (otp != null) {
      map['otp'] = otp;
    }
    if (source != null) {
      map['source'] = source;
    }
    return map;
  }

  @override
  List<Object?> get props => [
    email,
    phone,
    password,
    newPassword,
    otp,
    source,
  ];

  @override
  String toString() {
    return 'AuthRequest{'
        ' email: $email,'
        ' phone: $phone,'
        ' password: $password,'
        ' newPassword: $newPassword,'
        ' otp: $otp,'
        ' source: $source,'
        ' }';
  }

  AuthRequest copyWith({
    String? email,
    String? phone,
    String? password,
    String? newPassword,
    String? otp,
    dynamic? source,
  }) {
    return AuthRequest(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      otp: otp ?? this.otp,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'password': password,
      'newPassword': newPassword,
      'otp': otp,
      'source': source,
    };
  }

  factory AuthRequest.fromMap(Map<String, dynamic> map) {
    return AuthRequest(
      email: map['email'] as String?,
      phone: map['phone'] as String?,
      password: map['password'] as String?,
      newPassword: map['newPassword'] as String?,
      otp: map['otp'] as String?,
      source: map['source'] as dynamic,
    );
  }

//</editor-fold>
}