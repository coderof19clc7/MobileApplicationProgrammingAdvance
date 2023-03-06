import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';

class TutorCard extends BaseCard {
  const TutorCard({
    super.key, super.firstChild, super.secondChildItemsDistance = 7,
    required this.nationality, required this.name, required this.description,
    this.categories = const [], this.rating = 0, this.isFavorite = false,
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
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '$nationality $name', overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.w700,
                    fontSize: Dimens.getProportionalScreenWidth(context, 15),
                  ),
                ),
              ),
              SizedBox(width: Dimens.getProportionalScreenWidth(
                context, 3,
              )),
              InkWell(
                onTap: () {},
                child: SvgPicture.string(
                  SvgIcons.getIcon(
                    SvgIconEnum.favorite,
                    fillColor: isFavorite
                        ? AppColors.primaryBlue400 : AppColors.white,
                  ),
                  width: Dimens.getProportionalScreenHeight(context, 25),
                  height: Dimens.getProportionalScreenHeight(context, 25),
                ),
              ),
            ],
          ),
          SizedBox(height: Dimens.getProportionalScreenHeight(
            context, secondChildItemsDistance,
          )),

          // categories
          buildCategoriesField(context, secondChildItemsDistance),
          SizedBox(height: Dimens.getProportionalScreenHeight(
            context, secondChildItemsDistance,
          )),

          // rating
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                size: Dimens.getProportionalScreenWidth(context, 14),
                color: AppColors.primaryBlue400,
              ),
              SizedBox(width: Dimens.getProportionalScreenWidth(context, 4)),
              Text(
                '$rating/5', style: TextStyle(
                color: AppColors.neutralBlue500,
                fontSize: Dimens.getProportionalScreenWidth(context, 12),
              ),
              ),
            ],
          ),
          SizedBox(height: Dimens.getProportionalScreenHeight(
            context, secondChildItemsDistance,
          )),

          // description
          Text(
            description, overflow: TextOverflow.ellipsis,
            softWrap: true, maxLines: 2,
            style: TextStyle(
              color: AppColors.neutralBlue500,
              fontSize: Dimens.getProportionalScreenWidth(context, 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoriesField(
    BuildContext context, double secondChildItemsDistance
  ) {
    return SizedBox(
      height: Dimens.getScreenHeight(context,) * 0.037,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return true;
        },
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            // category
            return Container(
              margin: EdgeInsets.only(
                right: Dimens.getProportionalScreenWidth(
                  context, index == categories.length - 1
                    ? 0 : secondChildItemsDistance,
                ),
              ),
              child: FakeChip(text: categories[index]),
            );
          },
        ),
      ),
    );
  }
}
