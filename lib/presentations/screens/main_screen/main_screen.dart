import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/courses/courses_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/settings/settings_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/tutors/tutors_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/upcoming_classes/upcoming_classes_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentIndex = 0;

  final listScreens = const <Widget>[
    TutorsPage(),
    Center(child: Text('This is Chat screen')),
    UpcomingClassesPage(),
    CoursesPage(key: PageStorageKey('CoursesPage')),
    SettingsPage(),
  ];

  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listScreens.length,
        itemBuilder: (context, index) {
          return listScreens[index];
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;
          setState(() => currentIndex = index);
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
