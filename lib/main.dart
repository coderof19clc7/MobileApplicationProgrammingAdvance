import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:one_one_learn/configs/app_configs/app_router.dart';
import 'package:one_one_learn/configs/app_configs/stylings/app_themes.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/course_information_screen/course_information_screen.dart';
import 'package:one_one_learn/presentations/screens/courses_screen/courses_screen.dart';
import 'package:one_one_learn/presentations/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:one_one_learn/presentations/screens/lesson_history_screen/lesson_history_screen.dart';
import 'package:one_one_learn/presentations/screens/lesson_history_screen/widgets/lesson_history_card.dart';
import 'package:one_one_learn/presentations/screens/lesson_information_screen/lesson_information_screen.dart';
import 'package:one_one_learn/presentations/screens/login_screen/login_screen.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/profile/profile_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/setting/setting_page.dart';
import 'package:one_one_learn/presentations/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:one_one_learn/presentations/screens/sign_up_screen/sign_up_screen.dart';
import 'package:one_one_learn/presentations/screens/tutor_information_screen/tutor_information_screen.dart';
import 'package:one_one_learn/presentations/screens/tutors_screen/tutors_screen.dart';
import 'package:one_one_learn/presentations/screens/upcoming_classes_screen/upcoming_classes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const ProfilePage(),
    );
  }
}
