import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/courses_screen.dart';

class MainCoursesTab extends StatefulWidget {
  const MainCoursesTab({super.key});

  @override
  State<MainCoursesTab> createState() => _MainCoursesTabState();
}

class _MainCoursesTabState extends State<MainCoursesTab> with AutomaticKeepAliveClientMixin<MainCoursesTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const CoursesScreen();
  }

  @override
  bool get wantKeepAlive => true;
}
