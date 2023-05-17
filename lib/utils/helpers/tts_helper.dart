import 'dart:developer';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, cancelled, paused, continued }

class TextToSpeechHelper {
  TextToSpeechHelper._();

  final FlutterTts _tts = FlutterTts();
  static TextToSpeechHelper? _instance;
  static var isInitialized = false;
  var ttsState = TtsState.stopped;

  static TextToSpeechHelper getInstance() {
    if (_instance == null) {
      _instance = TextToSpeechHelper._();
      isInitialized = false;
      _instance?.ttsState = TtsState.stopped;
    }
    return _instance!;
  }

  final _defaultVolume = 0.5;
  final _defaultPitch = 1.0;
  final _defaultRate = 0.5;

  Future<void> initTts() async {
    if (!isInitialized) {
      try {
        _tts..setStartHandler(() {
          ttsState = TtsState.playing;
        })
          ..setCompletionHandler(() {
            ttsState = TtsState.stopped;
          })
          ..setCancelHandler(() {
            ttsState = TtsState.cancelled;
          })
          ..setPauseHandler(() {
            ttsState = TtsState.paused;
          })
          ..setContinueHandler(() {
            ttsState = TtsState.continued;
          })
          ..setErrorHandler((msg) {
            ttsState = TtsState.stopped;
          });

        if (kDebugMode) {
          // check supported languages and voices
          final languages = (await _tts.getLanguages) as List;
          final voices = (await _tts.getVoices) as List;
          for (final language in languages) {
            log('language: $language');
          }
          for (final voice in voices) {
            log('voice: $voice');
          }
        }

        await Future.wait([
          _tts.setVolume(_defaultVolume),
          _tts.setSpeechRate(_defaultRate),
          _tts.setPitch(_defaultPitch),
          _tts.awaitSpeakCompletion(true),
        ]);

        isInitialized = true;
      } catch (e) {
        log('Error initializing TTS Helper: $e');
        isInitialized = false;
      }
    }
  }

  Future<void> changeEngine(String engine) async {
    await _tts.setEngine(engine);
  }

  Future<void> changeLanguage(String languageCode) async {
    final languages = (await _tts.getLanguages) as List;
    final voices = (await _tts.getVoices) as List;

    var languageToSet = '';
    final voiceToSet = <String, String>{'name': '', 'locale': ''};

    for (final language in languages) {
      if (language is String) {
        if (language.contains(languageCode)) {
          if (languageCode == 'en') {
            if (language.contains('eng')
                || language.contains('US')
                || language.contains('GB')
            ) {
              languageToSet = language;
              break;
            }
          } else {
            languageToSet = language;
            break;
          }
        }
      }
    }
    for (final voice in voices) {
      if (voice is Map<Object?, Object?>) {
        if (Platform.isAndroid) {
          if (voice['name'] is String) {
            if (voice['name'].toString().contains(languageCode)) {
              if (languageCode == 'en') {
                if (voice['name'].toString().contains('US')
                    || voice['name'].toString().contains('GB')
                ) {
                  voiceToSet['name'] = voice['name'].toString();
                  voiceToSet['locale'] = voice['locale'].toString();
                  break;
                }
              } else {
                voiceToSet['name'] = voice['name'].toString();
                voiceToSet['locale'] = voice['locale'].toString();
                break;
              }
            }
          }
        } else if (Platform.isIOS) {
          if (voice['locale'] is String) {
            if (voice['locale'].toString().contains(languageCode)) {
              if (languageCode == 'en') {
                if (voice['locale'].toString().contains('US')
                    || voice['locale'].toString().contains('GB')
                ) {
                  voiceToSet['name'] = voice['name'].toString();
                  voiceToSet['locale'] = voice['locale'].toString();
                  if (voice['locale'].toString().contains('US')) {
                    voiceToSet['name'] = 'Samantha';
                  }
                  break;
                }
              } else {
                voiceToSet['name'] = voice['name'].toString();
                voiceToSet['locale'] = voice['locale'].toString();
                break;
              }
            }
          }
        }
      }
    }

    await Future.wait([
      _tts.setLanguage(languageToSet),
      _tts.setVoice(voiceToSet),
    ]);
  }

  Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      await _tts.speak(text);
    }
  }

  Future<void> stop() async {
    await _tts.stop();
  }

  Future<void> pause() async {
    await _tts.pause();
  }
}
