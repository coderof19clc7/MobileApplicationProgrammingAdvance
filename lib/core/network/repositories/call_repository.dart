import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/responses/call/call_total_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class CallRepository extends BaseRepository {
  CallRepository() : super(ApiServices.call);

  Future<CallTotalResponse> getTotalCallMinute() async {
    return CallTotalResponse.fromJson(await request(
      method: ApiMethods.get,
      path: ApiEndpoints.total,
      headers: {
        ApiConstants.contentType: ApiConstants.textPlain,
      },
    ));
  }
}
