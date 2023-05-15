import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_global_navigator.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  static Future<int> _checkPermissionStatus(Permission permission) async {
    final status = await permission.status;

    var result = 1;
    if (status.isGranted) {
      log('$permission is granted');
      result = 1;
    } else {
      final localManager = injector<LocalManager>();
      final localKey = '${permission}_${LocalConstants.isPermissionAskedBefore}';
      final nTimesPermissionDenied = localManager.getInt(localKey);
      if (nTimesPermissionDenied == null) {
        localManager.setInt(localKey, 0);
        result = -1;
      } else if (status.isDenied) {
        log('$permission is denied');
        result = -1;

        if (Platform.isIOS) {
          // for IOS, permission will be permanently denied
          // if user denied the permission at least once
          result = - 2;
        } else {
          var canAskAgain = nTimesPermissionDenied < 2;
          final androidInfo = await DeviceInfoPlugin().androidInfo;
          if (androidInfo.version.sdkInt < 30) {
            canAskAgain = await permission.shouldShowRequestRationale;
          } else if (canAskAgain) {
            localManager.setInt(localKey, nTimesPermissionDenied + 1);
          }

          if (!canAskAgain) {
            result = -2;
          }
        }

        if (result == -2) {
          log('$permission is denied but can never asked again --> need change in device settings');
        }
      } else {
        log('$permission is permanently denied --> need change in device settings');
        result = -2;
      }
    }
    return result;
  }
  static Future<bool> permissionsHandlingManually(Map<Permission, String> permissionsMap) async {
    final permissions = permissionsMap.keys.toList();
    final listPermissionsNames = permissionsMap.values.toList();
    final numberOfPermissions = permissions.length;

    // check needed permissions
    final listCheckPermissionStatusFunctions = <Future<int>>[];
    for (var i = 0; i < numberOfPermissions; i++) {
      listCheckPermissionStatusFunctions.add(_checkPermissionStatus(permissions[i]));
    }
    final checkingStatusResults = await Future.wait(listCheckPermissionStatusFunctions);

    // check the results list
    // maxResultInt used for checking if we should call request
    // or ask user to open device's settings
    var maxResultInt = 1;
    final listUnGrantedPermissionFunctions = <Permission>[];
    final listUnGratedPermissionsNames = <String>[];
    for (var i = 0; i < numberOfPermissions; i++) {
      if (checkingStatusResults[i] != 1) {
        maxResultInt = checkingStatusResults[i];
        if (maxResultInt == -2) {
          listUnGratedPermissionsNames.add(listPermissionsNames[i]);
        } else {
          listUnGrantedPermissionFunctions.add(permissions[i]);
        }
      }
    }

    // if all permissions are granted
    if (maxResultInt == 1) {
      return true;
    }

    if (maxResultInt == -2) {
      // some permission cannot call request() --> need to open setting
      showOpenSettingsRequestDialog(listUnGratedPermissionsNames);
    } else {
      // request all un-grated permission(s)
      listUnGrantedPermissionFunctions.request().then((value) {
        log('requestPermission(s)Result: $value');
      });
    }

    return false;
  }

  static Future<bool> permissionsHandling(Map<Permission, String> permissionsMap) async {
    final permissions = permissionsMap.keys.toList();
    final listPermissionsNames = permissionsMap.values.toList();
    final numberOfPermissions = permissions.length;

    var maxResultInt = 1;
    final checkingStatusResults = await permissions.request();
    final listUnGratedPermissionsNames = <String>[];
    for (var i = 0; i < numberOfPermissions; i++) {
      if (checkingStatusResults[permissions[i]] != PermissionStatus.granted
          && checkingStatusResults[permissions[i]] != PermissionStatus.limited
      ) {
        if (checkingStatusResults[permissions[i]] == PermissionStatus.denied) {
          maxResultInt = -1;
        } else {
          listUnGratedPermissionsNames.add(listPermissionsNames[i]);
          maxResultInt = -2;
        }
      }
    }

    // if all permissions are granted
    if (maxResultInt == 1) {
      return true;
    }

    if (maxResultInt == -2) {
      // some permission cannot call request() --> need to open setting
      showOpenSettingsRequestDialog(listUnGratedPermissionsNames);
    }

    return false;
  }

  static void showOpenSettingsRequestDialog(List<String> listUnGratedPermissionsNames) {
    final currentState = AppGlobalNavigator.navigatorKey.currentState;
    if (currentState == null) {
      if (kDebugMode) {
        debugPrint('cannot show dialog due to AppGlobalNavigator.navigatorKey.currentState is null');
      }
      return;
    }

    final textStyle = Dimens.getProportionalFont(
      currentState.context,
      currentState.context.theme.textTheme.bodyMedium,
    );
    showDialog(
      context: currentState.context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(S.current.permissionNeedOpenSettingsDialogTitle),
          content: Text(
            S.current.permissionNeedOpenSettingsDialogContent(
              listUnGratedPermissionsNames.join(', '),
            ),
            style: Dimens.getProportionalFont(
              currentState.context,
              currentState.context.theme.textTheme.bodyMedium,
            ).copyWith(
              fontSize: Dimens.getProportionalWidth(currentState.context, 17),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                S.current.denied,
                style: textStyle.copyWith(
                  color: currentState.context.theme.colorScheme.error,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                openAppSettings().then((value) {
                  if (value) {
                    Navigator.of(dialogContext).pop();
                  }
                });
              },
              child: Text(
                S.current.openSettings,
                style: textStyle.copyWith(
                  color: currentState.context.theme.colorScheme.primary,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
