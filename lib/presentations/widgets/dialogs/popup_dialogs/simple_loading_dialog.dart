import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class SimpleLoadingDialog extends StatelessWidget {
  const SimpleLoadingDialog({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getProportionalWidth(context, 16),
                vertical: Dimens.getProportionalHeight(context, 12),
              ),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(
                    radius: Dimens.getProportionalWidth(context, 20),
                  ),
                  const EmptyProportionalSpace(height: 14),
                  Text(
                    '${title ?? S.of(context).loading}...',
                    style: context.theme.textTheme.headlineSmall,
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
