import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';

const String envPath = '.env';

class AppConfig{
  String get baseUrl => 'https://sandbox.api.lettutor.com';
  String get initialRoute => _initialRoute ?? '';
  String? _initialRoute;
  String appName = '1.1.Learn';
  int cacheDuration = 100;

  static AppConfig? _instance;

  AppConfig._init();

  static AppConfig getInstance() {
    _instance ??= AppConfig._init().._loadConfig();
    return _instance!;
  }

  void _loadConfig() {//initial route
    final tokens = injector<LocalManager>().getTokens();
    if (tokens != null) {
      _initialRoute = RouteNames.main;
    } else {
      _initialRoute = RouteNames.onBoarding;
      // initialRoute = MyRoutes.homeRoute;
    }
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    if (kDebugMode) {
      log('onCreate ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (kDebugMode) {
      log('onChange ${bloc.runtimeType} detail:\n$change');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    if (kDebugMode) {
      log('onError(${bloc.runtimeType}\nError: $error\nStackTrace: $stackTrace');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    if (kDebugMode) {
      log('onClose ${bloc.runtimeType}');
    }
  }
}
