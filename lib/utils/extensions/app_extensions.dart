import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ObjectExtension<T> on T {
  R let<R>(R Function(T it) function) => function(this);

  bool isNull() => this == null;
  bool isNotNull() => this != null;

  bool isNotIn(List<T> list) {
    if (this == null) {
      return false;
    }
    return !list.contains(this);
  }

  bool isIn(List<T> list) {
    return list.contains(this);
  }
}
