import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/setting_page.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 162,
              height: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.theme.colorScheme.primary,
              ),
            ),
            SizedBox(height: Dimens.getProportionalScreenHeight(context, 40)),
            Text(
              S.current.introducingText,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.displayLarge!.copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 32),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Dimens.getProportionalScreenHeight(context, 40)),
            PrimaryFillButton(
              onTap: () {},
              width: Dimens.getScreenWidth(context) - Dimens.getProportionalScreenWidth(context, 100),
              paddingVertical: Dimens.getProportionalScreenHeight(context, 16),
              borderRadiusValue: Dimens.getScreenWidth(context),
              child: Text(
                S.current.getStarted,
                style: context.theme.textTheme.displaySmall!.copyWith(
                  fontSize: Dimens.getProportionalScreenWidth(context, 16),
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
