import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class ApiKeyErrorDialog extends StatelessWidget {
  const ApiKeyErrorDialog({
    super.key, required this.isPrivateApiKey, this.rightButtonOnTap,
  });

  final bool isPrivateApiKey;
  final void Function()? rightButtonOnTap;

  @override
  Widget build(BuildContext context) {
    final errorText = isPrivateApiKey ? S.current.priApiKeySendError : S.current.apiKeySendError;
    final baseTextStyle = Dimens.getProportionalFont(
      context, context.theme.textTheme.bodyLarge,
    ).copyWith(
      fontSize: Dimens.getProportionalWidth(context, 18),
    );
    return AlertDialog(
      scrollable: true,
      title: Text(S.current.sendErrorTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errorText,
            style: baseTextStyle.copyWith(
              fontSize: Dimens.getProportionalWidth(context, 16),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: Text(
            S.current.cancel,
            style: baseTextStyle.copyWith(
              color: isPrivateApiKey
                  ? context.theme.colorScheme.onBackground
                  : context.theme.colorScheme.primary,
            ),
          ),
        ),

        if (isPrivateApiKey)
          TextButton(
            onPressed: () async {
              rightButtonOnTap?.call();
              Navigator.of(context).pop();
            },
            child: Text(
              S.current.usePublicApiKey,
              style: baseTextStyle.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
          ),
      ],
    );
  }
}
