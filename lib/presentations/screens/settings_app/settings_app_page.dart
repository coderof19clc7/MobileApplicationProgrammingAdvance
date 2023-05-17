import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/settings_app/widgets/assistant_settings_widget.dart';
import 'package:one_one_learn/presentations/screens/settings_app/widgets/change_app_theme_or_language_widget.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';

enum SettingsAppType { themeMode, locale, assistant }

class SettingsAppPage extends StatelessWidget {
  const SettingsAppPage({super.key, required this.settingsType});

  final SettingsAppType settingsType;

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 15.0;
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          left: Dimens.getProportionalWidth(context, horizontalPadding),
          right: Dimens.getProportionalWidth(context, horizontalPadding),
          top: Dimens.getProportionalHeight(context, 20),
        ),
        child: buildChild(horizontalPadding),
      ),
    );
  }

  Widget buildChild(double horizontalPadding) {
    if (settingsType == SettingsAppType.themeMode
        || settingsType == SettingsAppType.locale) {
      return ChangeAppThemeOrLanguageWidget(
        settingsType: settingsType,
        horizontalPadding: horizontalPadding,
      );
    }

    return AssistantSettingsWidget(
      settingsType: settingsType,
      horizontalPadding: horizontalPadding,
    );
  }
}
