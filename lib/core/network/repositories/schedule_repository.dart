import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/schedule/schedule_query_request.dart';
import 'package:one_one_learn/core/models/responses/schedule/schedule_info_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class ScheduleRepository extends BaseRepository {
  ScheduleRepository() : super(ApiServices.schedule);

  Future<ScheduleInfoResponse> getScheduleOfTutor({
    required ScheduleQueryRequest query,
  }) async {
    return ScheduleInfoResponse.fromJson(await request(
      method: ApiMethods.get,
      path: '',
      queryParameters: query,
    ));
  }
}
