import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/linear_shimmer.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class TutorReviewCard extends BaseCard {
  const TutorReviewCard({
    super.key,
    super.isLoading = false,
    super.firstChildAspectRatio = 100000000000000,
    super.firstChild,
    super.direction = CardDirection.column,
    super.padding,
    super.margin,
    super.firstSecondDistance = 0,
    super.decoration,
    super.onTap,
    required this.name,
    required this.avatar,
    required this.content,
    required this.updateAt,
    this.categories = const [],
    this.rating = 0,
  });

  final String name, avatar, content, updateAt;
  final List<String> categories;
  final double rating;

  String convertToReadableDateString(BuildContext context, String date) {
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(date);
    } catch (e) {
      dateTime = DateTime(0);
    }
    final formatter = DateFormat.yMMMMEEEEd(Localizations.localeOf(context).languageCode).add_jm();
    return formatter.format(dateTime.toLocal());
  }

  @override
  Widget buildSecondChild(BuildContext context) {
    final imageSize = Dimens.getScreenWidth(context) * 0.1538461;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // avatar
        ClipRRect(
          borderRadius: BorderRadius.circular(imageSize),
          child: SizedBox(
            width: imageSize, height: imageSize,
            child: isLoading
                ? LinearShimmer(radius: imageSize)
                : SimpleNetworkImage(url: avatar),
          ),
        ),
        EmptyProportionalSpace(width: secondChildItemsDistance),

        // the rest
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name, date and rating
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLoading
                      ? Padding(
                    padding: EdgeInsets.only(
                      top: Dimens.getProportionalHeight(context, 7),
                    ),
                    child: buildSimpleRectangleShimmer(context, isLinear: true),
                  )
                      : Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Dimens.getProportionalFont
                            (context, context.theme.textTheme.bodyMedium,
                          ).copyWith(
                            fontSize: Dimens.getProportionalWidth(context, 16),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        EmptyProportionalSpace(height: secondChildItemsDistance - 2),
                        // datetime
                        Text(
                          convertToReadableDateString(context, updateAt),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Dimens.getProportionalFont(
                            context, context.theme.textTheme.bodySmall,
                          ).copyWith(
                            fontSize: Dimens.getProportionalWidth(context, 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const EmptyProportionalSpace(width: 3.5),
                  if (!isLoading)
                    // rating
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: context.theme.colorScheme.onSurfaceVariant,
                          size: Dimens.getProportionalWidth(context, 17),
                        ),
                        const EmptyProportionalSpace(width: 4),
                        Text(
                          '${UIHelper.doubleToStringAsFixed(rating, fixedNumber: 1)}/5',
                          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                            color: context.theme.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimens.getProportionalWidth(context, 15),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              EmptyProportionalSpace(height: secondChildItemsDistance + 2),

              if (!isLoading) ...[
                // content
                Text(
                  content,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                    fontSize: Dimens.getProportionalWidth(context, 14),
                  ),
                ),
              ],
              EmptyProportionalSpace(height: secondChildItemsDistance),
            ],
          ),
        ),
      ],
    );
  }
}
