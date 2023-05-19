import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/assistant/bloc/assistant_cubit.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/dialogs/api_key_error_dialog.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/chat_bubble.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/dialogs/not_api_key_error_dialog.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/input_field.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/loading_3_dots_indicator.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  void showNotApiKeyErrorDialog(BuildContext cubitContext) {
    showDialog(
      context: cubitContext,
      builder: (dialogContext) {
        return NotApiKeyErrorDialog(
          onSendAgainTap: () {
            cubitContext.read<AssistantCubit>().sendMessage();
          },
        );
      },
    );
  }

  void showInvalidApiKeyErrorDialog(BuildContext cubitContext, {
    bool isPrivateApiKey = false,
  }) {
    showDialog(
      context: cubitContext,
      barrierDismissible: false,
      builder: (dialogContext) {
        return ApiKeyErrorDialog(
          isPrivateApiKey: isPrivateApiKey,
          rightButtonOnTap: () async {
            final localManager = cubitContext.read<AssistantCubit>().localManager;
            await Future.wait([
              localManager.clearKey(LocalConstants.isPrivateApiKey),
              localManager.clearKey(LocalConstants.gptApiKey),
            ]).then((_) async {
              cubitContext.read<AssistantCubit>().onHandleInvalidApiKeyException(
                canTry: true,
              );
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.assistant,
            style: Dimens.getProportionalFont(
              context, context.theme.textTheme.headlineMedium,
            ).copyWith(
              color: context.theme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
              fontSize: Dimens.getProportionalWidth(context, 20),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: Dimens.getProportionalWidth(context, 40),
              color: context.theme.colorScheme.onPrimary,
            ),
          ),
          centerTitle: true,
          backgroundColor: context.theme.colorScheme.primary,
        ),
        body: BlocListener<AssistantCubit, AssistantState>(
          listenWhen: (previous, current) {
            return previous.sendErrorType != current.sendErrorType;
          },
          listener: (context, state) {
            switch(state.sendErrorType) {
              case SendErrorType.notApiKey:
                showNotApiKeyErrorDialog(context);
                break;
              case SendErrorType.apiKey:
                showInvalidApiKeyErrorDialog(context);
                break;
              case SendErrorType.priApiKey:
                showInvalidApiKeyErrorDialog(context, isPrivateApiKey: true);
                break;
              default:
                break;
            }
          },
          child: BlocBuilder<AssistantCubit, AssistantState>(
            builder: (context, state) {
              final scrollController = context.read<AssistantCubit>().scrollController;
              final length = state.messageHistory?.length ?? 0;
              return Container(
                width: Dimens.getScreenWidth(context),
                height: Dimens.getScreenHeight(context),
                color: context.theme.colorScheme.background,
                child: Column(
                  children: [
                    if (!state.usingPrivateApiKey)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.getProportionalWidth(context, 7),
                          vertical: Dimens.getProportionalHeight(context, 7),
                        ),
                        width: Dimens.getScreenWidth(context),
                        color: context.theme.colorScheme.outlineVariant,
                        child: RowIconTextInformation(
                          context: context,
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: context.theme.colorScheme.onInverseSurface,
                            size: Dimens.getProportionalWidth(context, 20),
                          ),
                          text: Text(
                            S.current.usingPublicApiKey,
                            style: Dimens.getProportionalFont(
                              context, context.theme.textTheme.bodySmall,
                            ).copyWith(
                              fontSize: Dimens.getProportionalWidth(context, 16),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: (state.messageHistory != null)
                          ? Column(
                        children: [
                          Flexible(
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              physics: const ClampingScrollPhysics(),
                              reverse: true,
                              shrinkWrap: true,
                              itemCount: length,
                              controller: scrollController,
                              itemBuilder: (context, index) {
                                final trueIndex = length - index - 1;
                                final message = state.messageHistory![trueIndex];
                                final isPlaying = state.playingIndex == trueIndex;
                                return ChatBubble(
                                  isMe: message.role == 'user',
                                  isPlaying: isPlaying,
                                  message: message.content,
                                  index: trueIndex,
                                  onPlayTap: () async {
                                    if (isPlaying) {
                                      await context.read<AssistantCubit>().stopSpeaking();
                                    } else {
                                      await context.read<AssistantCubit>().startSpeaking(
                                        message.content, trueIndex,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      )
                          : const SizedBox.shrink(),
                    ),
                    if (state.isWaitingNewMessage == true)
                      const Loading3DotsIndicator(),
                    const InputField(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
