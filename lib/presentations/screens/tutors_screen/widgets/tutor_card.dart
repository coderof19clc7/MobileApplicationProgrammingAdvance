import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class TutorCard extends StatelessWidget {
  const TutorCard({
    super.key, required this.name, required this.description,
    this.categories = const [], this.rating = 0, this.isFavorite = false,
  });

  final String name, description;
  final List<String> categories;
  final double rating;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    const itemDistance = 10.0;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalScreenWidth(context, 14),
        vertical: Dimens.getProportionalScreenHeight(context, 14),
      ),
      margin: EdgeInsets.only(
        bottom: Dimens.getProportionalScreenHeight(context, 15),
      ),
      width: Dimens.getScreenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [Effects.normalShadow,],
        color: AppColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            width: Dimens.getProportionalScreenWidth(context, 90),
            height: Dimens.getProportionalScreenWidth(context, 90),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.neutralBlue500,
            ),
          ),
          SizedBox(width: Dimens.getProportionalScreenWidth(
            context, itemDistance,
          ),),

          // tutor information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name & favorite
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.w700,
                      fontSize: Dimens.getProportionalScreenHeight(context, 15),
                    ),),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: AppColors.primaryBlue400,
                        size: Dimens.getProportionalScreenHeight(context, 25),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.getProportionalScreenHeight(
                    context, itemDistance,
                  ),
                ),

                // categories
                buildCategoriesField(context, itemDistance),
                SizedBox(
                  height: Dimens.getProportionalScreenHeight(
                    context, itemDistance,
                  ),
                ),

                // rating
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: Dimens.getProportionalScreenWidth(context, 14),
                      color: AppColors.primaryBlue400,
                    ),
                    SizedBox(width: Dimens.getProportionalScreenWidth(
                      context, 7,
                    )),
                    Text(
                      '$rating/5', style: TextStyle(
                        color: AppColors.neutralBlue500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.getProportionalScreenHeight(
                    context, itemDistance,
                  ),
                ),

                // description
                Text(
                  description, overflow: TextOverflow.ellipsis,
                  softWrap: true, maxLines: 2,
                  style: TextStyle(
                    color: AppColors.neutralBlue500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoriesField(
    BuildContext context, double itemDistance
  ) {
    return SizedBox(
      height: Dimens.getScreenHeight(context,) * 0.0237,
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
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getProportionalScreenWidth(context, 10),
                vertical: Dimens.getProportionalScreenHeight(context, 2),
              ),
              margin: EdgeInsets.only(
                right: Dimens.getProportionalScreenWidth(
                  context, index == categories.length - 1 ? 0 : itemDistance,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimens.getScreenWidth(context),
                ),
                color: AppColors.primaryBlue200,
              ),
              child: Text(
                categories[index], maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryBlue400,
                  fontSize: Dimens.getProportionalScreenHeight(
                    context, 12,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
