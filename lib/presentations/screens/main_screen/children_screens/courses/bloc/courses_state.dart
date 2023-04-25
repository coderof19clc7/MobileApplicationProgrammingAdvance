part of 'courses_cubit.dart';

@immutable
class CoursesState extends WidgetState {
  final int nextPage;
  final int total;
  final String? coursesSearchText;
  final List<CourseInformation?> listCourses;
  final List<String> listCategoriesId;
  final List<int> listLevelValues;
  final int sortValue;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return CoursesState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      nextPage: mapJson['nextPage'] as int? ?? 1,
      total: mapJson['total'] as int? ?? 0,
      coursesSearchText: mapJson['coursesSearchText'] as String?,
      listCourses: mapJson['listCourses'] != null
          ? (mapJson['listCourses'] as List).map((e) {
              return e != null ? CourseInformation.fromJson(e) : null;
            }).toList()
          : const <CourseInformation?>[null, null, null],
      listCategoriesId: mapJson['listCategoriesId'] != null
          ? (mapJson['listCategoriesId'] as List).map((e) => e as String).toList()
          : const <String>[],
      listLevelValues: mapJson['listLevelValues'] != null
          ? (mapJson['listLevelValues'] as List).map((e) => e as int).toList()
          : const <int>[],
      sortValue: mapJson['sortValue'] as int? ?? 0,
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
    map['listCategoriesId'] = listCategoriesId;
    map['listLevelValues'] = listLevelValues;
    map['sortValue'] = sortValue;
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
    this.listCategoriesId = const <String>[],
    this.listLevelValues = const <int>[],
    this.sortValue = 0,
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
          listCourses == other.listCourses &&
          listCategoriesId == other.listCategoriesId &&
          listLevelValues == other.listLevelValues &&
          sortValue == other.sortValue);

  @override
  int get hashCode => isLoading.hashCode
      ^ needNavigateToLogin.hashCode
      ^ basicStatusFToastState.hashCode
      ^ nextPage.hashCode
      ^ total.hashCode
      ^ coursesSearchText.hashCode
      ^ listCourses.hashCode
      ^ listCategoriesId.hashCode
      ^ listLevelValues.hashCode
      ^ sortValue.hashCode;

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
        ' listCategoriesId: $listCategoriesId,'
        ' listLevelValues: $listLevelValues,'
        ' sortValue: $sortValue,'
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
    List<String>? listCategoriesId,
    List<int>? listLevelValues,
    int? sortValue,
  }) {
    return CoursesState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      nextPage: nextPage ?? this.nextPage,
      total: total ?? this.total,
      coursesSearchText: coursesSearchText ?? this.coursesSearchText,
      listCourses: listCourses ?? this.listCourses,
      listCategoriesId: listCategoriesId ?? this.listCategoriesId,
      listLevelValues: listLevelValues ?? this.listLevelValues,
      sortValue: sortValue ?? this.sortValue,
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
      'listCategoriesId': listCategoriesId,
      'listLevelValues': listLevelValues,
      'sortValue': sortValue,
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
          : const <CourseInformation?>[null, null, null],
      listCategoriesId: map['listCategoriesId'] != null
          ? (map['listCategoriesId'] as List).map((e) => e as String).toList()
          : const <String>[],
      listLevelValues: map['listLevelValues'] != null
          ? (map['listLevelValues'] as List).map((e) => e as int).toList()
          : const <int>[],
      sortValue: map['sortValue'] as int? ?? 0,
    );
  }


//</editor-fold>
}
