import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/toast_helper.dart';

class BasicStatusToast extends StatelessWidget {
  const BasicStatusToast({
    super.key,
    required this.message,
    this.type = StatusToastType.info,
  });

  final String message;
  final StatusToastType type;

  Widget getIcon(BuildContext context) {
    final iconSize = Dimens.getProportionalWidth(context, 17);
    Widget icon = const SizedBox.shrink();
    if (type == StatusToastType.success) {
      icon = Icon(
        Icons.check_circle_rounded,
        color: Colors.white,
        size: iconSize,
      );
    } else if (type == StatusToastType.warning) {
      icon = Icon(
        Icons.warning_rounded,
        color: Colors.white,
        size: iconSize,
      );
    } else if (type == StatusToastType.error) {
      icon = Icon(
        Icons.error_rounded,
        color: Colors.white,
        size: iconSize,
      );
    }

    return icon;
  }

  Color getColor() {
    var color = AppColors.neutralBlue200;
    if (type == StatusToastType.success) {
      color = AppColors.green400;
    } else if (type == StatusToastType.warning) {
      color = Colors.orange;
    } else if (type == StatusToastType.error) {
      color = AppColors.red400;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Dimens.getScreenWidth(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.getProportionalWidth(context, 14),
          vertical: Dimens.getProportionalHeight(context, 10),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.getScreenWidth(context) / 2),
          color: getColor(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getIcon(context),
            EmptyProportionalSpace(
              width: type == StatusToastType.info ? 0 : 7,
            ),
            Flexible(
              child: Text(
                message,
                style: context.theme.textTheme.displaySmall?.copyWith(
                  fontSize: Dimens.getProportionalWidth(context, 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
