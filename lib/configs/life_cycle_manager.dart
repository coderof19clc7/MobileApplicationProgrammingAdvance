import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LifecycleManager extends StatefulWidget {
  const LifecycleManager({super.key, required this.child});

  final Widget child;

  @override
  State<LifecycleManager> createState() => _LifecycleManagerState();
}

class _LifecycleManagerState extends State<LifecycleManager> with WidgetsBindingObserver {
  var value = false;
  final _prefs = SharedPreferences.getInstance();
  static const platform = MethodChannel('pip/fullscreen');

  @override
  
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getSharedPrefValue();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('LifecycleState= $state');
    if (state == AppLifecycleState.paused) {
      //
    }

    if (state == AppLifecycleState.resumed) {
      //
      getSharedPrefValue();
    }
  }

  Future<bool> getBoolPreference() async {
    final prefs = await _prefs;
    var checkMeet = prefs.getBool('checkmeet');
    return checkMeet ??= false;
  }

  getSharedPrefValue() async {
    final stateValue = await getBoolPreference();
    setState(() {
      value = stateValue;
    });
    if (value) {
      await platform.invokeMethod('fullscreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
