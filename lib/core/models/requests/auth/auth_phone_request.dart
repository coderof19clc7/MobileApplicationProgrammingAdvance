import 'package:one_one_learn/core/models/requests/base_request.dart';

class AuthRequest extends BaseRequest {
  final String? phone;
  final String? password;
  final String? otp;
  final dynamic source;

//<editor-fold desc="Data Methods">
  const AuthRequest({
    this.phone,
    this.password,
    this.otp,
    this.source,
  });

  factory AuthRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return AuthRequest(
      phone: mapJson['phone'] as String?,
      password: mapJson['password'] as String?,
      otp: mapJson['otp'] as String?,
      source: mapJson['source'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
    map['otp'] = otp;
    map['source'] = source;
    return map;
  }

  @override
  List<Object?> get props => [
    phone,
    password,
    otp,
    source,
  ];

  @override
  String toString() {
    return 'AuthRequest{'
        ' phone: $phone,'
        ' password: $password,'
        ' otp: $otp,'
        ' source: $source,'
        ' }';
  }

  AuthRequest copyWith({
    String? phone,
    String? password,
    String? otp,
    dynamic? source,
  }) {
    return AuthRequest(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      otp: otp ?? this.otp,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'password': password,
      'otp': otp,
      'source': source,
    };
  }

  factory AuthRequest.fromMap(Map<String, dynamic> map) {
    return AuthRequest(
      phone: map['phone'] as String?,
      password: map['password'] as String?,
      otp: map['otp'] as String?,
      source: map['source'] as dynamic,
    );
  }

//</editor-fold>
}