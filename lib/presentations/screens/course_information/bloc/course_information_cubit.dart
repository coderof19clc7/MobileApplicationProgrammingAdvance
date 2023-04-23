import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/course/course_info_response.dart';
import 'package:one_one_learn/core/models/responses/course/course_information.dart';
import 'package:one_one_learn/core/network/repositories/course_repository.dart';

part 'course_information_state.dart';

class CourseInformationCubit extends WidgetCubit<CourseInformationState> {
  CourseInformationCubit({
    required String courseId,
    required List<String> categories,
  }) : super(widgetState: CourseInformationState(
    courseId: courseId,
    categories: categories,
  ));

  @override
  void onWidgetCreated() {}

  final _courseRepository = injector<CourseRepository>();

  Future getCourseInformation() async {
    final courseInfoResponse = await fetchApi<CourseInfoResponse>(
      () async => _courseRepository.getCourseInformation(
        courseId: state.courseId,
      ),
    );

    if (courseInfoResponse != null) {
      if (courseInfoResponse.statusCode == ApiStatusCode.success
          && courseInfoResponse.data != null
      ) {
        emit(state.copyWith(courseInformation: courseInfoResponse.data));
      }
    }
  }
}
