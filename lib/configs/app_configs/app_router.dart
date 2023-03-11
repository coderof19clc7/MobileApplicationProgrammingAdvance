import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/presentations/screens/course_detail/course_detail_screen.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_screen.dart';
import 'package:one_one_learn/presentations/screens/forgot_password/forgot_password_screen.dart';
import 'package:one_one_learn/presentations/screens/lesson_history/lesson_history_screen.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/lesson_information_screen.dart';
import 'package:one_one_learn/presentations/screens/login/login_screen.dart';
import 'package:one_one_learn/presentations/screens/main_screen/main_screen.dart';
import 'package:one_one_learn/presentations/screens/on_boarding/on_boarding_screen.dart';
import 'package:one_one_learn/presentations/screens/sign_up/sign_up_screen.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/tutor_information_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.onBoarding:
        return PageTransition(
          child: const OnBoardingScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.login:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.signUp:
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.forgotPassword:
        return PageTransition(
          child: const ForgotPasswordScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.main:
        return PageTransition(
          child: const MainScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.tutors:
        return PageTransition(
          child: const MainScreen(), // navigate to main and change index of visible tab index to 0
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.tutorInformation:
        return PageTransition(
          child: const TutorInformationScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      // case RouteNames.tutorBooking:
      //   return PageTransition(
      //     child: const OnBoardingScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     alignment: Alignment.center,
      //   );
      case RouteNames.coursesList:
        return PageTransition(
          child: const MainScreen(), // navigate to main and change index of visible tab index to 3
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.courseInformation:
        return PageTransition(
          child: const CourseInformationScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.courseDetail:
        if (args != null && args is CourseDetailArguments) {
          return PageTransition(
            child: const OnBoardingScreen(),
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
          );
        }
        return _errRoute();
      case RouteNames.booksList:
        return PageTransition(
          child: const MainScreen(), // navigate to main and change index of visible tab index to 3 with index is 1
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.upcomingClasses:
        return PageTransition(
          child: const MainScreen(), // navigate to main and change index of visible tab index to 2
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.lessonHistory:
        return PageTransition(
          child: const LessonHistoryScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.lessonInformation:
        return PageTransition(
          child: const LessonInformationScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.settings:
        return PageTransition(
          child: const MainScreen(), // navigate to main and change index of visible tab index to 4
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      default:
        return _errRoute();
    }
  }

  static Route<dynamic> _errRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('No route')),
          body: const Center(
            child: Text(
              'Something went wrong when trying to load the page',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
