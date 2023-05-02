import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/report/report_tutor_request.dart';
import 'package:one_one_learn/core/models/responses/report/report_tutor_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class ReportRepository extends BaseRepository {
  ReportRepository() : super(ApiServices.report);

  Future<ReportTutorResponse> sendReportTutor({
    required ReportTutorRequest reportTutorRequest,
  }) async {
    return ReportTutorResponse.fromJson(await request(
        method: ApiMethods.post,
        path: '',
        data: reportTutorRequest,
    ));
  }
}
