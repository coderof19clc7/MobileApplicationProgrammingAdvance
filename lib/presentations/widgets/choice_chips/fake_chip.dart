import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class FakeChip extends StatelessWidget {
  const FakeChip({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalScreenWidth(context, 10),
        vertical: Dimens.getProportionalScreenHeight(context, 2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.getScreenWidth(context),
        ),
        color: AppColors.primaryBlue200,
      ),
      child: Text(
        text ?? '', textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryBlue400,
          fontSize: Dimens.getProportionalScreenHeight(
            context, 12,
          ),
        ),
      ),
    );
  }
}
