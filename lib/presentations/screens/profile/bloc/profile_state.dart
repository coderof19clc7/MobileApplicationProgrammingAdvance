part of 'profile_cubit.dart';

@immutable
class ProfileState extends WidgetState {
  const ProfileState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.isInitial = false,
    this.isEdit = false,
    this.userInfo,
    this.selectedLearnTopics = const [],
    this.selectedTestPreparations = const [],
    this.errorsMap = const {},
    this.avatarPath = '',
  });

  final bool isInitial, isEdit;
  final UserInfo? userInfo;
  final List<String> selectedLearnTopics;
  final List<String> selectedTestPreparations;
  final Map<String, String> errorsMap;
  final String avatarPath;

  @override
  List<Object?> get props => [
    ...super.props,
    isInitial,
    isEdit,
    userInfo,
    selectedLearnTopics,
    selectedTestPreparations,
    errorsMap,
    avatarPath,
  ];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return ProfileState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      isInitial: mapJson['isInitial'] as bool? ?? false,
      isEdit: mapJson['isEdit'] as bool? ?? false,
      userInfo: mapJson['userInfo'] != null
          ? UserInfo.fromJson(mapJson['userInfo'])
          : null,
      selectedLearnTopics: mapJson['selectedWantToSturdy'] != null
          ? (mapJson['selectedWantToSturdy'] as List).map((e) => e.toString()).toList()
          : const [],
      selectedTestPreparations: mapJson['selectedTestPreparations'] != null
          ? (mapJson['selectedTestPreparations'] as List).map((e) => e.toString()).toList()
          : const [],
      errorsMap: mapJson['errorsMap'] != null
          ? (mapJson['errorsMap'] as Map).map((key, value) => MapEntry(key.toString(), value.toString()))
          : const {},
      avatarPath: mapJson['avatarPath'] as String? ?? '',
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
    map['isInitial'] = isInitial;
    map['isEdit'] = isEdit;
    if (userInfo != null) {
      map['userInfo'] = userInfo?.toJson();
    }
    map['selectedWantToSturdy'] = selectedLearnTopics;
    map['selectedTestPreparations'] = selectedTestPreparations;
    map['errorsMap'] = errorsMap;
    map['avatarPath'] = avatarPath;
    return map;
  }

  ProfileState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    bool? isInitial,
    bool? isEdit,
    UserInfo? userInfo,
    List<String>? selectedLearnTopics,
    List<String>? selectedTestPreparations,
    Map<String, String>? errorsMap,
    String? avatarPath,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      isInitial: isInitial ?? this.isInitial,
      isEdit: isEdit ?? this.isEdit,
      userInfo: userInfo ?? this.userInfo,
      selectedLearnTopics: selectedLearnTopics ?? this.selectedLearnTopics,
      selectedTestPreparations: selectedTestPreparations ?? this.selectedTestPreparations,
      errorsMap: errorsMap ?? this.errorsMap,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ProfileState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          needNavigateToLogin == other.needNavigateToLogin &&
          basicStatusFToastState == other.basicStatusFToastState &&
          isInitial == other.isInitial &&
          isEdit == other.isEdit &&
          userInfo == other.userInfo &&
          listEquals(selectedLearnTopics, other.selectedLearnTopics) &&
          listEquals(selectedTestPreparations, other.selectedTestPreparations) &&
          mapEquals(errorsMap, other.errorsMap) &&
          avatarPath == other.avatarPath;

  @override
  int get hashCode =>
      super.hashCode ^
      isLoading.hashCode ^
      needNavigateToLogin.hashCode ^
      basicStatusFToastState.hashCode ^
      isInitial.hashCode ^
      isEdit.hashCode ^
      userInfo.hashCode ^
      selectedLearnTopics.hashCode ^
      selectedTestPreparations.hashCode ^
      errorsMap.hashCode ^
      avatarPath.hashCode;

  @override
  String toString() {
    return 'ProfileState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' isInitial: $isInitial,'
        ' isEdit: $isEdit,'
        ' userInfo: $userInfo,'
        ' selectedWantToSturdy: $selectedLearnTopics,'
        ' selectedTestPreparations: $selectedTestPreparations,'
        ' errorsMap: $errorsMap,'
        ' avatarPath: $avatarPath,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'isInitial': isInitial,
      'isEdit': isEdit,
      'userInfo': userInfo?.toMap(),
      'selectedWantToSturdy': selectedLearnTopics,
      'selectedTestPreparations': selectedTestPreparations,
      'errorsMap': errorsMap,
      'avatarPath': avatarPath,
    };
  }

  factory ProfileState.fromMap(Map<String, dynamic> map) {
    return ProfileState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      isInitial: map['isInitial'] as bool? ?? false,
      isEdit: map['isEdit'] as bool? ?? false,
      userInfo: map['userInfo'] != null
          ? UserInfo.fromMap(map['userInfo'] as Map<String, dynamic>)
          : null,
      selectedLearnTopics: map['selectedWantToSturdy'] != null
          ? (map['selectedWantToSturdy'] as List).map((e) => e.toString()).toList()
          : const [],
      selectedTestPreparations: map['selectedTestPreparations'] != null
          ? (map['selectedTestPreparations'] as List).map((e) => e.toString()).toList()
          : const [],
      errorsMap: map['errorsMap'] != null
          ? (map['errorsMap'] as Map).map((key, value) => MapEntry(key.toString(), value.toString()))
          : const {},
      avatarPath: map['avatarPath'] as String? ?? '',
    );
  }
}
