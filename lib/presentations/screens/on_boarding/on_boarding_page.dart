import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_one_learn/presentations/screens/login/login_screen.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/assets.gen.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.logo.path,
              width: Dimens.getScreenWidth(context) / 2,
              height: Dimens.getScreenWidth(context) / 2,
            ),
            SizedBox(height: Dimens.getProportionalHeight(context, 40)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getProportionalWidth(context, 16),
              ),
              child: Text(
                S.current.introducingText,
                textAlign: TextAlign.center,
                style: Dimens.getProportionalFont(context, context.theme.textTheme.displayLarge).copyWith(
                  fontSize: Dimens.getProportionalWidth(context, 32),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: Dimens.getProportionalHeight(context, 40)),
            PrimaryFillButton(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  RouteNames.login, arguments: const LoginArguments(),
                );
              },
              width: Dimens.getScreenWidth(context) - Dimens.getProportionalWidth(context, 100),
              paddingVertical: Dimens.getProportionalHeight(context, 16),
              borderRadiusValue: Dimens.getScreenWidth(context),
              child: Text(
                S.current.getStarted,
                style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
                  fontSize: Dimens.getProportionalWidth(context, 16),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
