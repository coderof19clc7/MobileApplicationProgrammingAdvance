import 'package:one_one_learn/generated/l10n.dart';

class ApiServices {
  static const auth = 'auth';
  static const user = 'user';
  static const tutor = 'tutor';
  static const feedback = 'feedback/v2';
  static const schedule = 'schedule';
  static const booking = 'booking';
  static const call = 'call';
  static const payment = 'payment';
  static const course = 'course';
  static const report = 'report';
}

class ApiEndpoints {
  // auth
  static const login = 'login';
  static const register = 'register';
  static const changePassword = 'change-password';
  static const refreshToken = 'refresh-token';

  // user
  static const forgotPassword = 'forgotPassword';
  static const info = 'info';
  static const feedbackTutor ='feedbackTutor';
  static const manageFavoriteTutor = 'manageFavoriteTutor';

  // tutor
  static const more = 'more';
  static const search = 'search';

  // booking
  static const listStudent = 'list/student';
  static const studentRequest = 'student-request';
  static const scheduleDetail = 'schedule-detail';

  // call
  static const total = 'total';
}

class ApiConstants {
  // normal constants
  static const contentType = 'Content-Type';
  static const accept = 'Accept';
  static const textPlain = 'text/plain';
  static const applicationJson = 'application/json';
  static const authorization = 'Authorization';
  static const statusCode = 'statusCode';
  static const message = 'message';
  static const tokens = 'tokens';
  static const refreshToken = 'refreshToken';
  static const accessToken = 'accessToken';

  // api error messages
  static const accessTokenExpiredMess = 'Please authenticate';
  static const emailAlreadyTaken = 'Email has already taken';
  static const incorrectEmailOrPassword = 'Incorrect email or password';
  static const emailNotExist = "Email doesn't exist!";

  // app defined error messages
  static final refreshTokenError = S.current.refreshTokenError;

  // query parameters
  static const categoriesId = 'categoryId[]';
  static const levels = 'level[]';
  static const order = 'order[]';
  static const orderBy = 'orderBy[]';

  static const meetingServerLink = 'https://meet.lettutor.com';
}

class ApiMethods {
  static const get = 'GET';
  static const post = 'POST';
  static const put = 'PUT';
  static const delete = 'DELETE';
}

class ApiStatusCode {
  static const httpSuccess = 200;
  static const basicError = 400;
  static const refreshToken = 401;
  static const success = 0;
  static const needActivated = 2;
  static const logInSessionExpired = 7;
}
