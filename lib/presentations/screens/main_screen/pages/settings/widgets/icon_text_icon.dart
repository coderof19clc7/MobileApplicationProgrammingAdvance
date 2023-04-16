import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class IconTextIconWidget extends StatelessWidget {
  final IconData leftIcon;
  final String text;
  final Function() onTap;

  const IconTextIconWidget({
    super.key,
    required this.leftIcon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(leftIcon),
         const EmptyProportionalSpace(width: 10),
          Expanded(
            child: Text(
              text,
              style: Dimens.getProportionalFont(
                context, context.theme.textTheme.bodyLarge,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: Dimens.getProportionalWidth(context, 20),
          ),
        ],
      ),
    );
  }
}
