import 'dart:async';

import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class DebounceHelper {
  static final Map<String, Timer> _debounceWaitTimers = {};
  static final Map<String, Timer> _debounceDisableTimers = {};
  static const Duration _defaultDuration = Duration(milliseconds: 1500);

  static void runWait(String identifier, {
    Duration? duration,
    void Function()? callback,
  }) {
    if (_debounceWaitTimers.containsKey(identifier)) {
      _debounceWaitTimers[identifier]?.cancel();
    }
    _debounceWaitTimers[identifier] = Timer(duration ?? _defaultDuration, () {
      callback?.call();
      _debounceWaitTimers.remove(identifier);
    });
  }

  static void runDisable(String identifier, {
    Duration? duration,
    void Function()? callback,
  }) {
    callback?.let((it) {
      if (!_debounceDisableTimers.containsKey(identifier)) {
        it.call();
        _debounceDisableTimers[identifier] = Timer(
          duration ?? _defaultDuration, () {
            _debounceDisableTimers.remove(identifier);
          },
        );
      }
    });
  }
}
