// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(somethings) => "${somethings} cannot be empty";

  static String m1(somethings) => "${somethings} failed";

  static String m2(somethings) => "${somethings} successfully";

  static String m3(somethings) => "No suggested ${somethings}";

  static String m4(somethings) => "Not found any ${somethings}";

  static String m5(somethings) =>
      "Application wants to access ${somethings}.\nWould you like to open settings to grant?";

  static String m6(somethings) => "Please input ${somethings}";

  static String m7(tutor) => "Schedule of tutor ${tutor}";

  static String m8(somethings) => "${somethings} is required";

  static String m9(somethings) => "From high ${somethings}";

  static String m10(somethings) => "From low ${somethings}";

  static String m11(nationality) => "${nationality} tutor";

  static String m12(somethings) => "Unknown ${somethings}";

  static String m13(n) => "You have ${n} session left";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "app": MessageLookupByLibrary.simpleMessage("App"),
        "assistant": MessageLookupByLibrary.simpleMessage("Assistant"),
        "assistantInputHint":
            MessageLookupByLibrary.simpleMessage("Type your question here"),
        "balance": MessageLookupByLibrary.simpleMessage("Balance"),
        "becomeATutor": MessageLookupByLibrary.simpleMessage("Become a tutor"),
        "behavior": MessageLookupByLibrary.simpleMessage("Behavior"),
        "bookClass": MessageLookupByLibrary.simpleMessage("Book class"),
        "bookSchedule": MessageLookupByLibrary.simpleMessage("Book"),
        "booked": MessageLookupByLibrary.simpleMessage("Booked"),
        "booking": MessageLookupByLibrary.simpleMessage("Booking"),
        "bookingDetail": MessageLookupByLibrary.simpleMessage("Booking detail"),
        "bookingTime": MessageLookupByLibrary.simpleMessage("Booking time"),
        "books": MessageLookupByLibrary.simpleMessage("Books"),
        "businessEnglish":
            MessageLookupByLibrary.simpleMessage("English for business"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelClassHint": MessageLookupByLibrary.simpleMessage(
            "Use \"Cancel\" button to cancel a class.\nThis button only appears if the class\'s start time is far more than 2 hours"),
        "cannotEmpty": m0,
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "classSession": MessageLookupByLibrary.simpleMessage("Session"),
        "collapse": MessageLookupByLibrary.simpleMessage("Collapse"),
        "confirmCancelClass": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to cancel this class?"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "confirmPasswordNotMatch": MessageLookupByLibrary.simpleMessage(
            "Confirm password does not match"),
        "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
            "Please confirm your password"),
        "conversationalEnglish":
            MessageLookupByLibrary.simpleMessage("Conversational English"),
        "country": MessageLookupByLibrary.simpleMessage("Country"),
        "courses": MessageLookupByLibrary.simpleMessage("Courses"),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
        "demo": MessageLookupByLibrary.simpleMessage("Demo"),
        "denied": MessageLookupByLibrary.simpleMessage("Denied"),
        "doSomethingsFailed": m1,
        "doSomethingsSuccess": m2,
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "englishForBeginners":
            MessageLookupByLibrary.simpleMessage("English for beginners"),
        "englishForKids":
            MessageLookupByLibrary.simpleMessage("English for kids"),
        "englishForTraveling":
            MessageLookupByLibrary.simpleMessage("English for traveling"),
        "englishLanguage": MessageLookupByLibrary.simpleMessage("English"),
        "enterRoom": MessageLookupByLibrary.simpleMessage("Join"),
        "expand": MessageLookupByLibrary.simpleMessage("Expand"),
        "experience": MessageLookupByLibrary.simpleMessage("Experience"),
        "filter": MessageLookupByLibrary.simpleMessage("Filter"),
        "flyers": MessageLookupByLibrary.simpleMessage("FLYERS"),
        "forStudyingAboard":
            MessageLookupByLibrary.simpleMessage("For studying aboard"),
        "foreign": MessageLookupByLibrary.simpleMessage("Foreign"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "forgotPasswordFailedWithEmailNotExists":
            MessageLookupByLibrary.simpleMessage("Email does not exist"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
        "haveNotLearnAnyLesson": MessageLookupByLibrary.simpleMessage(
            "You have not learned any lesson yet"),
        "homework": MessageLookupByLibrary.simpleMessage("Homework"),
        "hours": MessageLookupByLibrary.simpleMessage("hours"),
        "ielts": MessageLookupByLibrary.simpleMessage("IELTS"),
        "interest": MessageLookupByLibrary.simpleMessage("Interest"),
        "introducingText": MessageLookupByLibrary.simpleMessage(
            "Improve yourself with great tutors!"),
        "invalid": MessageLookupByLibrary.simpleMessage("Invalid"),
        "isNotReviewed": MessageLookupByLibrary.simpleMessage("Not reviewed"),
        "isReviewed": MessageLookupByLibrary.simpleMessage("Reviewed"),
        "item": MessageLookupByLibrary.simpleMessage("item"),
        "ket": MessageLookupByLibrary.simpleMessage("KET"),
        "labelAbout": MessageLookupByLibrary.simpleMessage("About"),
        "labelTopics": MessageLookupByLibrary.simpleMessage("Topics"),
        "labelTotalLessonTime":
            MessageLookupByLibrary.simpleMessage("Your total lesson time is"),
        "labelUpcomingClass":
            MessageLookupByLibrary.simpleMessage("Your upcoming class is"),
        "labelWhatAbleDo": MessageLookupByLibrary.simpleMessage(
            "What will you be able to do?"),
        "labelWhyTakeCourse": MessageLookupByLibrary.simpleMessage(
            "Why should you take this course?"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "learnedBook": MessageLookupByLibrary.simpleMessage("Learned book"),
        "learningInterests":
            MessageLookupByLibrary.simpleMessage("Learning interests"),
        "lesson": MessageLookupByLibrary.simpleMessage("lesson"),
        "lessonHistory": MessageLookupByLibrary.simpleMessage("Lesson History"),
        "lessonStatus": MessageLookupByLibrary.simpleMessage("Lesson status"),
        "lessonTime": MessageLookupByLibrary.simpleMessage("Lesson time"),
        "level": MessageLookupByLibrary.simpleMessage("Level"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "listening": MessageLookupByLibrary.simpleMessage("Listening"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginFailedWithNoTokens": MessageLookupByLibrary.simpleMessage(
            "Cannot verify login session. Please try again later."),
        "loginFailedWithWrongCredentials": MessageLookupByLibrary.simpleMessage(
            "Email or password is incorrect"),
        "loginTitle":
            MessageLookupByLibrary.simpleMessage("Login to your account"),
        "minutes": MessageLookupByLibrary.simpleMessage("minutes"),
        "more": MessageLookupByLibrary.simpleMessage("More"),
        "movers": MessageLookupByLibrary.simpleMessage("MOVERS"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nationality": MessageLookupByLibrary.simpleMessage("Nationality"),
        "nativeEnglish": MessageLookupByLibrary.simpleMessage("Native English"),
        "needActivateContent": MessageLookupByLibrary.simpleMessage(
            "Your account is not activated.\nPlease check your email to activate it."),
        "needActivateHeader":
            MessageLookupByLibrary.simpleMessage("Account activation notify"),
        "networkUnstable":
            MessageLookupByLibrary.simpleMessage("Network unstable"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noHaveSomethingsSuggested": m3,
        "noRequest": MessageLookupByLibrary.simpleMessage("No request"),
        "noReviewForTutor": MessageLookupByLibrary.simpleMessage(
            "No review for this tutor yet"),
        "noReviewGiven": MessageLookupByLibrary.simpleMessage("No comment"),
        "noUpcomingSession": MessageLookupByLibrary.simpleMessage(
            "You don\'t have any upcoming session"),
        "notFoundSomethings": m4,
        "notes": MessageLookupByLibrary.simpleMessage("Notes"),
        "notification": MessageLookupByLibrary.simpleMessage("Notification"),
        "openMeeting": MessageLookupByLibrary.simpleMessage("Open meeting"),
        "openSettings": MessageLookupByLibrary.simpleMessage("Open settings"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("Or continue with"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "otherIssues": MessageLookupByLibrary.simpleMessage("Other issues"),
        "overallComment":
            MessageLookupByLibrary.simpleMessage("Overall comment"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordRule": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters long and contain at least one number, one uppercase, one lowercase letter and one special character"),
        "permissionNeedOpenSettingsDialogContent": m5,
        "permissionNeedOpenSettingsDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Permission(s) need to be granted in settings"),
        "pet": MessageLookupByLibrary.simpleMessage("PET"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "pleaseInputSomethings": m6,
        "preferredSchedule":
            MessageLookupByLibrary.simpleMessage("Preferred schedule"),
        "preferredScheduleHint": MessageLookupByLibrary.simpleMessage(
            "Note the time of the week you want to sturdy"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "rating": MessageLookupByLibrary.simpleMessage("Rating"),
        "reasonCancel1":
            MessageLookupByLibrary.simpleMessage("Reschedule at another time"),
        "reasonCancel2":
            MessageLookupByLibrary.simpleMessage("Busy at that time"),
        "reasonCancel3": MessageLookupByLibrary.simpleMessage("Asked by tutor"),
        "reasonCancelQuestion": MessageLookupByLibrary.simpleMessage(
            "What was the reason you cancel this booking?"),
        "reasonReportQuestion": MessageLookupByLibrary.simpleMessage(
            "What was the reason you report this lesson?"),
        "record": MessageLookupByLibrary.simpleMessage("Record"),
        "refreshTokenError": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please login again."),
        "report": MessageLookupByLibrary.simpleMessage("Report"),
        "reportSchedule1":
            MessageLookupByLibrary.simpleMessage("Tutor was late"),
        "reportSchedule2":
            MessageLookupByLibrary.simpleMessage("Tutor was absent"),
        "reportTutorRequirement": MessageLookupByLibrary.simpleMessage(
            "Help us understand what is happening"),
        "requestForClass":
            MessageLookupByLibrary.simpleMessage("Request for class"),
        "reserved": MessageLookupByLibrary.simpleMessage("Reserved"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
        "resetPasswordRequestSendSucceededContent":
            MessageLookupByLibrary.simpleMessage(
                "Please check your email to reset your password.\nIf you didn\'t receive any mail, please ensure that the email you entered is correct and check your spam folder or wait for 1 to 2 minutes and then send a new request."),
        "resetPasswordRequirement": MessageLookupByLibrary.simpleMessage(
            "Enter the email associated with your account to reset password."),
        "review": MessageLookupByLibrary.simpleMessage("Review"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
        "scheduleOfTutorA": m7,
        "searchHintCountry":
            MessageLookupByLibrary.simpleMessage("Search for a country"),
        "searchHintCourse":
            MessageLookupByLibrary.simpleMessage("Find a course"),
        "searchHintTutor": MessageLookupByLibrary.simpleMessage("Find a tutor"),
        "sendResetPasswordRequest":
            MessageLookupByLibrary.simpleMessage("Send reset password request"),
        "server": MessageLookupByLibrary.simpleMessage("Server"),
        "session": MessageLookupByLibrary.simpleMessage("Session"),
        "sessionProgressIn":
            MessageLookupByLibrary.simpleMessage("going on for"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signUpFailedWithEmailTaken":
            MessageLookupByLibrary.simpleMessage("Email is already taken"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Create your account"),
        "skillLevel": MessageLookupByLibrary.simpleMessage("Skill level"),
        "somethingRequiredError": m8,
        "sortNameFromAtoZ": MessageLookupByLibrary.simpleMessage("From A to Z"),
        "sortSomethingsFromHigh": m9,
        "sortSomethingsFromLow": m10,
        "sorting": MessageLookupByLibrary.simpleMessage("Sorting"),
        "speaking": MessageLookupByLibrary.simpleMessage("Speaking"),
        "specialties": MessageLookupByLibrary.simpleMessage("Specialties"),
        "starters": MessageLookupByLibrary.simpleMessage("STARTERS"),
        "suggestedCourses":
            MessageLookupByLibrary.simpleMessage("Suggested courses"),
        "suggestedTutors":
            MessageLookupByLibrary.simpleMessage("Suggested tutors"),
        "swipeToCancelClass": MessageLookupByLibrary.simpleMessage(
            "Swipe left to cancel a class"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "systemThemeModeNote": MessageLookupByLibrary.simpleMessage(
            "If you choose \"System\", the application will follow the system theme mode on the device"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "toefl": MessageLookupByLibrary.simpleMessage("TOEFL"),
        "toeic": MessageLookupByLibrary.simpleMessage("TOEIC"),
        "tutor": MessageLookupByLibrary.simpleMessage("Tutor"),
        "tutorAnnoyingIssue":
            MessageLookupByLibrary.simpleMessage("This tutor is annoying me"),
        "tutorFakeProfileIssue": MessageLookupByLibrary.simpleMessage(
            "This profile is pretending be someone or is fake"),
        "tutorPhotoInappropriateIssue":
            MessageLookupByLibrary.simpleMessage("Inappropriate profile photo"),
        "tutorReview": MessageLookupByLibrary.simpleMessage("Tutor\'s review"),
        "tutorWithNationality": m11,
        "tutoring": MessageLookupByLibrary.simpleMessage("Tutoring"),
        "unknownSomethings": m12,
        "upcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
        "upcomingIn": MessageLookupByLibrary.simpleMessage("in"),
        "updateProfile": MessageLookupByLibrary.simpleMessage("Update profile"),
        "uploadAvatar": MessageLookupByLibrary.simpleMessage("Upload avatar"),
        "uploadUserInfo":
            MessageLookupByLibrary.simpleMessage("Upload user\'s information"),
        "videoNotAvailable":
            MessageLookupByLibrary.simpleMessage("Video not available"),
        "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese"),
        "vietnameseLanguage":
            MessageLookupByLibrary.simpleMessage("Vietnamese"),
        "viewAll": MessageLookupByLibrary.simpleMessage("View all"),
        "vocabulary": MessageLookupByLibrary.simpleMessage("Vocabulary"),
        "waitingTime": MessageLookupByLibrary.simpleMessage("Waiting time"),
        "wantToStudyRequired": MessageLookupByLibrary.simpleMessage(
            "Please choose at least 1 option"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "youHaveNSessionLeft": m13
      };
}
