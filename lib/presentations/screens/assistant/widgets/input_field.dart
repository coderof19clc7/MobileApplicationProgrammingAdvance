import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/assistant/bloc/assistant_cubit.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/loading_3_dots_indicator.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool enableSendButton = false;

  // Future<int> checkPermission(SttNeededPermissions permission) async {
  //   PermissionStatus? status;
  //   if (permission == SttNeededPermissions.microphone) {
  //     status = await Permission.microphone.status;
  //   } else if (Platform.isIOS && permission == SttNeededPermissions.voiceRecognition) {
  //     status = await Permission.speech.status;
  //   }
  //
  //   int result = 1;
  //   if (status != null) {
  //     if (status.isGranted) {
  //       log('permission is granted');
  //       result = 1;
  //     } else {
  //       final sharedPreferences = injector<SharedPreferences>();
  //       final isPermissionAskedBefore = sharedPreferences.getBool(
  //         LocalConstants.sttPermissionAskedBefore,
  //       ) ?? false;
  //       if (!isPermissionAskedBefore) {
  //         await sharedPreferences.setBool(
  //           LocalConstants.sttPermissionAskedBefore, true,
  //         );
  //         result = -1;
  //       } else if (status.isDenied) {
  //         log('permission is denied');
  //         result = -1;
  //         final canAskAgain = await Permission.microphone.shouldShowRequestRationale;
  //         if (Platform.isAndroid && !canAskAgain) {
  //           log('permission is denied and never ask again');
  //           result = -2;
  //         }
  //       } else {
  //         log('permission is permanently denied');
  //         result = -2;
  //       }
  //     }
  //   }
  //   return result;
  // }
  //
  // Future<bool> sttPermissionHandling() async {
  //   // check needed permissions
  //   final micPermission = await checkPermission(SttNeededPermissions.microphone);
  //   final voiceRecognitionPermission = await checkPermission(SttNeededPermissions.voiceRecognition);
  //
  //   // check needed permission(s) is(are) granted
  //   if (micPermission == 1 && voiceRecognitionPermission == 1) {
  //     // needed permission(s) is(are) granted
  //     return true;
  //   }
  //
  //   // request needed permission(s)
  //   if (micPermission == -2 || voiceRecognitionPermission == -2) {
  //     // needed permission(s) is(are) denied and never ask again
  //     // --> need to allow in setting
  //     showOpenSettingsRequestDialog();
  //   } else {
  //     final permissionArray = <Permission>[];
  //     if (micPermission == -1) {
  //       // microphone permission is denied
  //       permissionArray.add(Permission.microphone);
  //     }
  //     if (voiceRecognitionPermission == -1) {
  //       // voice recognition permission is denied
  //       permissionArray.add(Permission.speech);
  //     }
  //     if (permissionArray.isNotEmpty) {
  //       permissionArray.request().then((value) {
  //         log('requestPermission(s)Result: $value');
  //       });
  //     }
  //   }
  //   return false;
  // }
  //
  // void showSttDialog() {
  //   context.read<ChatCubit>().clearLastWords();
  //   showDialog(
  //     barrierDismissible: true,
  //     context: context,
  //     builder: (dialogContext) {
  //       return BlocProvider.value(
  //         value: context.read<ChatCubit>(),
  //         child: const SttDialog(),
  //       );
  //     },
  //   );
  // }
  //
  // void showOpenSettingsRequestDialog() {
  //   final message = Platform.isAndroid
  //       ? S.current.sttPermissionNeedOpenSettingsMessageAndroid
  //       : S.current.sttPermissionNeedOpenSettingsMessageIos;
  //   showDialog(
  //     context: context,
  //     builder: (dialogContext) {
  //       return AlertDialog(
  //         title: Text(S.current.needOpenSettingsDialogTitle),
  //         content: Text(message),
  //         actions: [
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.of(dialogContext).pop();
  //             },
  //             child: Text(
  //               S.current.denied,
  //               style: const TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.red,
  //                 fontSize: 15,
  //               ),
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //               openAppSettings().then((value) {
  //                 if (value) {
  //                   Navigator.of(dialogContext).pop();
  //                 }
  //               });
  //             },
  //             child: Text(
  //               S.current.openSettings,
  //               style: const TextStyle(color: AppColors.primaryColor400),
  //             ),
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssistantCubit, AssistantState>(
      builder: (context, state) {
        // final enableMicroButton = !state.isWaitingNewMessage;

        // // check if cubit updated the text controller
        // if (context.read<ChatCubit>().textEditingController.text.isNotEmpty) {
        //   enableSendButton = true;
        // }
        //
        // if (context.read<ChatCubit>().textEditingController.text.isEmpty) {
        //   enableSendButton = false;
        // }

        return Container(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            top: 8,
            bottom: Dimens.getBottomSafeAreaHeight(context) == 0
                ? Dimens.getBottomSafeAreaHeight(context) + 8
                : Dimens.getBottomSafeAreaHeight(context) + 4,
          ),
          width: Dimens.getScreenWidth(context),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 2),
              //   child: enableMicroButton
              //       ? Material(
              //     child: InkResponse(
              //       onTap: () async {
              //         // close keyboard
              //         UIHelper.hideKeyboard(context);
              //         final canShowSttDialog = await sttPermissionHandling();
              //         if (canShowSttDialog) {
              //           showSttDialog();
              //         }
              //       },
              //       child: const Icon(
              //         Icons.mic_rounded,
              //         color: AppColors.primaryColor400,
              //       ),
              //     ),
              //   )
              //       : const Loading3DotsIndicator(),
              // ),
              SizedBox(width: Dimens.getScreenWidth(context) * 0.03),
              Expanded(
                child: TextFieldFill(
                  textController: context.read<AssistantCubit>().textEditingController,
                  hintText: S.current.assistantInputHint,
                  minLines: 1,
                  maxLines: 5,
                  onChanged: (value) {
                    if (value.isNotEmpty != enableSendButton) {
                      setState(() {
                        enableSendButton = value.isNotEmpty;
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: Dimens.getScreenWidth(context) * 0.03),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: (state.isWaitingNewMessage)
                    ? const Loading3DotsIndicator() // is waiting new message
                    : Material(
                  child: InkResponse(
                    onTap: enableSendButton
                        ? () {
                      UIHelper.hideKeyboard(context);
                      context.read<AssistantCubit>().sendMessage(); // enabled
                    }
                        : null, // disabled, empty message
                    child: enableSendButton
                        ? Icon(
                      Icons.send_rounded,
                      color: context.theme.colorScheme.primary,
                    )
                        : Icon(
                      Icons.send_rounded,
                      color: AppColors.neutralBlue700.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
