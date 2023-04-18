import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/user/user_forgot_password.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository() : super(ApiServices.user);

  var userInfo = const UserInfo();

  Future<BaseResponse> sendForgotPasswordRequest(String email) async {
    return BaseResponse.fromJson(await request(
      method: ApiMethods.post,
      path: ApiEndpoints.forgotPassword,
      needAuth: false,
      data: UserForgotPasswordRequest(email: email),
    ));
  }
}
