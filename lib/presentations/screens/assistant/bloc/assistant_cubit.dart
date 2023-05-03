import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/chat/chat_model.dart';

part 'assistant_state.dart';

class AssistantCubit extends WidgetCubit<AssistantState> {
  AssistantCubit._() : super(widgetState: const AssistantState());

  @override
  void onWidgetCreated() {}

  ScrollController? scrollController;
  TextEditingController? textEditingController;

  String apiKey = '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';
  var openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 50)),
  );

  static AssistantCubit? _instance;
  static AssistantCubit getInstance() {
    if (kDebugMode) {
      print('AssistantCubit _instance?.isClosed: ${_instance?.isClosed}');
    }
    if (_instance == null || _instance?.isClosed == true) {
      if (kDebugMode) {
        var text = '';
        if (_instance == null) {
          text += '_instance is null, ';
        }
        if (_instance?.isClosed == true) {
          text += '_instance is closed, set to null and ';
          _instance = null;
        }
        print('$text create new _instance of TutorsCubit');
      }
      _instance = AssistantCubit._();
      _instance?.scrollController = ScrollController();
      _instance?.textEditingController = TextEditingController();
    }
    return _instance!;
  }

  Future<void> onUpdateMessageHistory({bool needScroll = true}) async {
    await Future.delayed(const Duration(milliseconds: 250));
    if (scrollController?.hasClients == true && needScroll) {
      // scroll to bottom
      scrollController?.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> sendMessage({int tryCount = 1}) async {
    if (textEditingController?.text.trim().isNotEmpty == true || tryCount > 1) {
      // stop playing
      // if (_tts.ttsState == TtsState.playing) {
      //   await _tts.stop();
      // }

      // change to waiting new message state
      emit(state.copyWith(isWaitingNewMessage: true));

      // add new message from user into message history and clear text field
      // (only on first try)
      final messageHistory = (state.messageHistory ?? []).map((e) {
        return e.copyWith();
      }).toList();
      if (tryCount == 1) {
        messageHistory.add(ChatMessageModel(
          role: 'user',
          content: textEditingController?.text.trim() ?? '',
        ));
        textEditingController?.text = '';
        emit(state.copyWith(
            messageHistory: messageHistory.map((e) {
              return e.copyWith();
            }).toList()));

        // scroll to bottom if possible
        await onUpdateMessageHistory();
      }

      // send message to openAI
      try {
        // get list messages to send
        // (will up to last 10 messages and the new message)
        final length = messageHistory.length;
        final maxMessagesCount = length < 11 ? length : 11;
        final startPosition = length < 11 ? 0 : length - 11;
        final messagesToSend = List.generate(
            maxMessagesCount,
                (index) => Map.of({
              'role': messageHistory[startPosition + index].role,
              'content': messageHistory[startPosition + index].content,
            }));
        if (kDebugMode) {
          log('messages to send: $messagesToSend');
        }

        final request = ChatCompleteText(
          model: ChatModel.gptTurbo,
          maxToken: 2000,
          messages: messagesToSend,
        );
        final message = await openAI.onChatCompletion(request: request);
        if (message != null) {
          log("message's role: ${message.choices[0].message?.role}");
          log('message: ${message.choices[0].message?.content}');
          messageHistory.add(ChatMessageModel(
            role: message.choices[0].message?.role ?? 'assistant',
            content: message.choices[0].message?.content ?? 'Cannot get message',
          ));

          emit(state.copyWith(
            isWaitingNewMessage: false,
            messageHistory: messageHistory.map((e) {
              return e.copyWith();
            }).toList(),
          ));

          // save message history to local storage and scroll to bottom if need
          await Future.wait([
            // saveMessageHistory(),
            onUpdateMessageHistory(
              needScroll: scrollController?.position.pixels == 0,
            ),
          ]);

          // if (state.isAutoplay) {
          //   final textToSpeak = messageHistory.last.content;
          //   startSpeaking(textToSpeak.replaceAll('```', ''), state.messageHistory!.length - 1);
          // }
        }
      } catch (e) {
        log('error: $e');

        final errorString = e.toString();
        var needShowChangeKeyPopup = false;
        // check if the error is one of api key errors
        // if (errorString.contains('status code :401')
        //     || errorString.contains('status code :404')
        //     || (errorString.contains('status code :429')
        //         && errorString.contains('insufficient_quota'))
        // ) {
        //   needShowChangeKeyPopup = true;
        // }

        // if (needShowChangeKeyPopup) {
        //   // error occur because of an api key error
        //   await onHandleInvalidApiKeyException(tryCount == 1);
        // } else {
        //   // return user's input in text field
        //   // and remove last message from message history
        //   textEditingController.text = messageHistory.last.copyWith().content;
        //   emit(state.copyWith(
        //       messageHistory: messageHistory
        //           .sublist(
        //         0,
        //         messageHistory.length - 1,
        //       )
        //           .map((e) {
        //         return e.copyWith();
        //       }).toList()));
        //
        //   // show error dialog to notify user about sending message error
        //   showOtherErrorDialog?.call();
        // }
      }
      emit(state.copyWith(isWaitingNewMessage: false));
    }
  }

  @override
  Future<void> close() async {
    scrollController?.dispose();
    textEditingController?.dispose();
    super.close();
    if (_instance?.isClosed == true) {
      if (kDebugMode) {
        print('ChatCubit _instance is closed --> set to null');
      }
      _instance = null;
    }
  }
}
