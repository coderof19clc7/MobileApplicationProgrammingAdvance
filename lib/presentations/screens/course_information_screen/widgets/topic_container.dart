import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
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
          borderRadius: BorderRadius.circular(
            Dimens.getProportionalScreenWidth(context, 10),
          ),
          border: Border.all(color: AppColors.grey),
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
              backgroundColor: AppColors.primaryBlue200,
              child: Text(
                index.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
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
