import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class TopBannerTutorsUpcoming extends StatelessWidget {
  const TopBannerTutorsUpcoming({
    super.key,
    this.isLoading = false,
    this.showLabel = true,
    this.showButton = true,
    required this.topLabel,
    required this.contentWidget,
    required this.buttonLabel,
    required this.buttonIcon,
    this.onTap,
    this.width,
  });

  final bool isLoading, showLabel, showButton;
  final String topLabel, buttonLabel;
  final double? width;
  final Widget contentWidget, buttonIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      padding: EdgeInsets.only(
        top: Dimens.getTopSafeAreaHeight(context)
            + Dimens.getProportionalHeight(context, 28),
        bottom: Dimens.getProportionalHeight(context, 28),
      ),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // top label
          showLabel
              ? Text(
              topLabel, style: Dimens.getProportionalFont(
            context, context.theme.textTheme.bodyMedium,
          ).copyWith(
            color: AppColors.white,
            fontSize: Dimens.getProportionalWidth(context, 17),
          ))
              : const SizedBox.shrink(),
          EmptyProportionalSpace(height: isLoading ? 43 : 15),

          // content (center) widget
          if (isLoading) CircularProgressIndicator(
            color: context.theme.colorScheme.onPrimary,
          )
          else contentWidget,
          const EmptyProportionalSpace(height: 15),

          // button
          if (showButton)
            PrimaryFillButton(
              width: Dimens.getProportionalWidth(context, 160),
              bgColor: AppColors.primaryBlue200,
              preferGradient: false,
              boxShadow: [Effects.normalShadowSM],
              borderRadiusValue: Dimens.getScreenWidth(context),
              onTap: onTap,
              paddingVertical: Dimens.getProportionalWidth(context, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonIcon,
                  SizedBox(width: Dimens.getProportionalWidth(context, 5)),
                  Text(
                    buttonLabel,
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                      color: AppColors.primaryBlue500,
                      fontSize: Dimens.getProportionalWidth(context, 14),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
