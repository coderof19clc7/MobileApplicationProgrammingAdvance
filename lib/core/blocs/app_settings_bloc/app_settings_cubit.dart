import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends WidgetCubit<AppSettingsState> {
  AppSettingsCubit() : super(widgetState: const AppSettingsState()) {
    loadThemeModeAndLocaleInStorage();
  }

  @override
  void onWidgetCreated() {}

  Future<void> changeThemeMode(int newThemeModeIndex) async {
    await localManager.setInt(LocalConstants.appThemeModeIndex, newThemeModeIndex);
    emitNewState(state.copyWith(themeMode: ThemeMode.values[newThemeModeIndex]));
  }

  Future<void> changeLocale(String newLanguageCode, String? newCountryCode) async {
    await localManager.setString(
      LocalConstants.appLocale,
      '${newLanguageCode}_${newCountryCode ?? ''}',
    );
    emitNewState(state.copyWith(locale: Locale(newLanguageCode, newCountryCode)));
  }

  void loadThemeModeAndLocaleInStorage() {
    // get theme mode
    final themeModeIndex = localManager.getInt(LocalConstants.appThemeModeIndex);
    ThemeMode? themeMode;
    if (themeModeIndex != null) {
      themeMode = ThemeMode.values[themeModeIndex];
    }

    // get locale
    final localeString = localManager.getString(LocalConstants.appLocale);
    final localeSplits = localeString?.split('_') ?? [];
    Locale? locale;
    if (localeSplits.length == 2) {
      locale = Locale(localeSplits[0], localeSplits[1]);
    }
    emitNewState(state.copyWith(themeMode: themeMode, locale: locale));
  }

  @override
  Future<void> close() async {
    localManager
      ..setInt(LocalConstants.appThemeModeIndex, state.themeMode.index)
      ..setString(
        LocalConstants.appLocale,
        '${state.locale?.languageCode ?? ''}_${state.locale?.countryCode ?? ''}',
      );
    super.close();
  }
}
