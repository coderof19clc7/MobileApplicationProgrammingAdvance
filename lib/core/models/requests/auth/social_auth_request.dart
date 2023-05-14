import 'package:one_one_learn/core/models/requests/base_request.dart';

class SocialAuthRequest extends BaseRequest {
  final String? accessToken;

//<editor-fold desc="Data Methods">
  const SocialAuthRequest({
    this.accessToken,
  });

  factory SocialAuthRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return SocialAuthRequest(
      accessToken: mapJson['access_token'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (accessToken != null) {
      map['access_token'] = accessToken;
    }
    return map;
  }

  @override
  List<Object?> get props => [accessToken];

  @override
  String toString() {
    return 'SocialAuthRequest{'
        ' access_token: $accessToken,'
        ' }';
  }

  SocialAuthRequest copyWith({
    String? accessToken,
  }) {
    return SocialAuthRequest(
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
    };
  }

  factory SocialAuthRequest.fromMap(Map<String, dynamic> map) {
    return SocialAuthRequest(
      accessToken: map['access_token'] as String?,
    );
  }

//</editor-fold>
}