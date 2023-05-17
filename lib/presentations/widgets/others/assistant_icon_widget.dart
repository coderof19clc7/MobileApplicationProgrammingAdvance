import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/generated/assets.gen.dart';

class AssistantIconWidget extends StatelessWidget {
  const AssistantIconWidget({super.key, this.width, this.height});

  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalWidth(context, (width ?? 0) * 0.3),
        vertical: Dimens.getProportionalWidth(context, (height ?? 0) * 0.2),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
      ),
      child: Assets.images.assistant.image(
        width: width, height: height,
      ),
    );
  }
}
