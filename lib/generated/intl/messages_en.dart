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

  static String m0(somethings) => "${somethings} failed";

  static String m1(somethings) => "${somethings} successfully";

  static String m2(somethings) => "${somethings} is required";

  static String m3(somethings) => "From high ${somethings}";

  static String m4(somethings) => "From low ${somethings}";

  static String m5(nationality) => "${nationality} tutor";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "app": MessageLookupByLibrary.simpleMessage("App"),
        "becomeATutor": MessageLookupByLibrary.simpleMessage("Become a tutor"),
        "behavior": MessageLookupByLibrary.simpleMessage("Behavior"),
        "bookClass": MessageLookupByLibrary.simpleMessage("Book class"),
        "bookSchedule": MessageLookupByLibrary.simpleMessage("Book"),
        "booked": MessageLookupByLibrary.simpleMessage("Booked"),
        "books": MessageLookupByLibrary.simpleMessage("Books"),
        "businessEnglish":
            MessageLookupByLibrary.simpleMessage("English for business"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelClassHint": MessageLookupByLibrary.simpleMessage(
            "Use \"Cancel\" button to cancel a class.\nThis button only appears if the class\'s start time is far more than 2 hours"),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "chat": MessageLookupByLibrary.simpleMessage("Chat"),
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
        "courses": MessageLookupByLibrary.simpleMessage("Courses"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
        "demo": MessageLookupByLibrary.simpleMessage("Demo"),
        "doSomethingsFailed": m0,
        "doSomethingsSuccess": m1,
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
        "isMarked": MessageLookupByLibrary.simpleMessage("Marked"),
        "isNotMarked": MessageLookupByLibrary.simpleMessage("Not marked"),
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
        "level": MessageLookupByLibrary.simpleMessage("Level"),
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
        "nationality": MessageLookupByLibrary.simpleMessage("Nationality"),
        "nativeEnglish": MessageLookupByLibrary.simpleMessage("Native English"),
        "needActivateContent": MessageLookupByLibrary.simpleMessage(
            "Your account is not activated.\nPlease check your email to activate it."),
        "needActivateHeader":
            MessageLookupByLibrary.simpleMessage("Account activation notify"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noReviewGiven": MessageLookupByLibrary.simpleMessage("No comment"),
        "notification": MessageLookupByLibrary.simpleMessage("Notification"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("Or continue with"),
        "overallComment":
            MessageLookupByLibrary.simpleMessage("Overall comment"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordRule": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 8 characters long and contain at least one number, one uppercase, one lowercase letter and one special character"),
        "pet": MessageLookupByLibrary.simpleMessage("PET"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "preferredSchedule":
            MessageLookupByLibrary.simpleMessage("Preferred schedule"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "rating": MessageLookupByLibrary.simpleMessage("Rating"),
        "record": MessageLookupByLibrary.simpleMessage("Record"),
        "refreshTokenError": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please login again."),
        "report": MessageLookupByLibrary.simpleMessage("Report"),
        "requestForClass":
            MessageLookupByLibrary.simpleMessage("Request for class"),
        "reset": MessageLookupByLibrary.simpleMessage("Reset"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset password"),
        "resetPasswordRequestSendSucceededContent":
            MessageLookupByLibrary.simpleMessage(
                "Please check your email to reset your password.\nIf you didn\'t receive any mail, please ensure that the email you entered is correct and check your spam folder or wait for 1 to 2 minutes and then send a new request."),
        "resetPasswordRequirement": MessageLookupByLibrary.simpleMessage(
            "Enter the email associated with your account to reset password."),
        "review": MessageLookupByLibrary.simpleMessage("Review"),
        "searchHintCourse":
            MessageLookupByLibrary.simpleMessage("Find a course"),
        "searchHintTutor": MessageLookupByLibrary.simpleMessage("Find a tutor"),
        "sendResetPasswordRequest":
            MessageLookupByLibrary.simpleMessage("Send reset password request"),
        "server": MessageLookupByLibrary.simpleMessage("Server"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signOut": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "signUpFailedWithEmailTaken":
            MessageLookupByLibrary.simpleMessage("Email is already taken"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Create your account"),
        "skillLevel": MessageLookupByLibrary.simpleMessage("Skill level"),
        "somethingRequiredError": m2,
        "sortNameFromAtoZ": MessageLookupByLibrary.simpleMessage("From A to Z"),
        "sortSomethingsFromHigh": m3,
        "sortSomethingsFromLow": m4,
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
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "toefl": MessageLookupByLibrary.simpleMessage("TOEFL"),
        "toeic": MessageLookupByLibrary.simpleMessage("TOEIC"),
        "tutor": MessageLookupByLibrary.simpleMessage("tutor"),
        "tutorReview": MessageLookupByLibrary.simpleMessage("Tutor\'s review"),
        "tutorWithNationality": m5,
        "tutoring": MessageLookupByLibrary.simpleMessage("Tutoring"),
        "upcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
        "upcomingIn": MessageLookupByLibrary.simpleMessage("in"),
        "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese"),
        "viewAll": MessageLookupByLibrary.simpleMessage("View all"),
        "vocabulary": MessageLookupByLibrary.simpleMessage("Vocabulary"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
