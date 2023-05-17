import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/firebase_constants.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/chat/chat_model.dart';
import 'package:one_one_learn/utils/helpers/remote_config_helper.dart';
import 'package:one_one_learn/utils/helpers/stt_helper.dart';
import 'package:one_one_learn/utils/helpers/tts_helper.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'assistant_state.dart';

class AssistantCubit extends WidgetCubit<AssistantState> {
  AssistantCubit._() : super(widgetState: const AssistantState());

  @override
  Future<void> onWidgetCreated() async {}

  ScrollController? scrollController;
  TextEditingController? textEditingController;
  final _ttsHelper = injector<TextToSpeechHelper>();
  final _sttHelper = injector<SpeechToTextHelper>();
  final _remoteConfigHelper = injector<RemoteConfigHelper>();

  final defaultApikey = LocalConstants.defaultApiKey;
  var currentApiKey = 'noneValidAvailableKey';
  var openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 50)),
  );
  void buildOpenAI(String token) {
    openAI = OpenAI.instance.build(
      token: token.trim().isEmpty ? defaultApikey : token,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 50)),
    );
  }

  Future<void> initOpenAI() async {
    // try to get current api key from local storage
    var isPrivateApiKey = localManager.getBool(LocalConstants.isPrivateApiKey) ?? false;
    final localApiKey = localManager.getString(LocalConstants.gptApiKey) ?? defaultApikey;
    currentApiKey = localApiKey;

    // try to get a valid and available api key from cloud if need
    if (currentApiKey == defaultApikey) {
      isPrivateApiKey = false;
      final apiKeyFromCloud = await _remoteConfigHelper.getString(
        RemoteConfigConstants.gptApiKey,
      );
      if (kDebugMode) {
        print('apiKeyFromCloud: $apiKeyFromCloud');
      }
      if (apiKeyFromCloud == defaultApikey || apiKeyFromCloud.trim().isEmpty) {
        currentApiKey = defaultApikey;
      } else {
        currentApiKey = apiKeyFromCloud;
        await localManager.setString(LocalConstants.gptApiKey, currentApiKey);
      }
      await localManager.setBool(LocalConstants.isPrivateApiKey, isPrivateApiKey);
    }

    if (kDebugMode) {
      print('apiKeyToBuildOpenAI: $currentApiKey');
    }
    buildOpenAI(currentApiKey);
    emitNewState(state.copyWith(usingPrivateApiKey: isPrivateApiKey));
  }

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

  void getAssistantMessageHistoryAndSettingsFromLocal() {
    // get autoPlaySettings from storage
    final autoPlayNewMessage = localManager.getBool(
      LocalConstants.autoPlayNewMessage,
    ) ?? true;

    // get message history from storage
    List<ChatMessageModel>? messageHistory;
    final storageMessageHistory = localManager.getString(
      LocalConstants.chatBotMessageHistory,
    );
    if (storageMessageHistory != null) {
      messageHistory = List<ChatMessageModel>.from(
        (jsonDecode(storageMessageHistory) as List).map(ChatMessageModel.fromJson),
      );
    }

    emitNewState(state.copyWith(
      messageHistory: messageHistory,
      isAutoplay: autoPlayNewMessage,
    ));
  }

  Future<void> initAssistantUtils() async {
    changeLoadingState(isLoading: true);
    getAssistantMessageHistoryAndSettingsFromLocal();
    await Future.wait([
      _ttsHelper.initTts(),
      initOpenAI(),
    ]);
    changeLoadingState(isLoading: false);
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

  void undoSend() {
    final messageHistory = (state.messageHistory ?? []).map((e) {
      return e.copyWith();
    }).toList();
    textEditingController?.text = messageHistory.last.copyWith().content;
    emitNewState(state.copyWith(
      messageHistory: messageHistory.sublist(
        0, messageHistory.length - 1,
      ).map((e) {
        return e.copyWith();
      }).toList(),
    ));
  }

  Future<void> onActiveNewApiKeyAndReSend(String newApiKey, {
    int tryCount = 1,
  }) async {
    // save api key to local storage
    final apiKeyToSave = newApiKey.trim().isEmpty ? defaultApikey : newApiKey;
    await localManager.setString(LocalConstants.gptApiKey, apiKeyToSave);
    await initOpenAI();
    await sendMessage(tryCount: tryCount);
  }

  Future<void> onHandleInvalidApiKeyException({bool canTry = false}) async {
    var apiKeyFromCloud = defaultApikey;
    if (canTry) {
      // try to get new api key from cloud to resend message 1 time
      apiKeyFromCloud = await _remoteConfigHelper.getString(
        RemoteConfigConstants.gptApiKey,
      );
    }

    if (kDebugMode) {
      print('apiKeyFromCloud2: $apiKeyFromCloud');
    }

    // check if new api key is valid
    if (apiKeyFromCloud.trim().isNotEmpty && apiKeyFromCloud != defaultApikey
        && currentApiKey != apiKeyFromCloud) {
      // resend message with new api key
      await onActiveNewApiKeyAndReSend(apiKeyFromCloud, tryCount: 2);
    } else {
      // clear local api key
      currentApiKey = defaultApikey;
      await localManager.clearKey(LocalConstants.gptApiKey);

      // return user's input in text field
      // and remove last message from message history
      undoSend();
      emitNewState(state.copyWith(sendErrorType: SendErrorType.apiKey));

      // show dialog ask user to input his/her api key to send the message
      // showInvalidApiKeyErrorDialog?.call();
    }
  }

  Future<void> sendMessage({int tryCount = 1}) async {
    if (textEditingController?.text.trim().isNotEmpty == true || tryCount > 1) {
      // stop playing
      if (_ttsHelper.ttsState == TtsState.playing) {
        await _ttsHelper.stop();
      }

      // change to waiting new message state
      emitNewState(state.copyWith(isWaitingNewMessage: true));

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
        emitNewState(state.copyWith(
          messageHistory: messageHistory.map((e) {
            return e.copyWith();
          }).toList(),
        ));

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
          }),
        );
        if (kDebugMode) {
          log('messages to send: $messagesToSend');
        }

        // truly send message
        final request = ChatCompleteText(
          model: ChatModel.gptTurbo,
          maxToken: 2000,
          messages: messagesToSend,
        );
        final message = await openAI.onChatCompletion(request: request);

        // process new message
        if (message != null) {
          log("message's role: ${message.choices[0].message?.role}");
          log('message: ${message.choices[0].message?.content}');
          messageHistory.add(ChatMessageModel(
            role: message.choices[0].message?.role ?? 'assistant',
            content: message.choices[0].message?.content ?? 'Cannot get message',
          ));

          emitNewState(state.copyWith(
            isWaitingNewMessage: false,
            messageHistory: messageHistory.map((e) {
              return e.copyWith();
            }).toList(),
          ));

          // save message history to local storage and scroll to bottom if need
          await Future.wait([
            saveMessageHistory(),
            onUpdateMessageHistory(
              needScroll: scrollController?.position.pixels == 0,
            ),
          ]);

          // play message if isAutoplay is true
          if (state.isAutoplay) {
            final textToSpeak = messageHistory.last.content;
            startSpeaking(textToSpeak.replaceAll('```', ''), state.messageHistory!.length - 1);
          }
        }
      } catch (e) {
        log('error: $e');

        final errorString = e.toString();
        var isApiKeyError = false;
        // check if the error is one of api key errors
        if (errorString.contains('status code :401')
            || errorString.contains('status code :404')
            || (errorString.contains('status code :429')
                && errorString.contains('insufficient_quota'))
        ) {
          isApiKeyError = true;
        }

        if (isApiKeyError) {
          // error occur because of an api key error
          if (state.usingPrivateApiKey) {
            // the private api key of user is not valid anymore
            // --> ask user to provide new one or use public api key
            emitNewState(state.copyWith(sendErrorType: SendErrorType.priApiKey));
          } else {
            // the current public api key is not valid anymore
            // --> try fetch new one from server and re-send
            await onHandleInvalidApiKeyException(canTry: tryCount == 1);
          }
        } else {
          // return user's input in text field
          // and remove last message from message history
          undoSend();
          emitNewState(state.copyWith(sendErrorType: SendErrorType.notApiKey));

          // show error dialog to notify user about sending message error
          // showOtherErrorDialog?.call();
        }
      }
      emitNewState(state.copyWith(
        isWaitingNewMessage: false, sendErrorType: SendErrorType.none,
      ));
    }
  }

  Future<void> saveMessageHistory() async {
    await localManager.setString(
      LocalConstants.chatBotMessageHistory,
      jsonEncode(state.messageHistory?.map((e) => e.toMap()).toList()),
    );
  }

  // tts processing functions
  Future<void> stopSpeaking() async {
    if (_ttsHelper.ttsState == TtsState.playing) {
      await _ttsHelper.stop();
      _ttsHelper.ttsState = TtsState.cancelled;
      emitNewState(state.copyWith(playingIndex: -1));
    }
  }

  Future<void> startSpeaking(String message, int index) async {
    if (_ttsHelper.ttsState == TtsState.playing) {
      await _ttsHelper.stop();
      // set the state to cancelled before entering playing state
      _ttsHelper.ttsState = TtsState.cancelled;
    }

    if (message.isNotEmpty) {
      log('want to play: $index');
      // final currentPlayingIndex = state.playingIndex;
      log('previous playing message: ${state.playingIndex}');

      emitNewState(state.copyWith(playingIndex: index));
      log('playing: ${state.playingIndex}');

      await Future.delayed(const Duration(milliseconds: 200));

      _ttsHelper.speak(message).then((value) {
        // need to check if the playing message was interrupted/cancelled
        // otherwise the playingIndex would be overridden with -1 which would show no message as playing
        if (!(_ttsHelper.ttsState == TtsState.cancelled)) {
          emitNewState(state.copyWith(playingIndex: -1));
        }

        // if this message was interrupted, the print below should show which message interrupted this message
        log('after $index stopped: ${state.playingIndex}');
      });
    }
  }

  // stt processing functions
  bool get isListening {
    return _sttHelper.isListening;
  }

  String get currentLocalId {
    return _sttHelper.currentLocaleId;
  }

  void onSttStatus(String status) {
    if (status == 'done') {
      emitNewState(state.copyWith(soundLevel: 0));
      if (state.lastWords.isNotEmpty) {
        textEditingController?.value = TextEditingValue(
          text: '${textEditingController?.text ?? ''} ${state.lastWords}',
          selection: TextSelection.fromPosition(
            TextPosition(offset: state.lastWords.length),
          ),
        );
      }
    }
  }

  Future<void> initStt() async {
    await _sttHelper.initializeStt(onStatus: onSttStatus);
    emitNewState(state.copyWith(sttInitializedStatus: _sttHelper.isInitialized ? 1 : -1));
  }

  void clearLastWords() {
    emitNewState(state.copyWith(lastWords: ''));
  }

  void updateLastWords(SpeechRecognitionResult result) {
    emitNewState(state.copyWith(lastWords: result.recognizedWords));
  }

  void updateSoundLevel(double level) {
    emitNewState(state.copyWith(soundLevel: level));
  }

  Future<void> startListening() async {
    clearLastWords();
    await _sttHelper.startListening(
      onResult: updateLastWords,
      onSoundLevelChange: updateSoundLevel,
    );
  }

  Future<void> stopListening() async {
    emitNewState(state.copyWith(soundLevel: 0));
    await _sttHelper.stopListening();
  }

  List<LocaleName> get localeNames {
    return _sttHelper.localeNames.where((locale) {
      if (Platform.isAndroid) {
        return locale.localeId == 'en_US'
            || locale.localeId == 'en_GB'
            || locale.localeId == 'vi_VN';
      }
      return locale.localeId == 'en-US'
          || locale.localeId == 'en-GB'
          || locale.localeId == 'vi-VN'
          || locale.localeId == 'vi-US';
    }).toList();
  }

  Future<void> setSttLanguage(String localeId) async {
    await _sttHelper.stopListening();
    _sttHelper.currentLocaleId = localeId;
    emitNewState(state.copyWith(currentLocaleId: localeId, soundLevel: 0));
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
