import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/simple_list_fake_chips.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';

class CourseCard extends BaseCard {
  const CourseCard({
    super.key,
    super.isLoading = false,
    super.firstChild,
    super.direction = CardDirection.column,
    super.padding,
    super.margin,
    super.firstSecondDistance = 12,
    super.onTap,
    required this.name,
    required this.description,
    required this.level,
    this.categories = const [],
    this.lessons = 0,
  });

  final String name, description, level;
  final List<String> categories;
  final int lessons;

  @override
  Widget buildSecondChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.getProportionalWidth(context, 14),
        right: Dimens.getProportionalWidth(context, 14),
        bottom: Dimens.getProportionalWidth(context, 14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name
          isLoading
              ? Padding(
            padding: const EdgeInsets.only(top: 3),
            child: buildSimpleRectangleShimmer(context),
          )
              : Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: Dimens.getProportionalFont(context, context.theme.textTheme.titleSmall).copyWith(
              fontSize: Dimens.getProportionalWidth(context, 17),
            ),
          ),
          EmptyProportionalSpace(height: secondChildItemsDistance),

          if (!isLoading)
            buildOverviewInformationField(context),
        ],
      ),
    );
  }

  Widget buildOverviewInformationField(BuildContext context) {
    const fontSize = 14.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleListFakeChips(
          listData: categories,
          itemDistance: secondChildItemsDistance,
          bgColor: context.theme.colorScheme.secondaryContainer,
          textColor: context.theme.colorScheme.onSecondaryContainer,
        ),
        EmptyProportionalSpace(height: secondChildItemsDistance),

        // level & lessons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RowIconTextInformation(
              context: context,
              icon: Icon(
                Icons.signal_cellular_alt_rounded,
                size: Dimens.getProportionalWidth(context, fontSize + 6),
                color: context.theme.colorScheme.primary,
              ),
              betweenSpace: 3,
              text: Text(
                level,
                style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                  fontSize: Dimens.getProportionalWidth(context, fontSize),
                ),
              ),
            ),
            const EmptyProportionalSpace(width: 7),
            Text(
              '|',
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalWidth(context, fontSize),
              ),
            ),
            const EmptyProportionalSpace(width: 7),
            RowIconTextInformation(
              context: context,
              icon: Icon(
                Icons.book_rounded,
                size: Dimens.getProportionalWidth(context, fontSize + 3),
                color: context.theme.colorScheme.primary,
              ),
              betweenSpace: 2,
              text: Text(
                '$lessons ${S.current.lesson}',
                style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                  fontSize: Dimens.getProportionalWidth(context, fontSize),
                ),
              ),
            ),
          ],
        ),
        EmptyProportionalSpace(height: secondChildItemsDistance),

        // description
        Text(
          description,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 2,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
            fontSize: Dimens.getProportionalWidth(context, fontSize),
          ),
        ),
      ],
    );
  }
}
