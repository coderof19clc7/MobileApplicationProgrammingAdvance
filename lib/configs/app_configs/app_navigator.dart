import 'package:flutter/material.dart';

class AppNavigator{
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static NavigatorState? get state => navigatorKey.currentState;

  static final AppNavigator _instance = AppNavigator();
  static AppNavigator get instance => _instance;

  static Future? pushNamed(String route, [Object? arguments]) {
    return state?.pushNamed(route, arguments: arguments);
  }

  static Future? pushReplacementNamed(String route, [Object? arguments]) {
    return state?.pushReplacementNamed(route, arguments: arguments);
  }

  static Future<T?>? pushNamedAndRemoveUntil<T extends Object?> (
    String route,
    RoutePredicate predicate,
    {
      Object? arguments,
    }
  ) {
    return state?.pushNamedAndRemoveUntil<T>(route ,predicate, arguments: arguments);
  }

  static void pop<T extends Object?>([ T? result ]) {
    return state?.pop(result) ;
  }

  static  Future<bool>? mayPop() {
    return  state?.maybePop();
  }

  static void popUntil(String route) {
    return state?.popUntil(ModalRoute.withName(route));
  }
}