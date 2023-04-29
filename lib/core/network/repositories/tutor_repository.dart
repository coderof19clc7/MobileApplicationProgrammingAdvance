import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/tutor/tutor_search_request.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info_response.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_search_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class TutorRepository extends BaseRepository {
  TutorRepository() : super(ApiServices.tutor);

  Future<TutorSearchResponse> search(TutorSearchRequest searchRequest) async {
    return TutorSearchResponse.fromJson(await request(
      method: ApiMethods.post,
      path: ApiEndpoints.search,
      data: searchRequest,
    ));
  }

  Future<TutorInfoResponse> getTutorInfoById(String tutorId) async {
    final result = await request(
      method: ApiMethods.get,
      path: tutorId,
      headers: {
        ApiConstants.contentType: ApiConstants.textPlain,
      },
    );
    final tutorInfo = TutorInfo.fromJson(result);

    return TutorInfoResponse(
      statusCode: result?['statusCode'] as int?,
      message: result?['message'] as String?,
      data: tutorInfo,
    );
  }
}
