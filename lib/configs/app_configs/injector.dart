import 'package:get_it/get_it.dart';
import 'package:one_one_learn/configs/app_configs/app_configs.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
import 'package:one_one_learn/core/network/network_manager.dart';
import 'package:one_one_learn/core/network/repositories/auth_repository.dart';
import 'package:one_one_learn/core/network/repositories/booking_repository.dart';
import 'package:one_one_learn/core/network/repositories/call_repository.dart';
import 'package:one_one_learn/core/network/repositories/feedback_repository.dart';
import 'package:one_one_learn/core/network/repositories/report_repository.dart';
import 'package:one_one_learn/core/network/repositories/tutor_repository.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';
import 'package:one_one_learn/core/network/repositories/course_repository.dart';
import 'package:one_one_learn/core/network/repositories/schedule_repository.dart';

final injector = GetIt.instance;

// initialize dependencies
// including shared preferences, repositories, managers, firebase, ads
Future<void> initializeDependencies() async {
  // init local manager (shared preferences)
  await LocalManager.init();
  injector..registerSingleton<LocalManager>(LocalManager.instance)

  // init app configs
  ..registerSingleton<AppConfig>(AppConfig.getInstance());

  // network
  initNetwork();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  // final remoteConfigManager = await RemoteConfigManager.init();
  // injector.registerSingleton(remoteConfigManager);
  //
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
    ..registerLazySingleton(ReportRepository.new);
}
