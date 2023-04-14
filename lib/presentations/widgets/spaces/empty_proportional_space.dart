import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class EmptyProportionalSpace extends StatelessWidget {
  const EmptyProportionalSpace({super.key, this.width = 0, this.height = 0});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.getProportionalScreenHeight(context, height),
      width: Dimens.getProportionalScreenWidth(context, width),
    );
  }
}
