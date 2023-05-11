import 'package:dio/dio.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/user/put_user_info_request.dart';
import 'package:one_one_learn/core/models/requests/user/user_manage_favorite_tutor_request.dart';
import 'package:one_one_learn/core/models/requests/user/user_forgot_password.dart';
import 'package:one_one_learn/core/models/requests/user/user_upload_avatar_request.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_info_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_manage_favorite_tutor_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class UserRepository extends BaseRepository {
  UserRepository() : super(ApiServices.user);

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

  Future<UserInfoResponse> getUserInfo() async {
    final userInfoResponse = UserInfoResponse.fromJson(await request(
      method: ApiMethods.get,
      path: ApiEndpoints.info,
      headers: {
        ApiConstants.contentType: ApiConstants.textPlain,
      }
    ));

    return userInfoResponse;
  }

  Future<BaseResponse> putUserInfoChanges({
    required PutUserInfoRequest putUserInfoRequest,
  }) async {
    return BaseResponse.fromJson(await request(
      method: ApiMethods.put,
      path: ApiEndpoints.info,
      data: putUserInfoRequest,
    ));
  }

  Future<BaseResponse> uploadUserAvatar({
    required String avatar,
  }) async {
    final userUploadAvatarRequest = UserUploadAvatarRequest(
      avatar: MultipartFile.fromFileSync(
        avatar,
        filename: avatar.split('/').last,
      )
    );

    return BaseResponse.fromJson(await requestFormData(
      method: ApiMethods.post,
      path: ApiEndpoints.uploadAvatar,
      data: FormData.fromMap(userUploadAvatarRequest.toJson()),
    ));
  }
}
