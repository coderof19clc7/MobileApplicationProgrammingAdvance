import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/user/user_manage_favorite_tutor_request.dart';
import 'package:one_one_learn/core/models/requests/user/user_forgot_password.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_manage_favorite_tutor_response.dart';
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

  Future<UserManageFavoriteTutorResponse> manageFavoriteTutor(String tutorId) async {
    return UserManageFavoriteTutorResponse.fromJson(await request(
      method: ApiMethods.post,
      path: ApiEndpoints.manageFavoriteTutor,
      data: UserManageFavoriteTutorRequest(tutorId: tutorId),
    ));
  }
}
