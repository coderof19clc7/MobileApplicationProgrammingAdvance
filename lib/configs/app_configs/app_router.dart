import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/presentations/screens/assistant/assistant_screen.dart';
import 'package:one_one_learn/presentations/screens/booking/booking_screen.dart';
import 'package:one_one_learn/presentations/screens/course_detail/course_detail_screen.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_screen.dart';
import 'package:one_one_learn/presentations/screens/forgot_password/forgot_password_screen.dart';
import 'package:one_one_learn/presentations/screens/lesson_history/lesson_history_screen.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/lesson_information_screen.dart';
import 'package:one_one_learn/presentations/screens/login/login_screen.dart';
import 'package:one_one_learn/presentations/screens/main_screen/main_screen.dart';
import 'package:one_one_learn/presentations/screens/on_boarding/on_boarding_screen.dart';
import 'package:one_one_learn/presentations/screens/profile/profile_screen.dart';
import 'package:one_one_learn/presentations/screens/sign_up/sign_up_screen.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/tutor_information_screen.dart';
import 'package:one_one_learn/presentations/screens/video_call/video_call_screen.dart';
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
        if (args != null && args is TutorInformationArguments) {
          return PageTransition(
            child: TutorInformationScreen(args: args),
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
          );
        }
        return _errRoute();
      case RouteNames.tutorBooking:
        if (args != null && args is BookingArguments) {
          return PageTransition(
            child: BookingScreen(args: args),
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
          );
        }
        return _errRoute();
      case RouteNames.coursesList:
        return PageTransition(
          child: const MainScreen(), // navigate to main and change index of visible tab index to 3
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.courseInformation:
        if (args != null && args is CourseInformationArguments) {
          return PageTransition(
            child: CourseInformationScreen(args: args),
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
          );
        }
        return _errRoute();
      case RouteNames.courseDetail:
        if (args != null && args is CourseDetailArguments) {
          return PageTransition(
            child: CourseDetailScreen(args: args),
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
          child: const MainScreen(), // navigate to main and change index of visible tab index to 1
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
        if (args != null && args is LessonInformationArgs) {
          return PageTransition(
            child: LessonInformationScreen(args: args),
            type: PageTransitionType.rightToLeft,
            alignment: Alignment.center,
          );
        }
        return _errRoute();
      case RouteNames.settings:
        return PageTransition(
          child: const MainScreen(), // navigate to main and change index of visible tab index to 4
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.profile:
        return PageTransition(
          child: const ProfileScreen(), // navigate to main and change index of visible tab index to 4 with index is 1
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.videoCall:
        return PageTransition(
          child: const VideoCallScreen(),
          type: PageTransitionType.rightToLeft,
          alignment: Alignment.center,
        );
      case RouteNames.assistant:
        return PageTransition(
          child: const AssistantScreen(),
          type: PageTransitionType.bottomToTop,
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
