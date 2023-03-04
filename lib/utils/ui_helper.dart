import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
}
