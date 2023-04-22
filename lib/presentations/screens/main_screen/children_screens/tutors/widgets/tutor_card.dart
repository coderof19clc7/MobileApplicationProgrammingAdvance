import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/constants/debounces.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/simple_list_fake_chips.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/utils/extensions/string_extensions.dart';
import 'package:one_one_learn/utils/helpers/debounce_helper.dart';

class TutorCard extends BaseCard {
  const TutorCard({
    super.key,
    super.isLoading = false,
    super.firstChild,
    super.secondChildItemsDistance = 7,
    super.onTap,
    required this.nationality,
    required this.name,
    required this.description,
    this.categories = const [],
    this.rating = 0,
    this.isFavorite = false,
    this.onFavoriteIconTap,
  });

  final String nationality, name, description;
  final List<String> categories;
  final double rating;
  final bool isFavorite;
  final Function()? onFavoriteIconTap;

  @override
  Widget buildSecondChild(BuildContext context) {
    // tutor information
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name & favorite
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: isLoading
                    ? Padding(
                      padding: const EdgeInsets.only(
                        top: 3,
                      ),
                      child: buildSimpleRectangleShimmer(context),
                    )
                    : Text(
                  '$nationality $name',
                  overflow: TextOverflow.ellipsis,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.titleSmall).copyWith(
                    fontSize: Dimens.getProportionalWidth(context, 15),
                  ),
                ),
              ),
              SizedBox(width: Dimens.getProportionalWidth(context, 3)),
              isLoading
                  ? const SizedBox.shrink()
                  : InkWell(
                onTap: () {
                  DebounceHelper.runDisable(
                    '${DebounceConstants.favoriteIconTap}-$name}',
                    callback: () {onFavoriteIconTap?.call();
                    },
                  );
                },
                child: SvgPicture.string(
                  SvgIcons.getIcon(
                    SvgIconEnum.favorite,
                    strokeColor: context.theme.colorScheme.primary,
                    fillColor: isFavorite ? context.theme.colorScheme.primary : context.theme.colorScheme.surface,
                  ),
                  width: Dimens.getProportionalHeight(context, 25),
                  height: Dimens.getProportionalHeight(context, 25),
                ),
              ),
            ],
          ),
          SizedBox(
              height: Dimens.getProportionalHeight(
            context,
            secondChildItemsDistance,
          )),

          // categories
          isLoading
              ? Container(
            color: context.theme.colorScheme.secondaryContainer,
            // width: Dimens.getScreenWidth(context),
            // height: Dimens.getScreenHeight(context) * 0.01,
          )
              : buildOverViewInformation(context),
        ],
      ),
    );
  }
  
  Widget buildOverViewInformation(BuildContext context) {
    var fractionDigits = 2;
    final ratingString = rating.toStringAsFixed(2);
    final ratingFixedString = ratingString.split('.')[1];
    if (ratingFixedString.toInt() == 0) {
      fractionDigits = 0;
    } else if (ratingFixedString.toInt() % 10 == 0) {
      fractionDigits = 1;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleListFakeChips(
          listData: categories,
          itemDistance: secondChildItemsDistance,
          fontSize: 12,
          bgColor: context.theme.colorScheme.secondaryContainer,
          textColor: context.theme.colorScheme.onSecondaryContainer,
        ),
        SizedBox(
            height: Dimens.getProportionalHeight(
              context,
              secondChildItemsDistance,
            )),

        // rating
        RowIconTextInformation(
          context: context,
          icon: Icon(
            Icons.star_rounded,
            size: Dimens.getProportionalWidth(context, 14),
            color: context.theme.colorScheme.primary,
          ),
          text: Text(
            '${rating.toStringAsFixed(fractionDigits)}/5',
            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
              fontSize: Dimens.getProportionalWidth(context, 12),
            ),
          ),
        ),
        SizedBox(
            height: Dimens.getProportionalHeight(
              context,
              secondChildItemsDistance,
            )),

        // description
        Text(
          description,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          maxLines: 2,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
            color: context.theme.colorScheme.onTertiaryContainer,
            fontSize: Dimens.getProportionalWidth(context, 12),
          ),
        ),
      ],
    );
  }
}
