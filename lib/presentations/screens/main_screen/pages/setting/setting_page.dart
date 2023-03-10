import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/setting/widgets/icon_text_icon.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/setting/widgets/info_current.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with AutomaticKeepAliveClientMixin<SettingPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: Dimens.getTopSafeAreaHeight(context) * 2,
          left: Dimens.getProportionalScreenWidth(context, 16),
          right: Dimens.getProportionalScreenWidth(context, 16),
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
    );
  }

  Widget accountWidget(BuildContext context) {
    return InfoCurrentWidget(
      title: S.current.account,
      bodyWidget: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.getProportionalScreenWidth(context, 10),
          horizontal: Dimens.getProportionalScreenWidth(context, 14),
        ),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.account_circle,
              text: S.current.profile,
              onTap: () {},
            ),
            const EmptyProportionalSpace(height: 19),
            IconTextIconWidget(
              leftIcon: Icons.lock,
              text: S.current.changePassword,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget tutoringWidget(BuildContext context) {
    return InfoCurrentWidget(
      title: S.current.tutoring,
      bodyWidget: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.getProportionalScreenWidth(context, 10),
          horizontal: Dimens.getProportionalScreenWidth(context, 14),
        ),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.school_rounded,
              text: S.current.becomeATutor,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget appWidget(BuildContext context) {
    return InfoCurrentWidget(
      title: S.current.app,
      bodyWidget: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.getProportionalScreenWidth(context, 10),
          horizontal: Dimens.getProportionalScreenWidth(context, 14),
        ),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.language_rounded,
              text: S.current.language,
              onTap: () {},
            ),
            const EmptyProportionalSpace(height: 19),
            IconTextIconWidget(
              leftIcon: Icons.lightbulb_outline_rounded,
              text: S.current.theme,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonSignOutWidget(BuildContext context) {
    return PrimaryFillButton(
      preferGradient: false,
      hasShadow: false,
      borderRadiusValue: Dimens.getScreenWidth(context) * 0.02,
      bgColor: context.theme.colorScheme.errorContainer,
      paddingVertical: Dimens.getProportionalScreenWidth(context, 8),
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
      onTap: () {},
    );
  }

  @override
  bool get wantKeepAlive => true;
}
