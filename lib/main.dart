import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/app_configs/app_configs.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/presentations/app.dart';

Future<void> main() async {
  // initialize needed things
  WidgetsFlutterBinding.ensureInitialized();
  final data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
  await initializeDependencies();

  // set up bloc observer
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}
