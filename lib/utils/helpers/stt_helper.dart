import 'dart:developer';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

enum SttNeededPermissions {microphone, voiceRecognition}

class SpeechToTextHelper {
  SpeechToTextHelper._();

  // private
  final _speech = SpeechToText();
  static SpeechToTextHelper? _instance;
  static var _isInitialized = false;

  static SpeechToTextHelper getInstance() {
    if (_instance == null) {
      _instance = SpeechToTextHelper._();
      _isInitialized = false;
    }
    return _instance!;
  }

  // get only
  List<LocaleName> _localeNames = [];

  //
  String currentLocaleId = '';
  var _pauseFor = 3; // in seconds
  int get pauseFor => _pauseFor;

  bool get isInitialized {
    return _isInitialized;
  }

  List<LocaleName> get localeNames {
    return _localeNames;
  }

  bool get isListening {
    return _speech.isListening;
  }

  Future<void> initializeStt({
    int stopListeningAfterIfNoWordsDetected = 3,
    void Function(SpeechRecognitionError)? onError,
    void Function(String)? onStatus,
  }) async {
    try {
      if (_isInitialized == false) {
        _pauseFor = stopListeningAfterIfNoWordsDetected;
        final isInitialized = await _speech.initialize(
          onError: onError,
          onStatus: onStatus,
        );
        if (isInitialized) {
          _localeNames = await _speech.locales();

          final systemLocale = await _speech.systemLocale();
          currentLocaleId = systemLocale?.localeId ?? '';

          for (final localeName in _localeNames) {
            log('localeName id: ${localeName.localeId}');
            log('localeName name: ${localeName.name}');
          }
          log('currentLocaleId: $currentLocaleId');
          log('systemLocale id: ${systemLocale?.localeId}');
          log('systemLocale name: ${systemLocale?.name}');
        }

        _isInitialized = isInitialized;
      }
    } catch (e) {
      _isInitialized = false;
    }
  }

  Future<void> startListening({
    ListenMode? listenMode,
    void Function(SpeechRecognitionResult)? onResult,
    void Function(double level)? onSoundLevelChange,
    bool? partialResults,
    bool? cancelOnError,
  }) async {
    if (_isInitialized && !_speech.isListening) {
      await _speech.listen(
        onResult: onResult,
        listenMode: listenMode ?? ListenMode.confirmation,
        localeId: currentLocaleId,
        pauseFor: Duration(seconds: pauseFor),
        onSoundLevelChange: onSoundLevelChange,
        partialResults: partialResults ?? true,
        cancelOnError: cancelOnError ?? true,
      );
    }
  }

  Future<void> stopListening() async {
    if (_isInitialized && _speech.isListening) {
      await _speech.stop();
    }
  }
}
