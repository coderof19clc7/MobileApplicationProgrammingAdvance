import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_one_learn/configs/app_configs/app_global_navigator.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/others/basic_status_toast.dart';

enum StatusToastType {
  success,
  error,
  warning,
  info,
}

class ToastHelper {
  static final _fToast = FToast();
  static void showToast({
    required Widget child,
    PositionedToastBuilder? positionedToastBuilder,
    Duration toastDuration = const Duration(seconds: 2),
    ToastGravity? gravity,
    Duration fadeDuration = const Duration(milliseconds: 350),
  }) {
    if (AppGlobalNavigator.navigatorKey.currentState == null) {
      if (kDebugMode) {
        debugPrint('cannot show toast due to AppGlobalNavigator.navigatorKey.currentState is null');
      }
      return;
    }
    if (_fToast.context == null
        || _fToast.context != AppGlobalNavigator.navigatorKey.currentState!.context
    ) {
      _fToast.init(AppGlobalNavigator.navigatorKey.currentState!.context);
    }
    _fToast.showToast(
      child: child,
      positionedToastBuilder: positionedToastBuilder,
      toastDuration: toastDuration,
      gravity: gravity,
      fadeDuration: fadeDuration,
    );
  }

  static void showBasicStatusToast({
    required String message,
    StatusToastType statusToastType = StatusToastType.info,
  }) {
    showToast(
      positionedToastBuilder: (context, child) {
        return Positioned(
          left: Dimens.getProportionalWidth(context, 30),
          right: Dimens.getProportionalWidth(context, 30),
          bottom: Dimens.getBottomSafeAreaHeight(context) + 5,
          child: child,
        );
      },
      child: BasicStatusToast(
        message: message, type: statusToastType,
      ),
    );
  }
}
