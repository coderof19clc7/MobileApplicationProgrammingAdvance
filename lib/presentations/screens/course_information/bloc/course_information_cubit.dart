import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/course/course_info_response.dart';
import 'package:one_one_learn/core/network/repositories/course_repository.dart';

part 'course_information_state.dart';

class CourseInformationCubit extends WidgetCubit<CourseInformationState> {
  CourseInformationCubit({
    required String courseId,
    required String category,
  }) : super(widgetState: CourseInformationState(courseId: courseId, category: category));

  final _courseRepository = injector<CourseRepository>();

  Future getCourseInformation() async {
    final courseInfoResponse = await fetchApi(
      () async => _courseRepository.getCourseInformation(
        courseId: state.courseId,
      ),
    );

    if (courseInfoResponse != null && courseInfoResponse is CourseInfoResponse && courseInfoResponse.data != null) {
      emit(state.copyWith(courseInfoResponse: courseInfoResponse));
    }
  }

  @override
  void onWidgetCreated() {}
}
