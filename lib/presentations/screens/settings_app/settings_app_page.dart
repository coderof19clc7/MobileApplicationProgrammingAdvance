import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/settings_app/widgets/change_settings_app_widget.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

enum SettingsAppType { themeMode, locale }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeSettingsAppWidget(
              settingsType: settingsType,
              horizontalPadding: horizontalPadding,
            ),

            if (settingsType == SettingsAppType.themeMode)...[
              const EmptyProportionalSpace(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.getProportionalWidth(context, horizontalPadding),
                ),
                child: Text(
                  S.current.systemThemeModeNote,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.bodyMedium,
                  ).copyWith(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.getProportionalWidth(context, 16),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
