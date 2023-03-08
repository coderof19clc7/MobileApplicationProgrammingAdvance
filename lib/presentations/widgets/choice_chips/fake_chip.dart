import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class FakeChip extends StatelessWidget {
  const FakeChip({
    super.key,
    this.text,
    this.bgColor,
    this.textColor,
    this.fontSize = 14,
  });

  final String? text;
  final double fontSize;
  final Color? bgColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalScreenWidth(context, 10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.getScreenWidth(context),
        ),
        color: bgColor ?? AppColors.primaryBlue200,
      ),
      child: Text(
        text ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor ?? AppColors.primaryBlue400,
          fontSize: Dimens.getProportionalScreenWidth(
            context,
            fontSize,
          ),
        ),
      ),
    );
  }
}
