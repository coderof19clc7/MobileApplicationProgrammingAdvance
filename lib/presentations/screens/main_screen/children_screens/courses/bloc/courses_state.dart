part of 'courses_cubit.dart';

@immutable
class CoursesState extends WidgetState {
  final int nextPage;
  final int total;
  final String? coursesSearchText;
  final List<CourseInformation?> listCourses;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return CoursesState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      nextPage: mapJson['nextPage'] as int,
      total: mapJson['total'] as int,
      coursesSearchText: mapJson['coursesSearchText'] as String?,
      listCourses: mapJson['listCourses'] != null
          ? (mapJson['listCourses'] as List).map((e) {
              return e != null ? CourseInformation.fromJson(e) : null;
            }).toList()
          : const <CourseInformation?>[null, null, null],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['nextPage'] = nextPage;
    map['total'] = total;
    map['coursesSearchText'] = coursesSearchText;
    map['listCourses'] = listCourses.map((e) => e?.toJson()).toList();
    return map;
  }

//<editor-fold desc="Data Methods">
  const CoursesState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.nextPage = 1,
    this.total = 0,
    this.coursesSearchText,
    this.listCourses = const <CourseInformation?>[null, null, null],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoursesState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          needNavigateToLogin == other.needNavigateToLogin &&
          basicStatusFToastState == other.basicStatusFToastState &&
          nextPage == other.nextPage &&
          total == other.total &&
          coursesSearchText == other.coursesSearchText &&
          listCourses == other.listCourses);

  @override
  int get hashCode => isLoading.hashCode
      ^ needNavigateToLogin.hashCode
      ^ basicStatusFToastState.hashCode
      ^ nextPage.hashCode
      ^ total.hashCode
      ^ coursesSearchText.hashCode
      ^ listCourses.hashCode;

  @override
  String toString() {
    return 'CoursesState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' nextPage: $nextPage,'
        ' total: $total,'
        ' coursesSearchText: $coursesSearchText,'
        ' listCourses: $listCourses,'
        ' }';
  }

  CoursesState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? nextPage,
    int? size,
    int? total,
    String? coursesSearchText,
    List<CourseInformation?>? listCourses,
  }) {
    return CoursesState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      nextPage: nextPage ?? this.nextPage,
      total: total ?? this.total,
      coursesSearchText: coursesSearchText ?? this.coursesSearchText,
      listCourses: listCourses ?? this.listCourses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'nextPage': nextPage,
      'total': total,
      'coursesSearchText': coursesSearchText,
      'listCourses': listCourses,
    };
  }

  factory CoursesState.fromMap(Map<String, dynamic> map) {
    return CoursesState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      nextPage: map['nextPage'] as int? ?? 1,
      total: map['total'] as int? ?? 0,
      coursesSearchText: map['coursesSearchText'] as String?,
      listCourses: map['listCourses'] != null
          ? (map['listCourses'] as List).map((e) {
            return e != null ? CourseInformation.fromMap(e as Map<String, dynamic>) : null;
          }).toList()
          : const <CourseInformation?>[null, null, null]
    );
  }


//</editor-fold>
}
