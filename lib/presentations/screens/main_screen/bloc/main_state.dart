part of 'main_cubit.dart';

@immutable
class MainState extends WidgetState {
  final int currentIndex;
  final UserInfo? userInfo;

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
      userInfo: mapJson['userInfo'] != null
          ? UserInfo.fromJson(mapJson['userInfo'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['currentIndex'] = currentIndex;
    map['userInfo'] = userInfo?.toJson();
    return map;
  }

  @override
  List<Object?> get props => [
    ...super.props,
    currentIndex,
    userInfo,
  ];

//<editor-fold desc="Data Methods">
  const MainState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.currentIndex = 0,
    this.userInfo,
  });

  @override
  String toString() {
    return 'MainState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' currentIndex: $currentIndex,'
        ' userInfo: $userInfo,'
        ' }';
  }

  MainState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? currentIndex,
    UserInfo? userInfo,
  }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      currentIndex: currentIndex ?? this.currentIndex,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'currentIndex': currentIndex,
      'userInfo': userInfo?.toMap(),
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
      userInfo: map['userInfo'] != null
          ? UserInfo.fromMap(map['userInfo'] as Map<String, dynamic>)
          : null,
    );
  }

//</editor-fold>
}
