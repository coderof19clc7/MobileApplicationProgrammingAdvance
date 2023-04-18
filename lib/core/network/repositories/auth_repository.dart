import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/auth/auth_request.dart';
import 'package:one_one_learn/core/models/responses/auth/auth_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository() : super(ApiServices.auth);

  Future<AuthResponse> login(String email, String password) async {
    return AuthResponse.fromJson(await request(
      method: ApiMethods.post,
      path: ApiEndpoints.login,
      needAuth: false,
      data: AuthRequest(email: email, password: password),
    ));
  }

  Future<AuthResponse> register(String email, String password) async {
    return AuthResponse.fromJson(await request(
      method: ApiMethods.post,
      path: ApiEndpoints.register,
      needAuth: false,
      data: AuthRequest(email: email, password: password),
    ));
  }
}
