import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';

class SimpleListFakeChips extends StatelessWidget {
  const SimpleListFakeChips({
    super.key,
    required this.listData,
    this.fontSize = 14,
    this.height,
    this.itemDistance = 10,
    this.isHorizontal = true,
    this.isFakeChip = true,
    this.bgColor,
    this.textColor,
  });

  final List<String> listData;
  final double fontSize;
  final double? height;
  final double itemDistance;
  final bool isHorizontal, isFakeChip;
  final Color? bgColor, textColor;

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
          itemCount: listData.length,
          itemBuilder: (context, index) {
            final isLast = index == listData.length - 1;
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
              child: FakeChip(
                text: listData[index],
                fontSize: fontSize,
                bgColor: bgColor,
                textColor: textColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
