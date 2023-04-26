part of 'upcoming_cubit.dart';

@immutable
class UpcomingState extends WidgetState {
  final int page;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return UpcomingState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      page: mapJson['page'] as int? ?? 1,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    if (basicStatusFToastState != null) {
      map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    }
    map['page'] = page;
    return map;
  }

//<editor-fold desc="Data Methods">
  const UpcomingState({
    super.isLoading,
    super.needNavigateToLogin,
    super.basicStatusFToastState,
    this.page = 1,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpcomingState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          needNavigateToLogin == other.needNavigateToLogin &&
          basicStatusFToastState == other.basicStatusFToastState &&
          page == other.page);

  @override
  int get hashCode =>
      isLoading.hashCode ^
      needNavigateToLogin.hashCode ^
      basicStatusFToastState.hashCode ^
      page.hashCode;

  @override
  String toString() {
    return 'UpcomingState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' page: $page,'
        ' }';
  }

  UpcomingState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? page,
  }) {
    return UpcomingState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'page': page,
    };
  }

  factory UpcomingState.fromMap(Map<String, dynamic> map) {
    return UpcomingState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      page: map['page'] as int? ?? 1,
    );
  }

//</editor-fold>
}
