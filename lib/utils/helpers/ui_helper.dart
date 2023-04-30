import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/utils/extensions/string_extensions.dart';

class UIHelper {
  static void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  static void hideKeyboardNoContext() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static String getIconFromNationalityCode(String? code) {
    if (code == null) {
      return '🏳️‍🌈';
    }
    return String.fromCharCode(code.codeUnitAt(0) + 0x1F1A5) +
        String.fromCharCode(code.codeUnitAt(1) + 0x1F1A5);
  }

  static Widget buildDialogButton({
    required BuildContext context,
    double spaceBetweenLeftAndRight = 0,
    bool enableLeftBtn = true,
    bool enableRightBtn = true,
    String? leftButtonText,
    String? rightButtonText,
    Function(Object?)? onLeftButtonPress,
    Function(Object?)? onRightButtonPress,
    Object? data,
  }) {
    final textTheme = Dimens.getProportionalFont(context, context.theme.textTheme.bodyLarge);
    final textFillStyle = textTheme.copyWith(
      color: context.theme.colorScheme.onPrimary,
    );
    final textOutlineStyle = textTheme.copyWith(
      color: context.theme.colorScheme.onSurfaceVariant,
    );
    // case only 1 button
    if (rightButtonText == null) {
      return PrimaryFillButton(
        onTap: () {
          onLeftButtonPress?.call(data);
        },
        paddingVertical: Dimens.getProportionalHeight(context, 12),
        width: Dimens.getScreenWidth(context),
        preferGradient: false,
        child: Text(leftButtonText ?? '', style: textFillStyle),
      );
    }

    // case 2 buttons
    return Row(
      children: [
        Expanded(
          child: PrimaryOutlineButton(
            onTap: () {
              onLeftButtonPress?.call(data);
            },
            paddingVertical: Dimens.getProportionalHeight(context, 12),
            preferGradient: false,
            child: Text(leftButtonText ?? '', style: textOutlineStyle),
          ),
        ),

        SizedBox(
          width: Dimens.getProportionalWidth(
              context, spaceBetweenLeftAndRight),
        ),

        Expanded(
          child: PrimaryFillButton(
            onTap: () {
              onRightButtonPress?.call(data);
            },
            paddingVertical: Dimens.getProportionalHeight(context, 12),
            preferGradient: false,
            child: Text(rightButtonText, style: textFillStyle),
          ),
        ),
      ],
    );
  }

  static String doubleToStringAsFixed(double value, {int fixedNumber = 2}) {
    var fractionDigits = fixedNumber;
    final valueString = value.toStringAsFixed(fractionDigits);
    final valueFixedString = valueString.split('.')[1];
    if (valueFixedString.toInt() == 0) {
      fractionDigits = 0;
    } else if (valueFixedString.toInt() % (10 * (fixedNumber - 1)) == 0) {
      fractionDigits = fixedNumber - 1;
    }
    return value.toStringAsFixed(fractionDigits);
  }
}
