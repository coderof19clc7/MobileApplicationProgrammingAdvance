import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/schedule_by_tutor_id_request.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/schedule_by_tutor_id_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class ScheduleRepository extends BaseRepository {
  ScheduleRepository() : super(ApiServices.schedule);

  Future<ScheduleByTutorIDResponse> getScheduleOfTutor({
    required ScheduleByTutorIdRequest query,
  }) async {
    return ScheduleByTutorIDResponse.fromJson(await request(
      method: ApiMethods.get,
      path: '',
      queryParameters: query,
    ));
  }
}
