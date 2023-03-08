import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class TopicContainer extends StatelessWidget {
  const TopicContainer({
    super.key,
    required this.index,
    required this.title,
    required this.onTap,
  });

  final int index;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surfaceTint,
          borderRadius: BorderRadius.circular(
            Dimens.getProportionalScreenWidth(context, 10),
          ),
          border: Border.all(color: context.theme.colorScheme.outline),
        ),
        margin: EdgeInsets.only(
          bottom: Dimens.getProportionalScreenHeight(context, 10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.getProportionalScreenWidth(context, 14),
          vertical: Dimens.getProportionalScreenHeight(context, 9),
        ),
        child: Wrap(
          spacing: Dimens.getProportionalScreenWidth(context, 14),
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: context.theme.colorScheme.tertiary,
              child: Text(
                index.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              title,
              style: context.theme.textTheme.titleMedium!.copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 14),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
