import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/responses/feedback/feedback_list_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class FeedbackRepository extends BaseRepository {
  FeedbackRepository() : super(ApiServices.feedback);

  Future<FeedbackListResponse> getListFeedback({
    required String tutorId, required int page, required int perPage,
  }) async {
    return FeedbackListResponse.fromJson(await request(
        method: ApiMethods.get,
        path: '$tutorId?page=$page&perPage=$perPage',
        headers: {
          ApiConstants.contentType: ApiConstants.textPlain,
        }
    ));
  }
}
