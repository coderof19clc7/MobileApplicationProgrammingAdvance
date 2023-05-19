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

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `From A to Z`
  String get sortNameFromAtoZ {
    return Intl.message(
      'From A to Z',
      name: 'sortNameFromAtoZ',
      desc: '',
      args: [],
    );
  }

  /// `From high {somethings}`
  String sortSomethingsFromHigh(String somethings) {
    return Intl.message(
      'From high $somethings',
      name: 'sortSomethingsFromHigh',
      desc: 'A description for option sort something from highest',
      args: [somethings],
    );
  }

  /// `From low {somethings}`
  String sortSomethingsFromLow(String somethings) {
    return Intl.message(
      'From low $somethings',
      name: 'sortSomethingsFromLow',
      desc: 'A description for option sort something from lowest',
      args: [somethings],
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

  /// `All`
  String get all {
    return Intl.message(
      'All',
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

  /// `You have not learned any lesson yet`
  String get haveNotLearnAnyLesson {
    return Intl.message(
      'You have not learned any lesson yet',
      name: 'haveNotLearnAnyLesson',
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

  /// `Use "Cancel" button to cancel a class.\nThis button only appears if the class's start time is far more than 2 hours`
  String get cancelClassHint {
    return Intl.message(
      'Use "Cancel" button to cancel a class.\nThis button only appears if the class\'s start time is far more than 2 hours',
      name: 'cancelClassHint',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get enterRoom {
    return Intl.message(
      'Join',
      name: 'enterRoom',
      desc: '',
      args: [],
    );
  }

  /// `Expand`
  String get expand {
    return Intl.message(
      'Expand',
      name: 'expand',
      desc: '',
      args: [],
    );
  }

  /// `Collapse`
  String get collapse {
    return Intl.message(
      'Collapse',
      name: 'collapse',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
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

  /// `Tutor`
  String get tutor {
    return Intl.message(
      'Tutor',
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

  /// `Book class`
  String get bookClass {
    return Intl.message(
      'Book class',
      name: 'bookClass',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get bookSchedule {
    return Intl.message(
      'Book',
      name: 'bookSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Booked`
  String get booked {
    return Intl.message(
      'Booked',
      name: 'booked',
      desc: '',
      args: [],
    );
  }

  /// `Reserved`
  String get reserved {
    return Intl.message(
      'Reserved',
      name: 'reserved',
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

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Suggested courses`
  String get suggestedCourses {
    return Intl.message(
      'Suggested courses',
      name: 'suggestedCourses',
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

  /// `Your upcoming class is`
  String get labelUpcomingClass {
    return Intl.message(
      'Your upcoming class is',
      name: 'labelUpcomingClass',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Sorting`
  String get sorting {
    return Intl.message(
      'Sorting',
      name: 'sorting',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Request for class`
  String get requestForClass {
    return Intl.message(
      'Request for class',
      name: 'requestForClass',
      desc: '',
      args: [],
    );
  }

  /// `Your review`
  String get yourReview {
    return Intl.message(
      'Your review',
      name: 'yourReview',
      desc: '',
      args: [],
    );
  }

  /// `{n} reviews`
  String nReviews(int n) {
    return Intl.message(
      '$n reviews',
      name: 'nReviews',
      desc: 'A description for number of reviews',
      args: [n],
    );
  }

  /// `Haven't reviewed`
  String get haveNotReviewed {
    return Intl.message(
      'Haven\'t reviewed',
      name: 'haveNotReviewed',
      desc: '',
      args: [],
    );
  }

  /// `Tutor's review`
  String get tutorReview {
    return Intl.message(
      'Tutor\'s review',
      name: 'tutorReview',
      desc: '',
      args: [],
    );
  }

  /// `Reviewed`
  String get isReviewed {
    return Intl.message(
      'Reviewed',
      name: 'isReviewed',
      desc: '',
      args: [],
    );
  }

  /// `Not reviewed`
  String get isNotReviewed {
    return Intl.message(
      'Not reviewed',
      name: 'isNotReviewed',
      desc: '',
      args: [],
    );
  }

  /// `Lesson status`
  String get lessonStatus {
    return Intl.message(
      'Lesson status',
      name: 'lessonStatus',
      desc: '',
      args: [],
    );
  }

  /// `Behavior`
  String get behavior {
    return Intl.message(
      'Behavior',
      name: 'behavior',
      desc: '',
      args: [],
    );
  }

  /// `Listening`
  String get listening {
    return Intl.message(
      'Listening',
      name: 'listening',
      desc: '',
      args: [],
    );
  }

  /// `Speaking`
  String get speaking {
    return Intl.message(
      'Speaking',
      name: 'speaking',
      desc: '',
      args: [],
    );
  }

  /// `Vocabulary`
  String get vocabulary {
    return Intl.message(
      'Vocabulary',
      name: 'vocabulary',
      desc: '',
      args: [],
    );
  }

  /// `Overall comment`
  String get overallComment {
    return Intl.message(
      'Overall comment',
      name: 'overallComment',
      desc: '',
      args: [],
    );
  }

  /// `Homework`
  String get homework {
    return Intl.message(
      'Homework',
      name: 'homework',
      desc: '',
      args: [],
    );
  }

  /// `Learned book`
  String get learnedBook {
    return Intl.message(
      'Learned book',
      name: 'learnedBook',
      desc: '',
      args: [],
    );
  }

  /// `No comment`
  String get noReviewGiven {
    return Intl.message(
      'No comment',
      name: 'noReviewGiven',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Learning interests`
  String get learningInterests {
    return Intl.message(
      'Learning interests',
      name: 'learningInterests',
      desc: '',
      args: [],
    );
  }

  /// `Skill level`
  String get skillLevel {
    return Intl.message(
      'Skill level',
      name: 'skillLevel',
      desc: '',
      args: [],
    );
  }

  /// `Preferred schedule`
  String get preferredSchedule {
    return Intl.message(
      'Preferred schedule',
      name: 'preferredSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Note the time of the week you want to sturdy`
  String get preferredScheduleHint {
    return Intl.message(
      'Note the time of the week you want to sturdy',
      name: 'preferredScheduleHint',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Tutoring`
  String get tutoring {
    return Intl.message(
      'Tutoring',
      name: 'tutoring',
      desc: '',
      args: [],
    );
  }

  /// `Become a tutor`
  String get becomeATutor {
    return Intl.message(
      'Become a tutor',
      name: 'becomeATutor',
      desc: '',
      args: [],
    );
  }

  /// `App`
  String get app {
    return Intl.message(
      'App',
      name: 'app',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Suggested tutors`
  String get suggestedTutors {
    return Intl.message(
      'Suggested tutors',
      name: 'suggestedTutors',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `in`
  String get upcomingIn {
    return Intl.message(
      'in',
      name: 'upcomingIn',
      desc: '',
      args: [],
    );
  }

  /// `going on for`
  String get sessionProgressIn {
    return Intl.message(
      'going on for',
      name: 'sessionProgressIn',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please login again.`
  String get refreshTokenError {
    return Intl.message(
      'Your session has expired. Please login again.',
      name: 'refreshTokenError',
      desc: '',
      args: [],
    );
  }

  /// `{somethings} is required`
  String somethingRequiredError(String somethings) {
    return Intl.message(
      '$somethings is required',
      name: 'somethingRequiredError',
      desc: 'An error message appear when user miss an required field',
      args: [somethings],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password does not match`
  String get confirmPasswordNotMatch {
    return Intl.message(
      'Confirm password does not match',
      name: 'confirmPasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get passwordRule {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'passwordRule',
      desc: '',
      args: [],
    );
  }

  /// `Invalid`
  String get invalid {
    return Intl.message(
      'Invalid',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `{somethings} successfully`
  String doSomethingsSuccess(String somethings) {
    return Intl.message(
      '$somethings successfully',
      name: 'doSomethingsSuccess',
      desc: 'A message appear when user do something successfully',
      args: [somethings],
    );
  }

  /// `{somethings} failed`
  String doSomethingsFailed(String somethings) {
    return Intl.message(
      '$somethings failed',
      name: 'doSomethingsFailed',
      desc: 'A message appear when user do something failed',
      args: [somethings],
    );
  }

  /// `Server`
  String get server {
    return Intl.message(
      'Server',
      name: 'server',
      desc: '',
      args: [],
    );
  }

  /// `Cannot verify login session. Please try again later.`
  String get loginFailedWithNoTokens {
    return Intl.message(
      'Cannot verify login session. Please try again later.',
      name: 'loginFailedWithNoTokens',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is incorrect`
  String get loginFailedWithWrongCredentials {
    return Intl.message(
      'Email or password is incorrect',
      name: 'loginFailedWithWrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Account activation notify`
  String get needActivateHeader {
    return Intl.message(
      'Account activation notify',
      name: 'needActivateHeader',
      desc: '',
      args: [],
    );
  }

  /// `Your account is not activated.\nPlease check your email to activate it.`
  String get needActivateContent {
    return Intl.message(
      'Your account is not activated.\nPlease check your email to activate it.',
      name: 'needActivateContent',
      desc: '',
      args: [],
    );
  }

  /// `Email is already taken`
  String get signUpFailedWithEmailTaken {
    return Intl.message(
      'Email is already taken',
      name: 'signUpFailedWithEmailTaken',
      desc: '',
      args: [],
    );
  }

  /// `Send reset password request`
  String get sendResetPasswordRequest {
    return Intl.message(
      'Send reset password request',
      name: 'sendResetPasswordRequest',
      desc: '',
      args: [],
    );
  }

  /// `Email does not exist`
  String get forgotPasswordFailedWithEmailNotExists {
    return Intl.message(
      'Email does not exist',
      name: 'forgotPasswordFailedWithEmailNotExists',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email to reset your password.\nIf you didn't receive any mail, please ensure that the email you entered is correct and check your spam folder or wait for 1 to 2 minutes and then send a new request.`
  String get resetPasswordRequestSendSucceededContent {
    return Intl.message(
      'Please check your email to reset your password.\nIf you didn\'t receive any mail, please ensure that the email you entered is correct and check your spam folder or wait for 1 to 2 minutes and then send a new request.',
      name: 'resetPasswordRequestSendSucceededContent',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `English for kids`
  String get englishForKids {
    return Intl.message(
      'English for kids',
      name: 'englishForKids',
      desc: '',
      args: [],
    );
  }

  /// `English for business`
  String get businessEnglish {
    return Intl.message(
      'English for business',
      name: 'businessEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Conversational English`
  String get conversationalEnglish {
    return Intl.message(
      'Conversational English',
      name: 'conversationalEnglish',
      desc: '',
      args: [],
    );
  }

  /// `English for traveling`
  String get englishForTraveling {
    return Intl.message(
      'English for traveling',
      name: 'englishForTraveling',
      desc: '',
      args: [],
    );
  }

  /// `English for beginners`
  String get englishForBeginners {
    return Intl.message(
      'English for beginners',
      name: 'englishForBeginners',
      desc: '',
      args: [],
    );
  }

  /// `For studying aboard`
  String get forStudyingAboard {
    return Intl.message(
      'For studying aboard',
      name: 'forStudyingAboard',
      desc: '',
      args: [],
    );
  }

  /// `STARTERS`
  String get starters {
    return Intl.message(
      'STARTERS',
      name: 'starters',
      desc: '',
      args: [],
    );
  }

  /// `MOVERS`
  String get movers {
    return Intl.message(
      'MOVERS',
      name: 'movers',
      desc: '',
      args: [],
    );
  }

  /// `FLYERS`
  String get flyers {
    return Intl.message(
      'FLYERS',
      name: 'flyers',
      desc: '',
      args: [],
    );
  }

  /// `KET`
  String get ket {
    return Intl.message(
      'KET',
      name: 'ket',
      desc: '',
      args: [],
    );
  }

  /// `PET`
  String get pet {
    return Intl.message(
      'PET',
      name: 'pet',
      desc: '',
      args: [],
    );
  }

  /// `IELTS`
  String get ielts {
    return Intl.message(
      'IELTS',
      name: 'ielts',
      desc: '',
      args: [],
    );
  }

  /// `TOEFL`
  String get toefl {
    return Intl.message(
      'TOEFL',
      name: 'toefl',
      desc: '',
      args: [],
    );
  }

  /// `TOEIC`
  String get toeic {
    return Intl.message(
      'TOEIC',
      name: 'toeic',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Foreign`
  String get foreign {
    return Intl.message(
      'Foreign',
      name: 'foreign',
      desc: '',
      args: [],
    );
  }

  /// `Native English`
  String get nativeEnglish {
    return Intl.message(
      'Native English',
      name: 'nativeEnglish',
      desc: '',
      args: [],
    );
  }

  /// `{nationality} tutor`
  String tutorWithNationality(String nationality) {
    return Intl.message(
      '$nationality tutor',
      name: 'tutorWithNationality',
      desc: 'Tutor with nationality label',
      args: [nationality],
    );
  }

  /// `Unknown {somethings}`
  String unknownSomethings(String somethings) {
    return Intl.message(
      'Unknown $somethings',
      name: 'unknownSomethings',
      desc: 'Somethings that does not known',
      args: [somethings],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Video not available`
  String get videoNotAvailable {
    return Intl.message(
      'Video not available',
      name: 'videoNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No suggested {somethings}`
  String noHaveSomethingsSuggested(String somethings) {
    return Intl.message(
      'No suggested $somethings',
      name: 'noHaveSomethingsSuggested',
      desc: 'No suggested somethings',
      args: [somethings],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get booking {
    return Intl.message(
      'Booking',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `Booking detail`
  String get bookingDetail {
    return Intl.message(
      'Booking detail',
      name: 'bookingDetail',
      desc: '',
      args: [],
    );
  }

  /// `Booking time`
  String get bookingTime {
    return Intl.message(
      'Booking time',
      name: 'bookingTime',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Session`
  String get classSession {
    return Intl.message(
      'Session',
      name: 'classSession',
      desc: '',
      args: [],
    );
  }

  /// `You have {n} session left`
  String youHaveNSessionLeft(int n) {
    return Intl.message(
      'You have $n session left',
      name: 'youHaveNSessionLeft',
      desc: 'You have n session left',
      args: [n],
    );
  }

  /// `Schedule of tutor {tutor}`
  String scheduleOfTutorA(String tutor) {
    return Intl.message(
      'Schedule of tutor $tutor',
      name: 'scheduleOfTutorA',
      desc: 'Schedule of tutor',
      args: [tutor],
    );
  }

  /// `Help us understand what is happening`
  String get reportTutorRequirement {
    return Intl.message(
      'Help us understand what is happening',
      name: 'reportTutorRequirement',
      desc: '',
      args: [],
    );
  }

  /// `Other issues`
  String get otherIssues {
    return Intl.message(
      'Other issues',
      name: 'otherIssues',
      desc: '',
      args: [],
    );
  }

  /// `This tutor is annoying me`
  String get tutorAnnoyingIssue {
    return Intl.message(
      'This tutor is annoying me',
      name: 'tutorAnnoyingIssue',
      desc: '',
      args: [],
    );
  }

  /// `This profile is pretending be someone or is fake`
  String get tutorFakeProfileIssue {
    return Intl.message(
      'This profile is pretending be someone or is fake',
      name: 'tutorFakeProfileIssue',
      desc: '',
      args: [],
    );
  }

  /// `Inappropriate profile photo`
  String get tutorPhotoInappropriateIssue {
    return Intl.message(
      'Inappropriate profile photo',
      name: 'tutorPhotoInappropriateIssue',
      desc: '',
      args: [],
    );
  }

  /// `No request`
  String get noRequest {
    return Intl.message(
      'No request',
      name: 'noRequest',
      desc: '',
      args: [],
    );
  }

  /// `Session`
  String get session {
    return Intl.message(
      'Session',
      name: 'session',
      desc: '',
      args: [],
    );
  }

  /// `Assistant`
  String get assistant {
    return Intl.message(
      'Assistant',
      name: 'assistant',
      desc: '',
      args: [],
    );
  }

  /// `Type your question here`
  String get assistantInputHint {
    return Intl.message(
      'Type your question here',
      name: 'assistantInputHint',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any upcoming session`
  String get noUpcomingSession {
    return Intl.message(
      'You don\'t have any upcoming session',
      name: 'noUpcomingSession',
      desc: '',
      args: [],
    );
  }

  /// `Waiting time`
  String get waitingTime {
    return Intl.message(
      'Waiting time',
      name: 'waitingTime',
      desc: '',
      args: [],
    );
  }

  /// `Open meeting`
  String get openMeeting {
    return Intl.message(
      'Open meeting',
      name: 'openMeeting',
      desc: '',
      args: [],
    );
  }

  /// `{somethings} cannot be empty`
  String cannotEmpty(Object somethings) {
    return Intl.message(
      '$somethings cannot be empty',
      name: 'cannotEmpty',
      desc: '',
      args: [somethings],
    );
  }

  /// `Lesson time`
  String get lessonTime {
    return Intl.message(
      'Lesson time',
      name: 'lessonTime',
      desc: '',
      args: [],
    );
  }

  /// `What was the reason you cancel this booking?`
  String get reasonCancelQuestion {
    return Intl.message(
      'What was the reason you cancel this booking?',
      name: 'reasonCancelQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule at another time`
  String get reasonCancel1 {
    return Intl.message(
      'Reschedule at another time',
      name: 'reasonCancel1',
      desc: '',
      args: [],
    );
  }

  /// `Busy at that time`
  String get reasonCancel2 {
    return Intl.message(
      'Busy at that time',
      name: 'reasonCancel2',
      desc: '',
      args: [],
    );
  }

  /// `Asked by tutor`
  String get reasonCancel3 {
    return Intl.message(
      'Asked by tutor',
      name: 'reasonCancel3',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Tutor was late`
  String get reportSchedule1 {
    return Intl.message(
      'Tutor was late',
      name: 'reportSchedule1',
      desc: '',
      args: [],
    );
  }

  /// `Tutor was absent`
  String get reportSchedule2 {
    return Intl.message(
      'Tutor was absent',
      name: 'reportSchedule2',
      desc: '',
      args: [],
    );
  }

  /// `Network unstable`
  String get networkUnstable {
    return Intl.message(
      'Network unstable',
      name: 'networkUnstable',
      desc: '',
      args: [],
    );
  }

  /// `What was the reason you report this lesson?`
  String get reasonReportQuestion {
    return Intl.message(
      'What was the reason you report this lesson?',
      name: 'reasonReportQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Search for a country`
  String get searchHintCountry {
    return Intl.message(
      'Search for a country',
      name: 'searchHintCountry',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Update profile`
  String get updateProfile {
    return Intl.message(
      'Update profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Upload avatar`
  String get uploadAvatar {
    return Intl.message(
      'Upload avatar',
      name: 'uploadAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Upload user's information`
  String get uploadUserInfo {
    return Intl.message(
      'Upload user\'s information',
      name: 'uploadUserInfo',
      desc: '',
      args: [],
    );
  }

  /// `Please input {somethings}`
  String pleaseInputSomethings(String somethings) {
    return Intl.message(
      'Please input $somethings',
      name: 'pleaseInputSomethings',
      desc: 'A message to notify user to input some required field',
      args: [somethings],
    );
  }

  /// `Please choose at least 1 option`
  String get wantToStudyRequired {
    return Intl.message(
      'Please choose at least 1 option',
      name: 'wantToStudyRequired',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `If you choose "System", the application will follow the system theme mode on the device`
  String get systemThemeModeNote {
    return Intl.message(
      'If you choose "System", the application will follow the system theme mode on the device',
      name: 'systemThemeModeNote',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishLanguage {
    return Intl.message(
      'English',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnameseLanguage {
    return Intl.message(
      'Vietnamese',
      name: 'vietnameseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Not found any {somethings}`
  String notFoundSomethings(String somethings) {
    return Intl.message(
      'Not found any $somethings',
      name: 'notFoundSomethings',
      desc: 'Not found somethings',
      args: [somethings],
    );
  }

  /// `No review for this tutor yet`
  String get noReviewForTutor {
    return Intl.message(
      'No review for this tutor yet',
      name: 'noReviewForTutor',
      desc: '',
      args: [],
    );
  }

  /// `item`
  String get item {
    return Intl.message(
      'item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `Denied`
  String get denied {
    return Intl.message(
      'Denied',
      name: 'denied',
      desc: '',
      args: [],
    );
  }

  /// `Open settings`
  String get openSettings {
    return Intl.message(
      'Open settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Permission(s) need to be granted in settings`
  String get permissionNeedOpenSettingsDialogTitle {
    return Intl.message(
      'Permission(s) need to be granted in settings',
      name: 'permissionNeedOpenSettingsDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Application wants to access {somethings}.\nWould you like to open settings to grant?`
  String permissionNeedOpenSettingsDialogContent(String somethings) {
    return Intl.message(
      'Application wants to access $somethings.\nWould you like to open settings to grant?',
      name: 'permissionNeedOpenSettingsDialogContent',
      desc: 'Permission need to be granted in settings dialog content',
      args: [somethings],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Microphone`
  String get microphone {
    return Intl.message(
      'Microphone',
      name: 'microphone',
      desc: '',
      args: [],
    );
  }

  /// `Voice recognition`
  String get voiceRecognition {
    return Intl.message(
      'Voice recognition',
      name: 'voiceRecognition',
      desc: '',
      args: [],
    );
  }

  /// `Can not start "Speech to text" feature.\n`
  String get sttInitializationFailed {
    return Intl.message(
      'Can not start "Speech to text" feature.\n',
      name: 'sttInitializationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please ensure that microphone permission is granted.`
  String get sttInitializationFailedMessageAndroid {
    return Intl.message(
      'Please ensure that microphone permission is granted.',
      name: 'sttInitializationFailedMessageAndroid',
      desc: '',
      args: [],
    );
  }

  /// `Please ensure that microphone and vocie recognition permission are granted.`
  String get sttInitializationFailedMessageIos {
    return Intl.message(
      'Please ensure that microphone and vocie recognition permission are granted.',
      name: 'sttInitializationFailedMessageIos',
      desc: '',
      args: [],
    );
  }

  /// `Send failed`
  String get sendErrorTitle {
    return Intl.message(
      'Send failed',
      name: 'sendErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Do you want to send again?`
  String get notApiKeySendError {
    return Intl.message(
      'An error occurred. Do you want to send again?',
      name: 'notApiKeySendError',
      desc: '',
      args: [],
    );
  }

  /// `There is no valid API key available on cloudat the moment.\nPlease wait until there is a new valid api key available on cloud or you can provide your own api key at "Settings" > "Assistant".`
  String get apiKeySendError {
    return Intl.message(
      'There is no valid API key available on cloudat the moment.\nPlease wait until there is a new valid api key available on cloud or you can provide your own api key at "Settings" > "Assistant".',
      name: 'apiKeySendError',
      desc: '',
      args: [],
    );
  }

  /// `Your private api key is not valid anymore.\nPlease provide a new one at "Settings" > "Assistant" or you can try using our public api key.`
  String get priApiKeySendError {
    return Intl.message(
      'Your private api key is not valid anymore.\nPlease provide a new one at "Settings" > "Assistant" or you can try using our public api key.',
      name: 'priApiKeySendError',
      desc: '',
      args: [],
    );
  }

  /// `Private api key`
  String get privateApiKey {
    return Intl.message(
      'Private api key',
      name: 'privateApiKey',
      desc: '',
      args: [],
    );
  }

  /// `Your api key`
  String get yourApiKey {
    return Intl.message(
      'Your api key',
      name: 'yourApiKey',
      desc: '',
      args: [],
    );
  }

  /// `Active key`
  String get activeKey {
    return Intl.message(
      'Active key',
      name: 'activeKey',
      desc: '',
      args: [],
    );
  }

  /// `Use public api key`
  String get usePublicApiKey {
    return Intl.message(
      'Use public api key',
      name: 'usePublicApiKey',
      desc: '',
      args: [],
    );
  }

  /// `Using public api key`
  String get usingPublicApiKey {
    return Intl.message(
      'Using public api key',
      name: 'usingPublicApiKey',
      desc: '',
      args: [],
    );
  }

  /// `Auto play new message`
  String get autoPlayNewMessage {
    return Intl.message(
      'Auto play new message',
      name: 'autoPlayNewMessage',
      desc: '',
      args: [],
    );
  }

  /// `On`
  String get on {
    return Intl.message(
      'On',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get off {
    return Intl.message(
      'Off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `The private api key will only be used on this device. This will help your experience with "Assistant" feature better.`
  String get privateApiKeyNote {
    return Intl.message(
      'The private api key will only be used on this device. This will help your experience with "Assistant" feature better.',
      name: 'privateApiKeyNote',
      desc: '',
      args: [],
    );
  }

  /// `What is your rating for {tutor}?`
  String ratingScheduleDialogQuestion(String tutor) {
    return Intl.message(
      'What is your rating for $tutor?',
      name: 'ratingScheduleDialogQuestion',
      desc: 'Rating schedule dialog question',
      args: [tutor],
    );
  }

  /// `Content`
  String get content {
    return Intl.message(
      'Content',
      name: 'content',
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
