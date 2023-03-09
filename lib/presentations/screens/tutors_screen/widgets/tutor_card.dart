import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/simple_list_fake_chips.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';

class TutorCard extends BaseCard {
  const TutorCard({
    super.key,
    super.firstChild,
    super.secondChildItemsDistance = 7,
    super.onTap,
    required this.nationality,
    required this.name,
    required this.description,
    this.categories = const [],
    this.rating = 0,
    this.isFavorite = false,
  });

  final String nationality, name, description;
  final List<String> categories;
  final double rating;
  final bool isFavorite;

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
                child: Text(
                  '$nationality $name',
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.titleSmall!.copyWith(
                    fontSize: Dimens.getProportionalScreenWidth(context, 15),
                  ),
                ),
              ),
              SizedBox(
                  width: Dimens.getProportionalScreenWidth(
                context,
                3,
              )),
              InkWell(
                onTap: () {},
                child: SvgPicture.string(
                  SvgIcons.getIcon(
                    SvgIconEnum.favorite,
                    strokeColor: context.theme.colorScheme.primary,
                    fillColor: isFavorite ? context.theme.colorScheme.primary : context.theme.colorScheme.surface,
                  ),
                  width: Dimens.getProportionalScreenHeight(context, 25),
                  height: Dimens.getProportionalScreenHeight(context, 25),
                ),
              ),
            ],
          ),
          SizedBox(
              height: Dimens.getProportionalScreenHeight(
            context,
            secondChildItemsDistance,
          )),

          // categories
          SimpleListFakeChips(
            listData: categories,
            itemDistance: secondChildItemsDistance,
            fontSize: 12,
            bgColor: context.theme.colorScheme.secondaryContainer,
            textColor: context.theme.colorScheme.onSecondaryContainer,
          ),
          SizedBox(
              height: Dimens.getProportionalScreenHeight(
            context,
            secondChildItemsDistance,
          )),

          // rating
          RowIconTextInformation(
            context: context,
            icon: Icon(
              Icons.star_rounded,
              size: Dimens.getProportionalScreenWidth(context, 14),
              color: context.theme.colorScheme.primary,
            ),
            text: Text(
              '$rating/5',
              style: context.theme.textTheme.bodySmall!.copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 12),
              ),
            ),
          ),
          SizedBox(
              height: Dimens.getProportionalScreenHeight(
            context,
            secondChildItemsDistance,
          )),

          // description
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
            style: context.theme.textTheme.bodySmall!.copyWith(
              color: context.theme.colorScheme.onTertiaryContainer,
              fontSize: Dimens.getProportionalScreenWidth(context, 12),
            ),
          ),
        ],
      ),
    );
  }
}
