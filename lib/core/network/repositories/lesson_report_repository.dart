import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/report/save_report_lesson_request.dart';
import 'package:one_one_learn/core/models/responses/report/save_report_lesson_resposne.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class LessonReportRepository extends BaseRepository {
  LessonReportRepository() : super(ApiServices.lessonReport);

  Future<SaveReportLessonResponse> saveReportLesson({
    required SaveReportLessonRequest saveReportLessonRequest,
  }) async {
    return SaveReportLessonResponse.fromJson(await request(
      method: ApiMethods.put,
      path: ApiEndpoints.saveReportLesson,
      data: saveReportLessonRequest,
    ));
  }
}
