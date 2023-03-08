import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class SimpleTransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleTransparentAppBar({
    super.key,
    this.height,
    this.actions,
  });

  final double? height;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      leadingWidth: Dimens.getProportionalScreenWidth(context, 10),
      leading: Container(
        margin: EdgeInsets.only(
          left: Dimens.getProportionalScreenWidth(context, 15),
        ),
        child: GestureDetector(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: context.theme.colorScheme.onBackground,
            size: Dimens.getProportionalScreenWidth(context, 28),
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(0, height ?? 50);
}
