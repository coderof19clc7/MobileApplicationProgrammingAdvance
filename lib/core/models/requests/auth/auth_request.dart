import 'package:one_one_learn/core/models/requests/base_request.dart';

class AuthRequest extends BaseRequest {
  final String? email;
  final String? password;
  final dynamic source;

//<editor-fold desc="Data Methods">
  const AuthRequest({
    this.email,
    this.password,
    this.source,
  });

  factory AuthRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return AuthRequest(
      email: mapJson['email'] as String?,
      password: mapJson['password'] as String?,
      source: mapJson['source'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['source'] = source;
    return map;
  }

  @override
  List<Object?> get props => [
    email,
    password,
    source,
  ];

  @override
  String toString() {
    return 'AuthRequest{'
        ' email: $email,'
        ' password: $password,'
        ' source: $source,'
        ' }';
  }

  AuthRequest copyWith({
    String? email,
    String? password,
    dynamic? source,
  }) {
    return AuthRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'source': source,
    };
  }

  factory AuthRequest.fromMap(Map<String, dynamic> map) {
    return AuthRequest(
      email: map['email'] as String?,
      password: map['password'] as String?,
      source: map['source'] as dynamic,
    );
  }

//</editor-fold>
}