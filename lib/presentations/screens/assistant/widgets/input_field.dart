import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/assistant/bloc/assistant_cubit.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/dialogs/stt_dialog.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/loading_3_dots_indicator.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/permissions_helper.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool enableSendButton = false;

  void showSttDialog() {
    context.read<AssistantCubit>().clearLastWords();
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<AssistantCubit>(),
          child: const SttDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssistantCubit, AssistantState>(
      builder: (context, state) {
        final enableMicroButton = !state.isWaitingNewMessage;

        final isTextFieldNowEmpty = context.read<AssistantCubit>().textEditingController?.text.isNotEmpty == true;
        if (isTextFieldNowEmpty != enableSendButton) {
          enableSendButton = isTextFieldNowEmpty;
        }

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
            color: context.theme.colorScheme.background,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: enableMicroButton
                    ? Material(
                  child: InkResponse(
                    onTap: () async {
                      // close keyboard
                      UIHelper.hideKeyboard(context);
                      final permissionMap = {
                        Permission.microphone: S.current.microphone,
                      };
                      if (Platform.isIOS) {
                        permissionMap[Permission.speech] = S.current.voiceRecognition;
                      }
                      final canShowSttDialog = await PermissionsHelper.permissionsHandling(
                        permissionMap,
                      );
                      if (canShowSttDialog) {
                        showSttDialog();
                      }
                    },
                    child: Icon(
                      Icons.mic_rounded,
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                )
                    : const Loading3DotsIndicator(),
              ),
              SizedBox(width: Dimens.getScreenWidth(context) * 0.03),
              Expanded(
                child: TextFieldFill(
                  textController: context.read<AssistantCubit>().textEditingController,
                  hintText: S.current.assistantInputHint,
                  minLines: 1,
                  maxLines: 5,
                  isDense: true,
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
                  color: AppColors.transparent,
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
