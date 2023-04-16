import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class SkillCurrentWidget extends StatelessWidget {
  final String title;
  const SkillCurrentWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return skillCurrentWidget(context, title);
  }

  Widget skillCurrentWidget(BuildContext context, String title) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const EmptyProportionalSpace(height: 15),
            Wrap(
              clipBehavior: Clip.hardEdge,
              spacing: Dimens.getProportionalWidth(context, 8),
              children: [
                buildItem(context),
                buildItem(context),
                buildItem(context),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.theme.colorScheme.primary,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalWidth(context, 19),
        vertical: Dimens.getProportionalWidth(context, 5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'UI/UX',
            textAlign: TextAlign.center,
            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
              color: context.theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
