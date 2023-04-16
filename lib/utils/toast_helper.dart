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
    // _fToast.showToast(
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(25.0),
    //       color: Colors.black87,
    //     ),
    //     child: Text(
    //       message,
    //       style: const TextStyle(color: Colors.white),
    //     ),
    //   ),
    //   gravity: ToastGravity.BOTTOM,
    //   toastDuration: const Duration(seconds: 2),
    // );
  }

  static void showBasicStatusToast({
    required String message,
    StatusToastType statusToastType = StatusToastType.info,
  }) {
    showToast(
      toastDuration: const Duration(seconds: 1),
      positionedToastBuilder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: Dimens.getBottomSafeAreaHeight(context),
          child: child,
        );
      },
      child: BasicStatusToast(
        message: message, type: statusToastType,
      ),
    );
  }
}
