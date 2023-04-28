import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/upcoming_classes_screen.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> with AutomaticKeepAliveClientMixin<UpcomingTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const UpcomingClassesScreen();
  }

  @override
  bool get wantKeepAlive => true;
}
