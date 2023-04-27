part of 'upcoming_cubit.dart';

@immutable
class UpcomingState extends WidgetState {
  final bool isLoadingMore;
  final int nextPage;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return UpcomingState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      isLoadingMore: mapJson['isLoadingMore'] as bool? ?? false,
      nextPage: mapJson['nextPage'] as int? ?? 1,
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
    map['isLoadingMore'] = isLoadingMore;
    map['nextPage'] = nextPage;
    return map;
  }

//<editor-fold desc="Data Methods">
  const UpcomingState({
    super.isLoading,
    super.needNavigateToLogin,
    super.basicStatusFToastState,
    this.isLoadingMore = false,
    this.nextPage = 1,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpcomingState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          needNavigateToLogin == other.needNavigateToLogin &&
          basicStatusFToastState == other.basicStatusFToastState &&
          isLoadingMore == other.isLoadingMore &&
          nextPage == other.nextPage);

  @override
  int get hashCode =>
      isLoading.hashCode ^
      needNavigateToLogin.hashCode ^
      basicStatusFToastState.hashCode ^
      isLoadingMore.hashCode ^
      nextPage.hashCode;

  @override
  String toString() {
    return 'UpcomingState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' isLoadingMore: $isLoadingMore,'
        ' page: $nextPage,'
        ' }';
  }

  UpcomingState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    bool? isLoadingMore,
    int? nextPage,
  }) {
    return UpcomingState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'isLoadingMore': isLoadingMore,
      'nextPage': nextPage,
    };
  }

  factory UpcomingState.fromMap(Map<String, dynamic> map) {
    return UpcomingState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      isLoadingMore: map['isLoadingMore'] as bool? ?? false,
      nextPage: map['nextPage'] as int? ?? 1,
    );
  }

//</editor-fold>
}
