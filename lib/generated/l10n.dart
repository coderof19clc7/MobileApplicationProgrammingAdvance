// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Improve yourself with great tutors!`
  String get introducingText {
    return Intl.message(
      'Improve yourself with great tutors!',
      name: 'introducingText',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginTitle {
    return Intl.message(
      'Login to your account',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get signUpTitle {
    return Intl.message(
      'Create your account',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email associated with your account to reset password.`
  String get resetPasswordRequirement {
    return Intl.message(
      'Enter the email associated with your account to reset password.',
      name: 'resetPasswordRequirement',
      desc: '',
      args: [],
    );
  }

  /// `from highest rating`
  String get sortRatingFromHighest {
    return Intl.message(
      'from highest rating',
      name: 'sortRatingFromHighest',
      desc: '',
      args: [],
    );
  }

  /// `from lowest rating`
  String get sortRatingFromLowest {
    return Intl.message(
      'from lowest rating',
      name: 'sortRatingFromLowest',
      desc: '',
      args: [],
    );
  }

  /// `from most favorited`
  String get sortFavoriteFromHighest {
    return Intl.message(
      'from most favorited',
      name: 'sortFavoriteFromHighest',
      desc: '',
      args: [],
    );
  }

  /// `from least favorited`
  String get sortFavoriteFromLowest {
    return Intl.message(
      'from least favorited',
      name: 'sortFavoriteFromLowest',
      desc: '',
      args: [],
    );
  }

  /// `Find a tutor`
  String get searchHintTutor {
    return Intl.message(
      'Find a tutor',
      name: 'searchHintTutor',
      desc: '',
      args: [],
    );
  }

  /// `all`
  String get all {
    return Intl.message(
      'all',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Your total lesson time is`
  String get labelTotalLessonTime {
    return Intl.message(
      'Your total lesson time is',
      name: 'labelTotalLessonTime',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes {
    return Intl.message(
      'minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Lesson History`
  String get lessonHistory {
    return Intl.message(
      'Lesson History',
      name: 'lessonHistory',
      desc: '',
      args: [],
    );
  }

  /// `Swipe left to cancel a class`
  String get swipeToCancelClass {
    return Intl.message(
      'Swipe left to cancel a class',
      name: 'swipeToCancelClass',
      desc: '',
      args: [],
    );
  }

  /// `Enter room`
  String get enterRoom {
    return Intl.message(
      'Enter room',
      name: 'enterRoom',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this class?`
  String get confirmCancelClass {
    return Intl.message(
      'Are you sure you want to cancel this class?',
      name: 'confirmCancelClass',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Find a course`
  String get searchHintCourse {
    return Intl.message(
      'Find a course',
      name: 'searchHintCourse',
      desc: '',
      args: [],
    );
  }

  /// `lesson`
  String get lesson {
    return Intl.message(
      'lesson',
      name: 'lesson',
      desc: '',
      args: [],
    );
  }

  /// `tutor`
  String get tutor {
    return Intl.message(
      'tutor',
      name: 'tutor',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get labelAbout {
    return Intl.message(
      'About',
      name: 'labelAbout',
      desc: '',
      args: [],
    );
  }

  /// `Topics`
  String get labelTopics {
    return Intl.message(
      'Topics',
      name: 'labelTopics',
      desc: '',
      args: [],
    );
  }

  /// `Why should you take this course?`
  String get labelWhyTakeCourse {
    return Intl.message(
      'Why should you take this course?',
      name: 'labelWhyTakeCourse',
      desc: '',
      args: [],
    );
  }

  /// `What will you be able to do?`
  String get labelWhatAbleDo {
    return Intl.message(
      'What will you be able to do?',
      name: 'labelWhatAbleDo',
      desc: '',
      args: [],
    );
  }

  /// `Marked`
  String get isMarked {
    return Intl.message(
      'Marked',
      name: 'isMarked',
      desc: '',
      args: [],
    );
  }

  /// `Not marked`
  String get isNotMarked {
    return Intl.message(
      'Not marked',
      name: 'isNotMarked',
      desc: '',
      args: [],
    );
  }

  /// `Book class`
  String get bookClass {
    return Intl.message(
      'Book class',
      name: 'bookClass',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Demo`
  String get demo {
    return Intl.message(
      'Demo',
      name: 'demo',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Interest`
  String get interest {
    return Intl.message(
      'Interest',
      name: 'interest',
      desc: '',
      args: [],
    );
  }

  /// `Specialties`
  String get specialties {
    return Intl.message(
      'Specialties',
      name: 'specialties',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
