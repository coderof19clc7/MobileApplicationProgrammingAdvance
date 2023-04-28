import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class CallRepository extends BaseRepository {
  CallRepository() : super(ApiServices.call);

  Future<int> getTotalCallMinute() async {
    final response = await request(
      method: ApiMethods.get,
      path: ApiEndpoints.total,
      headers: {
        ApiConstants.contentType: ApiConstants.textPlain,
      },
    );

    try {
      return int.parse(response?['total'].toString() ?? '0');
    } catch (e) {
      return 0;
    }
  }
}
