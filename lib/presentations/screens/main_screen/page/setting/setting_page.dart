import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/setting/widgets/icon_text_icon.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/setting/widgets/info_current.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            accountWidget(),
            const EmptyProportionalSpace(height: 25),
            tutoringWidget(),
            const EmptyProportionalSpace(height: 25),
            appWidget(),
            const EmptyProportionalSpace(height: 30),
            buttonSignOutWidget(context),
          ],
        ),
      ),
    );
  }

  Widget accountWidget() {
    return InfoCurrentWidget(
      title: 'Account',
      bodyWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.account_circle,
              text: 'Profile',
              onTap: () {},
            ),
            const SizedBox(height: 10),
             IconTextIconWidget(
              leftIcon: Icons.lock,
              text: 'Change password',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget tutoringWidget() {
    return InfoCurrentWidget(
      title: 'Account',
      bodyWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.school_rounded,
              text: 'Profile',
              onTap: () {},
            ),

          ],
        ),
      ),
    );
  }

  Widget appWidget() {
    return InfoCurrentWidget(
      title: 'Account',
      bodyWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.language_rounded,
              text: 'Profile',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            IconTextIconWidget(
              leftIcon: Icons.lightbulb_outline_rounded,
              text: 'Change password',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

 Widget  buttonSignOutWidget(BuildContext context) {
    return PrimaryFillButton(
      preferGradient: false,
      hasShadow: false,
      bgColor: AppColors.neutralRed200,
      paddingVertical: 8,
      width: Dimens.getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.login, color: AppColors.red400),
          const EmptyProportionalSpace(width: 8),
          Text('Sign out',style: Dimens.getProportionalFont(
            context, context.theme.textTheme.bodyLarge,
          ).copyWith(color: AppColors.red400)),
        ],
      ),
      onTap: () {},
    );
  }
}
