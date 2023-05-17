import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class NotApiKeyErrorDialog extends StatelessWidget {
  const NotApiKeyErrorDialog({super.key, this.onSendAgainTap});

  final void Function()? onSendAgainTap;

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = Dimens.getProportionalFont(
      context, context.theme.textTheme.bodyLarge,
    ).copyWith(
      fontSize: Dimens.getProportionalWidth(context, 16),
      fontWeight: FontWeight.w600,
    );
    return AlertDialog(
      title: Text(S.current.sendErrorTitle),
      content: Text(S.current.notApiKeySendError),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: Text(
            S.current.no,
            style: baseTextStyle.copyWith(
              color: context.theme.colorScheme.onInverseSurface,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            onSendAgainTap?.call();
          },
          child: Text(
            S.current.yes,
            style: baseTextStyle.copyWith(
              color: context.theme.colorScheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
