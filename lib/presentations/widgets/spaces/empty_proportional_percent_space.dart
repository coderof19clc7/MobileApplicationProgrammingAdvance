import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class EmptyProportionalPercentSpace extends StatelessWidget {
  const EmptyProportionalPercentSpace({
    super.key,
    this.percentWidth = 0,
    this.percentHeight = 0,
  });

  final double percentWidth;
  final double percentHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.getScreenHeight(context) * percentHeight,
      width: Dimens.getScreenWidth(context) * percentWidth,
    );
  }
}
