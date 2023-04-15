import 'package:one_one_learn/generated/l10n.dart';

class ApiServices {
  static const auth = 'auth';
  static const user = 'user';
  static const tutor = 'tutor';
  static const schedule = 'schedule';
  static const payment = 'payment';
  static const course = 'course';
}

class ApiEndpoints {
  // auth
  static const login = 'login';
  static const register = 'register';
  static const changePassword = 'change-password';
  static const refreshToken = 'refresh-token';

  // user
  static const forgotPassword = 'forgot-password';
  static const info = 'info';
  static const feedbackTutor ='feedbackTutor';
  static const manageFavoriteTutor = 'manageFavoriteTutor';

  // tutor
  static const more = 'more';
  static const search = 'search';
}

class ApiConstants {
  // normal constants
  static const contentType = 'Content-Type';
  static const authorization = 'Authorization';
  static const statusCode = 'statusCode';
  static const message = 'message';
  static const tokens = 'tokens';
  static const refreshToken = 'refreshToken';
  static const accessToken = 'accessToken';

  // error constants
  static const accessTokenExpiredMess = 'Please authenticate';
  static final refreshTokenError = S.current.refreshTokenError;
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
