import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class InfoCurrentWidget extends StatelessWidget {
  const InfoCurrentWidget({super.key, this.title, this.bodyWidget});

  final String? title;
  final Widget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: Dimens.getProportionalFont(
            context,
            context.theme.textTheme.titleMedium,
          ),
        ),
        const EmptyProportionalSpace(height: 15),
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(Dimens.getScreenWidth(context) * 0.02),
          ),
          child: bodyWidget ?? const SizedBox.shrink(),
        )
      ],
    );
  }
}
