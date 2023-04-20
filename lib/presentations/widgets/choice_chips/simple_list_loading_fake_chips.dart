import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';

class SimpleListLoadingFakeChips extends StatelessWidget {
  const SimpleListLoadingFakeChips({
    super.key,
    this.count = 3,
    this.height,
    this.itemDistance = 10,
    this.isHorizontal = true,
  });

  final int count;
  final double? height;
  final double itemDistance;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? (Dimens.getScreenHeight(context) * 0.037),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return true;
        },
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
          itemCount: count,
          itemBuilder: (context, index) {
            final isLast = index == count - 1;
            return Container(
              margin: EdgeInsets.only(
                right: Dimens.getProportionalWidth(
                  context,
                  (!isHorizontal || isLast) ? 0 : itemDistance,
                ),
                bottom: Dimens.getProportionalWidth(
                  context,
                  (isHorizontal || isLast) ? 0 : itemDistance,
                ),
              ),
              child: AppFadeShimmer(
                width: Dimens.getScreenWidth(context) * 0.2,
                radius: 15,
              ),
            );
          },
        ),
      ),
    );
  }
}
