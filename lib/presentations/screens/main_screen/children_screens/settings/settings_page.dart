import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/bloc/main_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/settings/widgets/icon_text_icon.dart';
import 'package:one_one_learn/presentations/screens/settings_app/settings_app_page.dart';
import 'package:one_one_learn/presentations/screens/settings_app/settings_app_page.dart';
import 'package:one_one_learn/presentations/screens/settings_app/settings_app_screen.dart';
import 'package:one_one_learn/presentations/screens/settings_app/settings_app_screen.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/settings/widgets/info_current.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: Dimens.getTopSafeAreaHeight(context) * 2,
            left: Dimens.getProportionalWidth(context, 16),
            right: Dimens.getProportionalWidth(context, 16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              accountWidget(context),
              const EmptyProportionalSpace(height: 25),
              tutoringWidget(context),
              const EmptyProportionalSpace(height: 25),
              appWidget(context),
              const EmptyProportionalSpace(height: 30),
              buttonSignOutWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountWidget(BuildContext context) {
    return InfoCurrentWidget(
      title: S.current.account,
      bodyWidget: Column(
        children: [
          IconTextIconWidget(
            leftIcon: Icons.account_circle,
            text: S.current.profile,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.profile);
            },
          ),
          IconTextIconWidget(
            leftIcon: Icons.lock,
            text: S.current.changePassword,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget tutoringWidget(BuildContext context) {
    return InfoCurrentWidget(
      title: S.current.tutoring,
      bodyWidget: Column(
        children: [
          IconTextIconWidget(
            leftIcon: Icons.school_rounded,
            text: S.current.becomeATutor,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget appWidget(BuildContext context) {
    return InfoCurrentWidget(
      title: S.current.app,
      bodyWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconTextIconWidget(
            leftIcon: Icons.language_rounded,
            text: S.current.language,
            onTap: () {
              Navigator.pushNamed(
                context,
                  RouteNames.settingsApp,
                  arguments: const SettingsAppArgs(
                    settingsType: SettingsAppType.locale,
                  ),
              );
            },
          ),
          IconTextIconWidget(
            leftIcon: Icons.lightbulb_outline_rounded,
            text: S.current.theme,
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.settingsApp,
                arguments: const SettingsAppArgs(
                  settingsType: SettingsAppType.themeMode,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buttonSignOutWidget(BuildContext context) {
    return PrimaryFillButton(
      preferGradient: false,
      hasShadow: false,
      borderRadiusValue: Dimens.getScreenWidth(context) * 0.02,
      bgColor: context.theme.colorScheme.errorContainer,
      paddingVertical: Dimens.getProportionalWidth(context, 8),
      splashColor: AppColors.red700.withOpacity(0.4),
      width: Dimens.getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.login, color: context.theme.colorScheme.onErrorContainer),
          const EmptyProportionalSpace(width: 7),
          Text(
            S.current.signOut,
            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyLarge).copyWith(
              color: context.theme.colorScheme.onErrorContainer,
            ),
          ),
        ],
      ),
      onTap: () {
        MainCubit.getInstance().logout();
      },
    );
  }
}
