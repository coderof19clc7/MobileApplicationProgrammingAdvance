part of 'app_settings_cubit.dart';

@immutable
class AppSettingsState extends WidgetState {
  const AppSettingsState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.themeMode = ThemeMode.system,
    this.locale,
  });

  final ThemeMode themeMode;
  final Locale? locale;

  @override
  List<Object?> get props => [...super.props, themeMode, locale];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;

    final localeString = mapJson['locale'] as String? ?? '';
    final localeSplits = localeString.split('_');
    Locale? locale;
    if (localeSplits.length == 2) {
      locale = Locale(localeSplits[0], localeSplits[1]);
    }

    return AppSettingsState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] as BasicStatusFToastState?,
      themeMode: ThemeMode.values[mapJson['themeMode'] as int? ?? 0],
      locale: locale,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState;
    map['themeMode'] = themeMode.index;
    if (locale != null) {
      map['locale'] = '${locale?.languageCode ?? 'en'}_${locale?.countryCode ?? ''}';
    }
    return map;
  }

  AppSettingsState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return AppSettingsState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  String toString() {
    return 'AppSettingsState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' themeMode: ${themeMode.name},'
        ' locale: $locale,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState,
      'themeMode': themeMode.index,
      'locale': locale != null
          ? '${locale?.languageCode ?? 'en'}_${locale?.countryCode ?? ''}'
          : null,
    };
  }

  factory AppSettingsState.fromMap(Map<String, dynamic> map) {
    final localeString = map['locale'] as String? ?? '';
    final localeSplits = localeString.split('_');
    Locale? locale;
    if (localeSplits.length == 2) {
      locale = Locale(localeSplits[0], localeSplits[1]);
    }

    return AppSettingsState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] as BasicStatusFToastState?,
      themeMode: ThemeMode.values[map['themeMode'] as int? ?? 0],
      locale: locale,
    );
  }
}
