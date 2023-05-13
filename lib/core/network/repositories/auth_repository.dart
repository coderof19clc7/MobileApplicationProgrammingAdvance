import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/firebase_constants.dart';
import 'package:one_one_learn/core/models/requests/auth/auth_request.dart';
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
