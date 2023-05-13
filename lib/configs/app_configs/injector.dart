import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:one_one_learn/configs/app_configs/app_configs.dart';
import 'package:one_one_learn/configs/firebase_configs/firebase_options.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
import 'package:one_one_learn/core/network/network_manager.dart';
import 'package:one_one_learn/core/network/repositories/auth_repository.dart';
import 'package:one_one_learn/core/network/repositories/booking_repository.dart';
import 'package:one_one_learn/core/network/repositories/call_repository.dart';
import 'package:one_one_learn/core/network/repositories/feedback_repository.dart';
import 'package:one_one_learn/core/network/repositories/lesson_report_repository.dart';
import 'package:one_one_learn/core/network/repositories/report_repository.dart';
import 'package:one_one_learn/core/network/repositories/tutor_repository.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';
import 'package:one_one_learn/core/network/repositories/course_repository.dart';
import 'package:one_one_learn/core/network/repositories/schedule_repository.dart';
import 'package:one_one_learn/utils/helpers/remote_config_helper.dart';

final injector = GetIt.instance;

// initialize dependencies
// including shared preferences, repositories, managers, firebase, ads
Future<void> initializeDependencies() async {
  // init local manager (shared preferences) and firebase
  await Future.wait([LocalManager.init(), initFirebase()]);
  injector..registerSingleton<LocalManager>(LocalManager.instance)

  // init app configs
  ..registerSingleton<AppConfig>(AppConfig.getInstance());

  // network
  initNetwork();

  // MobileAds.instance.initialize();
}

void initNetwork() {
  injector
    ..registerSingleton<NetworkManager>(NetworkManager())
    ..registerLazySingleton<AuthRepository>(AuthRepository.new)
    ..registerLazySingleton<UserRepository>(UserRepository.new)
    ..registerLazySingleton<TutorRepository>(TutorRepository.new)
    ..registerLazySingleton<ScheduleRepository>(ScheduleRepository.new)
    ..registerLazySingleton<CourseRepository>(CourseRepository.new)
    ..registerLazySingleton<BookingRepository>(BookingRepository.new)
    ..registerLazySingleton<CallRepository>(CallRepository.new)
    ..registerLazySingleton<FeedbackRepository>(FeedbackRepository.new)
    ..registerLazySingleton<ReportRepository>(ReportRepository.new)
    ..registerLazySingleton<LessonReportRepository>(LessonReportRepository.new);
}

Future<void> initFirebase() async {
  // base firebase init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // remote config
  final remoteConfigManager = await RemoteConfigHelper.init();
  injector..registerSingleton<RemoteConfigHelper>(remoteConfigManager)

  // analytics
  ..registerSingleton<FirebaseAnalytics>(FirebaseAnalytics.instance);

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}
