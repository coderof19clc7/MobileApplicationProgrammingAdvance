import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/responses/course/course_info_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class CourseRepository extends BaseRepository {
  CourseRepository() : super(ApiServices.course);

  Future<CourseInfoResponse> getCourseInformation({
    required String courseId,
  }) async {
    return CourseInfoResponse.fromJson(await request(
      method: ApiMethods.get,
      path: courseId,
    ));
  }
}
