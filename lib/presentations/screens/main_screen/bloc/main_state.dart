part of 'main_cubit.dart';

@immutable
class MainState extends WidgetState {
  final int currentIndex;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return MainState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      currentIndex: mapJson['currentIndex'] as int? ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['currentIndex'] = currentIndex;
    return map;
  }

  @override
  List<Object?> get props => [
    ...super.props,
    currentIndex,
  ];

//<editor-fold desc="Data Methods">
  const MainState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.currentIndex = 0,
  });

  @override
  String toString() {
    return 'MainState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' currentIndex: $currentIndex,'
        ' }';
  }

  MainState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? currentIndex,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'currentIndex': currentIndex,
    };
  }

  factory MainState.fromMap(Map<String, dynamic> map) {
    return MainState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      currentIndex: map['currentIndex'] as int? ?? 0,
    );
  }

//</editor-fold>
}
