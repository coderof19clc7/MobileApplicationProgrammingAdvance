import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/assistant/bloc/assistant_cubit.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/chat_bubble.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/input_field.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/loading_3_dots_indicator.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class AssistantPage extends StatefulWidget {
  const AssistantPage({Key? key}) : super(key: key);

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  var resizeToAvoidBottomInset = true;
  var isReverseList = false;
  // void showNotApiKeyErrorDialog(BuildContext cubitContext) {
  //   showDialog(
  //     context: cubitContext,
  //     builder: (dialogContext) {
  //       return NotApiKeyErrorDialog(
  //         onSendAgainTap: () {
  //           cubitContext.read<ChatCubit>().sendMessage();
  //         },
  //       );
  //     },
  //   );
  // }
  //
  // void showInvalidApiKeyErrorDialog(BuildContext cubitContext) {
  //   setState(() {
  //     resizeToAvoidBottomInset = false;
  //   });
  //   showDialog(
  //     context: cubitContext,
  //     barrierDismissible: false,
  //     builder: (dialogContext) {
  //       return ApiKeyErrorDialog(
  //         onActiveApiKeyTap: (newApiKey) {
  //           cubitContext.read<ChatCubit>().onActiveNewApiKeyAndReSend(newApiKey);
  //         },
  //       );
  //     },
  //   ).then((value) {
  //     setState(() {
  //       resizeToAvoidBottomInset = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.assistant),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: Dimens.getProportionalWidth(context, 40),
            ),
          ),
          centerTitle: true,
          backgroundColor: context.theme.colorScheme.primary,
        ),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: BlocBuilder<AssistantCubit, AssistantState>(
          builder: (context, state) {
            // if (context.read<ChatCubit>().showOtherErrorDialog == null) {
            //   context.read<ChatCubit>().showOtherErrorDialog = () {
            //     showNotApiKeyErrorDialog(context);
            //   };
            // }
            // if (context.read<ChatCubit>().showInvalidApiKeyErrorDialog == null) {
            //   context.read<ChatCubit>().showInvalidApiKeyErrorDialog = () {
            //     showInvalidApiKeyErrorDialog(context);
            //   };
            // }
            final scrollController = context.read<AssistantCubit>().scrollController;

            final length = state.messageHistory?.length ?? 0;
            return Container(
              width: Dimens.getScreenWidth(context),
              height: Dimens.getScreenHeight(context),
              color: Colors.white,
              child: Column(
                children: [
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
                              return ChatBubble(
                                isMe: message.role == 'user',
                                message: message.content,
                                index: trueIndex,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                        : const SizedBox.shrink(),
                  ),
                  if (state.isWaitingNewMessage == true) const Loading3DotsIndicator(),
                  const InputField(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
