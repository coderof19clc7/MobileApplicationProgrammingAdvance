part of 'course_information_cubit.dart';

class CourseInformationState extends WidgetState {
  final String courseId;
  final List<String> categories;
  final CourseInformation? courseInformation;

  @override
  List<Object?> get props => [...super.props, courseId, categories, courseInformation,];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return CourseInformationState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      courseId: mapJson['courseId'] as String? ?? '',
      categories: mapJson['category'] != null
          ? (mapJson['category'] as List).map((e) => e as String).toList()
          : const <String>[],
      courseInformation: mapJson['courseInformation'] != null
          ? CourseInformation.fromJson(mapJson['courseInformation'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['courseId'] = courseId;
    map['category'] = categories;
    map['courseInformation'] = courseInformation?.toJson();
    return map;
  }

//<editor-fold desc="Data Methods">
  const CourseInformationState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    required this.courseId,
    required this.categories,
    this.courseInformation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseInformationState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          needNavigateToLogin == other.needNavigateToLogin &&
          basicStatusFToastState == other.basicStatusFToastState &&
          courseId == other.courseId &&
          listEquals(categories, other.categories) &&
          courseInformation == other.courseInformation);

  @override
  int get hashCode =>
      isLoading.hashCode ^
      needNavigateToLogin.hashCode ^
      basicStatusFToastState.hashCode ^
      courseId.hashCode ^
      categories.hashCode ^
      courseInformation.hashCode;

  @override
  String toString() {
    return 'CourseInformationState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' courseId: $courseId,'
        ' categories: $categories,'
        ' courseInformation: $courseInformation,'
        ' }';
  }

  CourseInformationState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    String? courseId,
    List<String>? categories,
    CourseInformation? courseInformation,
  }) {
    return CourseInformationState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      courseId: courseId ?? this.courseId,
      categories: categories ?? this.categories,
      courseInformation: courseInformation ?? this.courseInformation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'courseId': courseId,
      'categories': categories,
      'courseInformation': courseInformation,
    };
  }

  factory CourseInformationState.fromMap(Map<String, dynamic> map) {
    return CourseInformationState(
      isLoading: map['isLoading'] as bool,
      needNavigateToLogin: map['needNavigateToLogin'] as bool,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      courseId: map['courseId'] as String,
      categories: map['categories'] != null
          ? (map['categories'] as List).map((e) => e.toString()).toList()
          : const <String>[],
      courseInformation: map['courseInformation'] != null
          ? CourseInformation.fromMap(map['courseInformation'] as Map<String, dynamic>)
          : null
    );
  }

//</editor-fold>
}
