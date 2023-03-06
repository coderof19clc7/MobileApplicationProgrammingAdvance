import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';

class CourseCard extends BaseCard {
  const CourseCard({
    super.key,
    super.firstChild, super.direction = CardDirection.column, super.padding,
    super.firstSecondDistance = 12,
    required this.name, required this.description,
    required this.level, this.categories = const [], this.lessons = 0,
  });

  final String name, description, level;
  final List<String> categories;
  final int lessons;

  @override
  Widget buildSecondChild(BuildContext context) {
    const fontSize = 14.0;
    return Padding(
      padding: EdgeInsets.only(
        left: Dimens.getProportionalScreenWidth(context, 14),
        right: Dimens.getProportionalScreenWidth(context, 14),
        bottom: Dimens.getProportionalScreenWidth(context, 14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name
          Text(
            name, overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.black, fontWeight: FontWeight.w700,
              fontSize: Dimens.getProportionalScreenWidth(context, 17),
            ),
          ),
          SizedBox(
            height: Dimens.getProportionalScreenHeight(
              context, secondChildItemsDistance,
            ),
          ),

          // categories
          buildCategoriesField(context, secondChildItemsDistance),
          SizedBox(
            height: Dimens.getProportionalScreenHeight(
              context, secondChildItemsDistance,
            ),
          ),

          // level & lessons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.signal_cellular_alt_rounded,
                size: Dimens.getProportionalScreenWidth(context, fontSize + 6),
                color: AppColors.primaryBlue400,
              ),
              SizedBox(width: Dimens.getProportionalScreenWidth(
                context, 3,
              )),
              Text(
                level, style: TextStyle(
                color: AppColors.neutralBlue500,
                fontSize: Dimens.getProportionalScreenWidth(context, fontSize),
              ),),
              SizedBox(width: Dimens.getProportionalScreenWidth(
                context, 7,
              )),
              Text(
                '|', style: TextStyle(
                color: AppColors.neutralBlue500,
                fontSize: Dimens.getProportionalScreenWidth(context, fontSize),
              ),),
              SizedBox(width: Dimens.getProportionalScreenWidth(
                context, 7,
              )),
              Icon(
                Icons.book_rounded,
                size: Dimens.getProportionalScreenWidth(context, fontSize + 6),
                color: AppColors.primaryBlue400,
              ),
              Text(
                '$lessons ${S.current.lesson}', style: TextStyle(
                color: AppColors.neutralBlue500,
                fontSize: Dimens.getProportionalScreenWidth(context, fontSize),
              ),),
            ],
          ),
          SizedBox(
            height: Dimens.getProportionalScreenHeight(
              context, secondChildItemsDistance,
            ),
          ),

          // description
          Text(
            description, overflow: TextOverflow.ellipsis,
            softWrap: true, maxLines: 2,
            style: TextStyle(
              color: AppColors.neutralBlue500,
              fontSize: Dimens.getProportionalScreenWidth(context, fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoriesField(
      BuildContext context, double itemDistance
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
                  context, index == categories.length - 1 ? 0 : itemDistance,
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
