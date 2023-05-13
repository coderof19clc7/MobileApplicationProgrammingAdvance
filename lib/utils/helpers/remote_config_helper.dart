import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:one_one_learn/configs/constants/firebase_constants.dart';

class RemoteConfigHelper {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;
  static RemoteConfigHelper? _instance;

  RemoteConfigHelper._();

  static Future<RemoteConfigHelper> init() async {
    if (_instance == null) {
      _instance = RemoteConfigHelper._();
      await _instance!._initConfig();
    }
    return _instance!;
  }

  Future<void> _initConfig() async {
    await Future.wait([
      _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 2),
      )),
      _remoteConfig.setDefaults(const {
        RemoteConfigConstants.gptApiKey: 'noneValidAvailableKey',
        RemoteConfigConstants.showSupportButton: false,
      }),
    ]);

    // await _fetchConfig();
  }

  // Fetching, caching, and activating remote config
  Future<void> _fetchConfig() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      await _remoteConfig.fetchAndActivate();
    }
  }

  Future<dynamic> _getValue(String key, int? type) async {
    // always try to fetch before getting the value
    await _fetchConfig();
    switch (type) {
      case 0:
        return _remoteConfig.getBool(key);
      case 1:
        return _remoteConfig.getInt(key);
      case 2:
        return _remoteConfig.getDouble(key);
      default:
        return _remoteConfig.getString(key);
    }
  }

  // Gets the value for a given key as a bool.
  Future<bool> getBool(String key) async {
    return await _getValue(key, 0) as bool;
  }

  // Gets the value for a given key as an int.
  Future<int> getInt(String key) async {
    return await _getValue(key, 1) as int;
  }

  // Gets the value for a given key as a double.
  Future<double> getDouble(String key) async {
    return await _getValue(key, 2) as double;
  }

  // Gets the value for a given key as a String.
  Future<String> getString(String key) async {
    return await _getValue(key, 3) as String;
  }
}
