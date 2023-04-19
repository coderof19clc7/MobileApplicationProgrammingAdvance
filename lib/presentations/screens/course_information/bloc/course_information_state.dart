part of 'course_information_cubit.dart';

class CourseInformationState extends WidgetState {
  final String courseId;
  final String category;
  final CourseInfoResponse courseInfoResponse;

  @override
  List<Object?> get props => [...super.props, courseId, courseInfoResponse];

  const CourseInformationState({
    this.courseId = '',
    this.category = '',
    this.courseInfoResponse = const CourseInfoResponse(),
  });

  CourseInformationState copyWith({
    String? courseId,
    String? category,
    CourseInfoResponse? courseInfoResponse,
  }) {
    return CourseInformationState(
      courseId: courseId ?? this.courseId,
      category: category ?? this.category,
      courseInfoResponse: courseInfoResponse ?? this.courseInfoResponse,
    );
  }

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return CourseInformationState(
      courseId: mapJson['courseId'] as String? ?? '',
      category: mapJson['category'] as String? ?? '',
      courseInfoResponse: mapJson['courseInfoResponse'] != null ? CourseInfoResponse.fromJson(mapJson['courseInfoResponse']) : const CourseInfoResponse(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['courseId'] = courseId;
    map['category'] = category;
    map['courseInfoResponse'] = courseInfoResponse.toJson();
    return map;
  }

  @override
  String toString() => 'CourseInformationState(courseId: $courseId, category: $category, courseInfoResponse: $courseInfoResponse)';
}
