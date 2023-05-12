import 'dart:convert';

import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/core/models/responses/auth/tokens.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalManager {
  static final LocalManager _instance = LocalManager._init();

  SharedPreferences? _preferences;

  static LocalManager get instance => _instance;

  LocalManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future init() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearKey(String key) async {
    await _preferences!.remove(key);
  }

  Future<void> clearDataLocalLogout() async {
    await Future.wait([
      clearKey(LocalConstants.accessToken),
      clearKey(LocalConstants.refreshToken),
      clearKey(LocalConstants.userInfo),
      clearKey(LocalConstants.chatBotMessageHistory),
    ]);
  }

  Future<bool> setString(String key, String value) async {
    return _preferences!.setString(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return _preferences!.setStringList(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return _preferences!.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return _preferences!.setDouble(key, value);
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(String key, bool value) async {
    return _preferences!.setBool(key, value);
  }

  Future<bool> setJson(String key, Map<String, dynamic> jsonValue) async {
    return _preferences!.setString(key, jsonEncode(jsonValue));
  }

  String? getString(String key) => _preferences?.getString(key);

  List<String>? getStringList(String key) => _preferences?.getStringList(key);

  int? getInt(String key) => _preferences?.getInt(key);

  double? getDouble(String key) => _preferences?.getDouble(key);

  bool? getBool(String key) => _preferences!.getBool(key);

  Map<String, dynamic>? getJson(String key) {
    final jsonString = getString(key);
    if (jsonString?.isNotEmpty == true) {
      return jsonDecode(jsonString!) as Map<String, dynamic>;
    }
    return null;
  }

  Future<bool> saveTokens(Tokens tokens) async {
    return setJson(LocalConstants.tokens, tokens.toJson());
  }
  Tokens? getTokens() {
    final json = getJson(LocalConstants.tokens);
    if (json?.isNotEmpty == true) {
      return Tokens.fromJson(json);
    }
    return null;
  }

  Future<bool> saveUserInfo(UserInfo userInfo) async {
    return setJson(LocalConstants.userInfo, userInfo.toJson());
  }
  UserInfo? getUserInfo() {
    final json = getJson(LocalConstants.userInfo);
    if (json?.isNotEmpty == true) {
      return UserInfo.fromJson(json);
    }
    return null;
  }

  bool hasLogin() {
    final json = getJson(LocalConstants.tokens);
    return json?.isNotEmpty ?? false;
  }

  bool hasKey(String key) {
    return _preferences!.containsKey(key);
  }
}
