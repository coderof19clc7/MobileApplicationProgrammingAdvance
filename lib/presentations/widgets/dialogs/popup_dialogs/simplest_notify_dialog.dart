import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class SimplestNotifyDialog extends StatelessWidget {
  const SimplestNotifyDialog({
    super.key,
    this.title,
    required this.content,
  });

  final String? title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.getProportionalWidth(context, 16),
          vertical: Dimens.getProportionalHeight(context, 12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? S.of(context).notification,
              style: context.theme.textTheme.headlineMedium,
            ),
            const EmptyProportionalSpace(height: 7),
            Text(
              content,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyMedium,
            ),
            const EmptyProportionalSpace(height: 10),
            PrimaryOutlineButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              paddingVertical: Dimens.getProportionalHeight(context, 8),
              child: Text('OK', style: Dimens.getProportionalFont(
                context, context.theme.textTheme.titleSmall?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              )),
            ),
          ],
        )
      ),
    );
  }
}
