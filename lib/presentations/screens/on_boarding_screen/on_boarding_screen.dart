import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
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
          children:[
            Container(
              width: 162,
              height: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0x7f7f3a44),
              ),
            ),
            SizedBox(height: Dimens.getProportionalScreenHeight(context, 40)),
            Text(
              S.current.introducing_text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: Dimens.getProportionalScreenWidth(context, 32),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: Dimens.getProportionalScreenHeight(context, 40)),
            PrimaryFillButton(
              onTap: () {},
              width: Dimens.getScreenWidth(context) - Dimens.getProportionalScreenWidth(context, 120),
              paddingVertical: Dimens.getProportionalScreenHeight(context, 16),
              borderRadiusValue: Dimens.getScreenWidth(context),
              child: Text(
                S.current.get_started,
                style: TextStyle(
                  color: AppColors.white,
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
