import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/firebase_constants.dart';
import 'package:one_one_learn/core/models/requests/auth/auth_request.dart';
import 'package:one_one_learn/core/models/requests/auth/social_auth_request.dart';
import 'package:one_one_learn/core/models/responses/auth/auth_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository() : super(ApiServices.auth);

  Future<AuthResponse> login(String email, String password) async {
    final loginResponse = AuthResponse.fromJson(await request(
      method: ApiMethods.post,
      path: ApiEndpoints.login,
      needAuth: false,
      data: AuthRequest(email: email, password: password),
    ));


    firebaseAnalytics.logLogin(loginMethod: FirebaseAnalyticsConstants.normalLogin);

    return loginResponse;
  }

  Future<AuthResponse> socialLogin(String socialLoginMethod, String accessToken) async {
    String getEndPoint() {
      if (socialLoginMethod == FirebaseAnalyticsConstants.facebookLogin) {
        return ApiEndpoints.facebook;
      }
      return ApiEndpoints.google;
    }

    final socialLoginResponse = AuthResponse.fromJson(await request(
      method: ApiMethods.post,
      path: getEndPoint(),
      needAuth: false,
      data: SocialAuthRequest(accessToken: accessToken),
    ));

    firebaseAnalytics.logLogin(loginMethod: socialLoginMethod);

    return socialLoginResponse;
  }

  Future<AuthResponse> register(String email, String password) async {
    final signUpResponse = AuthResponse.fromJson(await request(
      method: ApiMethods.post,
      path: ApiEndpoints.register,
      needAuth: false,
      data: AuthRequest(email: email, password: password),
    ));

    firebaseAnalytics.logSignUp(signUpMethod: FirebaseAnalyticsConstants.signUp);

    return signUpResponse;
  }
}
