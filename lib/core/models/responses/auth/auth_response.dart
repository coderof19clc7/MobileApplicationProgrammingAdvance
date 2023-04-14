import 'package:one_one_learn/core/models/responses/auth/tokens.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';

class AuthResponse extends BaseResponse {
  final Tokens? tokens;
  final UserInfo? user;

  @override
  List<Object?> get props => [
    ...super.props,
    tokens,
    user,
  ];

//<editor-fold desc="Data Methods">
  const AuthResponse({
    super.statusCode,
    super.message,
    this.tokens,
    this.user,
  });

  factory AuthResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return AuthResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      tokens: mapJson['tokens'] != null ? Tokens.fromJson(mapJson['tokens'] as Map<String, dynamic>) : null,
      user: mapJson['user'] != null ? UserInfo.fromJson(mapJson['user'] as Map<String, dynamic>) : null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthResponse &&
          runtimeType == other.runtimeType &&
          tokens == other.tokens &&
          user == other.user);

  @override
  int get hashCode => tokens.hashCode ^ user.hashCode;

  @override
  String toString() {
    return 'AuthResponse{ tokens: $tokens, user: $user, }';
  }

  AuthResponse copyWith({
    Tokens? tokens,
    UserInfo? user,
  }) {
    return AuthResponse(
      tokens: tokens ?? this.tokens,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (statusCode != null) {
      map['statusCode'] = statusCode;
    }
    if (message != null) {
      map['message'] = message;
    }
    if (tokens != null) {
      map['tokens'] = tokens?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (statusCode != null) {
      map['statusCode'] = statusCode;
    }
    if (message != null) {
      map['message'] = message;
    }
    if (tokens != null) {
      map['tokens'] = tokens?.toMap();
    }
    if (user != null) {
      map['user'] = user?.toMap();
    }
    return map;
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      tokens: map['tokens'] != null ? Tokens.fromMap(map['tokens'] as Map<String, dynamic>) : null,
      user: map['user'] != null ? UserInfo.fromMap(map['user'] as Map<String, dynamic>) : null,
    );
  }

//</editor-fold>
}