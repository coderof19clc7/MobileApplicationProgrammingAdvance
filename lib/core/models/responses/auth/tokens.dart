
import 'package:one_one_learn/core/models/responses/base_response.dart';

/// access : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYjllN2RlYi0zMzgyLTQ4ZGItYjA3Yy05MGFjZjUyZjU0MWMiLCJpYXQiOjE2ODEyNjg3NzUsImV4cCI6MTY4MTM1NTE3NSwidHlwZSI6ImFjY2VzcyJ9.IfzW5HLoVFi6hbOrGivEQ9NdpTKMtU7I2mXuCdsCXok","expires":"2023-04-13T03:06:15.765Z"}
/// refresh : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYjllN2RlYi0zMzgyLTQ4ZGItYjA3Yy05MGFjZjUyZjU0MWMiLCJpYXQiOjE2ODEyMzMyMTAsImV4cCI6MTY4MzgyNTIxMCwidHlwZSI6InJlZnJlc2gifQ.XWPexuT4FNcibwZtWOjDlNAxWVAMLNxtnCYgj7ncQhQ","expires":"2023-05-11T17:13:30.398Z"}
class Tokens {

//<editor-fold desc="Data Methods">
  Tokens({
    this.access,
    this.refresh,
  });

  factory Tokens.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    final access = mapJson['access'] != null ? SingleToken.fromJson(mapJson['access']) : null;
    final refresh = mapJson['refresh'] != null ? SingleToken.fromJson(mapJson['refresh']) : null;

    return Tokens(
      access: access,
      refresh: refresh,
    );
  }

  SingleToken? access;
  SingleToken? refresh;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (access != null) {
      map['access'] = access?.toJson();
    }
    if (refresh != null) {
      map['refresh'] = refresh?.toJson();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tokens &&
          runtimeType == other.runtimeType &&
          access == other.access &&
          refresh == other.refresh);

  @override
  int get hashCode => access.hashCode ^ refresh.hashCode;

  @override
  String toString() {
    return 'Tokens{ access: $access, refresh: $refresh, }';
  }

  Tokens copyWith({
    SingleToken? access,
    SingleToken? refresh,
  }) {
    return Tokens(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (access != null) {
      map['access'] = access?.toJson();
    }
    if (refresh != null) {
      map['refresh'] = refresh?.toJson();
    }
    return map;
  }

  factory Tokens.fromMap(Map<String, dynamic> map) {
    final access = map['access'] != null ? SingleToken.fromJson(map['access']) : null;
    final refresh = map['refresh'] != null ? SingleToken.fromJson(map['refresh']) : null;

    return Tokens(
      access: access,
      refresh: refresh,
    );
  }

//</editor-fold>
}

// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYjllN2RlYi0zMzgyLTQ4ZGItYjA3Yy05MGFjZjUyZjU0MWMiLCJpYXQiOjE2ODEyMzMyMTAsImV4cCI6MTY4MzgyNTIxMCwidHlwZSI6InJlZnJlc2gifQ.XWPexuT4FNcibwZtWOjDlNAxWVAMLNxtnCYgj7ncQhQ"
// expires : "2023-05-11T17:13:30.398Z"
class SingleToken {

//<editor-fold desc="Data Methods">
  SingleToken({
    this.token,
    this.expires,
  });

  factory SingleToken.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return SingleToken(
      token: mapJson['token'] as String?,
      expires: mapJson['expires'] as String?,
    );
  }

  String? token;
  String? expires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['expires'] = expires;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SingleToken &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          expires == other.expires);

  @override
  int get hashCode => token.hashCode ^ expires.hashCode;

  @override
  String toString() {
    return 'SingleToken{ token: $token, expires: $expires, }';
  }

  SingleToken copyWith({
    String? token,
    String? expires,
  }) {
    return SingleToken(
      token: token ?? this.token,
      expires: expires ?? this.expires,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'expires': expires,
    };
  }

  factory SingleToken.fromMap(Map<String, dynamic> map) {
    return SingleToken(
      token: map['token'] as String,
      expires: map['expires'] as String,
    );
  }

//</editor-fold>
}
