import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/assistant/bloc/assistant_cubit.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/dialogs/stt_language_options_widget.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/dialogs/stt_recognition_widget.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class SttDialog extends StatefulWidget {
  const SttDialog({super.key});

  @override
  State<SttDialog> createState() => _SttDialogState();
}

class _SttDialogState extends State<SttDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssistantCubit, AssistantState>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: Theme.of(context).canvasColor,
          child: SizedBox(
            height: Dimens.getScreenHeight(context) * 1 / 3,
            width: Dimens.getScreenWidth(context) * 2 / 3,
            child: buildDialogBody(state),
          ),
        );
      },
    );
  }

  Widget buildDialogBody(AssistantState state) {
    if (state.sttInitializedStatus == 0) {
      context.read<AssistantCubit>().initStt();
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.getProportionalWidth(context, 14),
        ),
        child: const CircularProgressIndicator(),
      );
    }

    if (state.sttInitializedStatus == -1) {
      final errorMessage = Platform.isIOS
          ? S.current.sttInitializationFailedMessageIos
          : S.current.sttInitializationFailedMessageAndroid;
      return Center(
        child: Text(
          'Error ${S.current.sttInitializationFailed}$errorMessage',
          style: Dimens.getProportionalFont(
            context, context.theme.textTheme.bodyLarge,
          ).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 16),
          ),
        ),
      );
    }

    return Column(
      children: [
        SttLanguageOptionsWidget(
          currentLocaleId: context.read<AssistantCubit>().currentLocalId,
          switchLang: context.read<AssistantCubit>().setSttLanguage,
          localeNames: context.read<AssistantCubit>().localeNames,
        ),
        Expanded(
          child: SttRecognitionWidget(
            lastWords: state.lastWords,
            soundLevel: state.soundLevel,
            isListening: context.read<AssistantCubit>().isListening,
            startListening: context.read<AssistantCubit>().startListening,
            stopListening: context.read<AssistantCubit>().stopListening,
          ),
        ),
      ],
    );
  }
}