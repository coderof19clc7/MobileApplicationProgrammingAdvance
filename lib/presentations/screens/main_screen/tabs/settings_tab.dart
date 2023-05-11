import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/settings/settings_screen.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> with AutomaticKeepAliveClientMixin<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const SettingsScreen();
  }

  @override
  bool get wantKeepAlive => true;
}
