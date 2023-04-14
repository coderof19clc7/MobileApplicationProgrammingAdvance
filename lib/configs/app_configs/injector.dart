import 'package:get_it/get_it.dart';
import 'package:one_one_learn/configs/app_configs/app_configs.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
import 'package:one_one_learn/core/network/network_manager.dart';
import 'package:one_one_learn/core/network/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    ..registerLazySingleton<AuthRepository>(AuthRepository.new);
}