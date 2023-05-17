// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(somethings) => "${somethings} không được để trống";

  static String m1(somethings) => "${somethings} thất bại";

  static String m2(somethings) => "${somethings} thành công";

  static String m3(somethings) => "Không có ${somethings} tham khảo";

  static String m4(somethings) => "Không tìm thấy ${somethings} nào";

  static String m5(somethings) =>
      "Ứng dụng muốn truy cập vào ${somethings}.\nBạn có muốn mở cài đặt và cho phép?";

  static String m6(somethings) => "Vui lòng điền ${somethings}";

  static String m7(tutor) => "Lịch học của giảng viên ${tutor}";

  static String m8(somethings) => "${somethings} là bắt buộc";

  static String m9(somethings) => "Từ ${somethings} cao";

  static String m10(somethings) => "Từ ${somethings} thấp";

  static String m11(nationality) => "Gia sư ${nationality}";

  static String m12(somethings) => "${somethings} không xác định";

  static String m13(n) => "Bạn còn ${n} buổi học";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Về tôi"),
        "account": MessageLookupByLibrary.simpleMessage("Tài khoản"),
        "activeKey": MessageLookupByLibrary.simpleMessage("Kích hoạt key"),
        "all": MessageLookupByLibrary.simpleMessage("Tất cả"),
        "apiKeySendError": MessageLookupByLibrary.simpleMessage(
            "Hiện không có api key hợp lệ nào khả dụng trên cloud.\nVui lòng đợi cho đến khi có api key hợp lệ mới khả dụng hoặc bạn có thể cung cấp api key của riêng bạn tại \"Cài đặt\" > \"Trợ lý\"."),
        "app": MessageLookupByLibrary.simpleMessage("Ứng dụng"),
        "assistant": MessageLookupByLibrary.simpleMessage("Trợ lý"),
        "assistantInputHint": MessageLookupByLibrary.simpleMessage(
            "Nhập câu hỏi của bạn tại đây"),
        "autoPlayNewMessage":
            MessageLookupByLibrary.simpleMessage("Tự động phát tin nhắn mới"),
        "balance": MessageLookupByLibrary.simpleMessage("Số dư"),
        "becomeATutor":
            MessageLookupByLibrary.simpleMessage("Đăng kí làm giảng viên"),
        "behavior": MessageLookupByLibrary.simpleMessage("Thái độ"),
        "bookClass": MessageLookupByLibrary.simpleMessage("Đặt lịch"),
        "bookSchedule": MessageLookupByLibrary.simpleMessage("Đặt lịch"),
        "booked": MessageLookupByLibrary.simpleMessage("Đã đặt"),
        "booking": MessageLookupByLibrary.simpleMessage("Đang đặt"),
        "bookingDetail":
            MessageLookupByLibrary.simpleMessage("Chi tiết đặt lịch"),
        "bookingTime":
            MessageLookupByLibrary.simpleMessage("Thời gian đặt lịch"),
        "books": MessageLookupByLibrary.simpleMessage("Sách"),
        "businessEnglish":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh cho công việc"),
        "cancel": MessageLookupByLibrary.simpleMessage("Hủy"),
        "cancelClassHint": MessageLookupByLibrary.simpleMessage(
            "Dùng nút \"Hủy\" để hủy buổi học.\nNút này chỉ xuất hiện nếu buổi học còn cách 2 tiếng nữa mới bắt đầu"),
        "cannotEmpty": m0,
        "categories": MessageLookupByLibrary.simpleMessage("Danh mục"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Thay đổi mật khẩu"),
        "chat": MessageLookupByLibrary.simpleMessage("Nhắn tin"),
        "classSession": MessageLookupByLibrary.simpleMessage("Buổi học"),
        "collapse": MessageLookupByLibrary.simpleMessage("Thu gọn"),
        "confirmCancelClass": MessageLookupByLibrary.simpleMessage(
            "Bạn có chắc chắn muốn hủy lớp này?"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Xác nhận mật khẩu"),
        "confirmPasswordNotMatch": MessageLookupByLibrary.simpleMessage(
            "Xác nhận mật khẩu không khớp"),
        "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
            "Vui lòng xác nhận lại mật khẩu"),
        "conversationalEnglish":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh giao tiếp"),
        "country": MessageLookupByLibrary.simpleMessage("Quốc gia"),
        "courses": MessageLookupByLibrary.simpleMessage("Khoá học"),
        "dark": MessageLookupByLibrary.simpleMessage("Tối"),
        "dateOfBirth": MessageLookupByLibrary.simpleMessage("Ngày sinh"),
        "demo": MessageLookupByLibrary.simpleMessage("Demo"),
        "denied": MessageLookupByLibrary.simpleMessage("Từ chối"),
        "doSomethingsFailed": m1,
        "doSomethingsSuccess": m2,
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Không có tài khoản?"),
        "edit": MessageLookupByLibrary.simpleMessage("Chỉnh sửa"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "englishForBeginners":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh cơ bản"),
        "englishForKids":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh cho trẻ em"),
        "englishForTraveling":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh du lịch"),
        "englishLanguage": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
        "enterRoom": MessageLookupByLibrary.simpleMessage("Vào lớp"),
        "expand": MessageLookupByLibrary.simpleMessage("Mở rộng"),
        "experience": MessageLookupByLibrary.simpleMessage("Kinh nghiệm"),
        "filter": MessageLookupByLibrary.simpleMessage("Lọc"),
        "flyers": MessageLookupByLibrary.simpleMessage("FLYERS"),
        "forStudyingAboard":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh cho du học"),
        "foreign": MessageLookupByLibrary.simpleMessage("Nước ngoài"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("Quên mật khẩu"),
        "forgotPasswordFailedWithEmailNotExists":
            MessageLookupByLibrary.simpleMessage("Email không tồn tại"),
        "gallery": MessageLookupByLibrary.simpleMessage("Thư viện"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Bắt Đầu"),
        "haveNotLearnAnyLesson": MessageLookupByLibrary.simpleMessage(
            "Bạn chưa tham gia buổi học nào"),
        "homework": MessageLookupByLibrary.simpleMessage("Bài tập về nhà"),
        "hours": MessageLookupByLibrary.simpleMessage("tiếng"),
        "ielts": MessageLookupByLibrary.simpleMessage("IELTS"),
        "interest": MessageLookupByLibrary.simpleMessage("Sở thích"),
        "introducingText": MessageLookupByLibrary.simpleMessage(
            "Cải thiện bản thân với các gia sư tuyệt vời"),
        "invalid": MessageLookupByLibrary.simpleMessage("Không hợp lệ"),
        "isNotReviewed":
            MessageLookupByLibrary.simpleMessage("Chưa có nhận xét"),
        "isReviewed": MessageLookupByLibrary.simpleMessage("Đã có nhận xét"),
        "item": MessageLookupByLibrary.simpleMessage("Mục"),
        "ket": MessageLookupByLibrary.simpleMessage("KET"),
        "labelAbout": MessageLookupByLibrary.simpleMessage("Tổng quan"),
        "labelTopics": MessageLookupByLibrary.simpleMessage("Danh sách chủ đề"),
        "labelTotalLessonTime": MessageLookupByLibrary.simpleMessage(
            "Tổng thời gian học của bạn là"),
        "labelUpcomingClass": MessageLookupByLibrary.simpleMessage(
            "Lớp học sắp diễn ra của bạn là"),
        "labelWhatAbleDo":
            MessageLookupByLibrary.simpleMessage("Bạn có thể làm gì"),
        "labelWhyTakeCourse": MessageLookupByLibrary.simpleMessage(
            "Tại sao bạn nên học khóa học này"),
        "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
        "learnedBook": MessageLookupByLibrary.simpleMessage("Sách đã học"),
        "learningInterests": MessageLookupByLibrary.simpleMessage("Muốn học"),
        "lesson": MessageLookupByLibrary.simpleMessage("bài học"),
        "lessonHistory":
            MessageLookupByLibrary.simpleMessage("Lịch sử buổi học"),
        "lessonStatus": MessageLookupByLibrary.simpleMessage("Tiến độ bài học"),
        "lessonTime": MessageLookupByLibrary.simpleMessage("Thời gian học"),
        "level": MessageLookupByLibrary.simpleMessage("Độ khó"),
        "light": MessageLookupByLibrary.simpleMessage("Sáng"),
        "listening": MessageLookupByLibrary.simpleMessage("Khả năng nghe"),
        "loading": MessageLookupByLibrary.simpleMessage("Đang tải"),
        "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "loginFailedWithNoTokens": MessageLookupByLibrary.simpleMessage(
            "Không thể xác thực phiên đăng nhập. Vui lòng thử lại sau."),
        "loginFailedWithWrongCredentials": MessageLookupByLibrary.simpleMessage(
            "Email hoặc mật khẩu không đúng"),
        "loginTitle":
            MessageLookupByLibrary.simpleMessage("Đăng nhập tài khoản"),
        "microphone": MessageLookupByLibrary.simpleMessage("Micro"),
        "minutes": MessageLookupByLibrary.simpleMessage("phút"),
        "more": MessageLookupByLibrary.simpleMessage("Chi tiết"),
        "movers": MessageLookupByLibrary.simpleMessage("MOVERS"),
        "name": MessageLookupByLibrary.simpleMessage("Tên"),
        "nationality": MessageLookupByLibrary.simpleMessage("Quốc gia"),
        "nativeEnglish":
            MessageLookupByLibrary.simpleMessage("Tiếng Anh bản địa"),
        "needActivateContent": MessageLookupByLibrary.simpleMessage(
            "Tài khoản của bạn chưa được kích hoạt.\nVui lòng kiểm tra email để kích hoạt."),
        "needActivateHeader": MessageLookupByLibrary.simpleMessage(
            "Thông báo kích hoạt tài khoản"),
        "networkUnstable":
            MessageLookupByLibrary.simpleMessage("Mạng không ổn định"),
        "no": MessageLookupByLibrary.simpleMessage("Không"),
        "noHaveSomethingsSuggested": m3,
        "noRequest": MessageLookupByLibrary.simpleMessage("Không có yêu cầu"),
        "noReviewForTutor": MessageLookupByLibrary.simpleMessage(
            "Chưa có đánh giá nào cho giảng viên này"),
        "noUpcomingSession": MessageLookupByLibrary.simpleMessage(
            "Bạn không có buổi học nào sắp diễn ra"),
        "notApiKeySendError": MessageLookupByLibrary.simpleMessage(
            "Có lỗi xảy ra. Bạn có muốn gửi lại không?"),
        "notFoundSomethings": m4,
        "notes": MessageLookupByLibrary.simpleMessage("Ghi chú"),
        "notification": MessageLookupByLibrary.simpleMessage("Thông báo"),
        "off": MessageLookupByLibrary.simpleMessage("Tắt"),
        "on": MessageLookupByLibrary.simpleMessage("Bật"),
        "openMeeting": MessageLookupByLibrary.simpleMessage("Mở cuộc họp"),
        "openSettings": MessageLookupByLibrary.simpleMessage("Mở cài đặt"),
        "orContinueWith":
            MessageLookupByLibrary.simpleMessage("Hoặc tiếp tục với"),
        "other": MessageLookupByLibrary.simpleMessage("Khác"),
        "otherIssues": MessageLookupByLibrary.simpleMessage("Vấn đề khác"),
        "overallComment":
            MessageLookupByLibrary.simpleMessage("Đánh giá chung"),
        "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
        "passwordRule": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt"),
        "permissionNeedOpenSettingsDialogContent": m5,
        "permissionNeedOpenSettingsDialogTitle":
            MessageLookupByLibrary.simpleMessage(
                "Quyền cần được mở trong cài đặt"),
        "pet": MessageLookupByLibrary.simpleMessage("PET"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
        "pleaseInputSomethings": m6,
        "preferredSchedule":
            MessageLookupByLibrary.simpleMessage("Lịch học mong muốn"),
        "preferredScheduleHint": MessageLookupByLibrary.simpleMessage(
            "Ghi chú thời gian trong tuần mà bạn muốn học"),
        "priApiKeySendError": MessageLookupByLibrary.simpleMessage(
            "Api key của riêng bạn hiện không còn hợp lệ.\nVui lòng cung cấp api key mới tại \"Cài đặt\" > \"Trợ lý\" hoặc bạn có thể sử dụng api key chung trên cloud."),
        "price": MessageLookupByLibrary.simpleMessage("Giá"),
        "privateApiKey": MessageLookupByLibrary.simpleMessage("Api key riêng"),
        "privateApiKeyNote": MessageLookupByLibrary.simpleMessage(
            "Api key riêng sẽ chỉ được sử dụng trên thiết bị này. Điều này sẽ giúp bạn có trải nghiệm tốt hơn với tính năng \"Trợ lý\"."),
        "profile": MessageLookupByLibrary.simpleMessage("Hồ sơ"),
        "rating": MessageLookupByLibrary.simpleMessage("Xếp hạng"),
        "reasonCancel1":
            MessageLookupByLibrary.simpleMessage("Đặt lịch ở giờ khác"),
        "reasonCancel2":
            MessageLookupByLibrary.simpleMessage("Bận vào thời gian học"),
        "reasonCancel3":
            MessageLookupByLibrary.simpleMessage("Giảng viên yêu cầu"),
        "reasonCancelQuestion": MessageLookupByLibrary.simpleMessage(
            "Lý do bạn hủy buổi học này là gì?"),
        "reasonReportQuestion": MessageLookupByLibrary.simpleMessage(
            "Lý do bạn báo cáo bài học này là gì?"),
        "record": MessageLookupByLibrary.simpleMessage("Bản ghi"),
        "refreshTokenError": MessageLookupByLibrary.simpleMessage(
            "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại."),
        "report": MessageLookupByLibrary.simpleMessage("Báo cáo"),
        "reportSchedule1":
            MessageLookupByLibrary.simpleMessage("Giảng viên vào muộn"),
        "reportSchedule2":
            MessageLookupByLibrary.simpleMessage("Giảng viên không tham dự"),
        "reportTutorRequirement":
            MessageLookupByLibrary.simpleMessage("Bạn gặp phải vấn đề gì"),
        "requestForClass":
            MessageLookupByLibrary.simpleMessage("Yêu cầu lớp học"),
        "reserved": MessageLookupByLibrary.simpleMessage("Đã được đặt"),
        "reset": MessageLookupByLibrary.simpleMessage("Đặt lại"),
        "resetPassword":
            MessageLookupByLibrary.simpleMessage("Đặt lại mật khẩu"),
        "resetPasswordRequestSendSucceededContent":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng kiểm tra email để đặt lại mật khẩu.\nNếu bạn không nhận được mail, xin hãy chắc chắn rằng email bạn nhập là chính xác và thử kiểm tra trong hộp thư rác hoặc đợi từ 1 đến 2 phút và gửi yêu cầu mới."),
        "resetPasswordRequirement": MessageLookupByLibrary.simpleMessage(
            "Điền email ứng với tài khoản muốn đặt lại mật khẩu."),
        "review": MessageLookupByLibrary.simpleMessage("Đánh giá"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Lưu thay đổi"),
        "scheduleOfTutorA": m7,
        "searchHintCountry":
            MessageLookupByLibrary.simpleMessage("Tìm quốc gia"),
        "searchHintCourse":
            MessageLookupByLibrary.simpleMessage("Tìm khóa học"),
        "searchHintTutor": MessageLookupByLibrary.simpleMessage("Tìm gia sư"),
        "sendErrorTitle":
            MessageLookupByLibrary.simpleMessage("Gửi không thành công"),
        "sendResetPasswordRequest": MessageLookupByLibrary.simpleMessage(
            "Gửi yêu cầu đặt lại mật khẩu"),
        "server": MessageLookupByLibrary.simpleMessage("Máy chủ"),
        "session": MessageLookupByLibrary.simpleMessage("Buổi"),
        "sessionProgressIn":
            MessageLookupByLibrary.simpleMessage("diễn ra được"),
        "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
        "signOut": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
        "signUp": MessageLookupByLibrary.simpleMessage("Đăng ký"),
        "signUpFailedWithEmailTaken":
            MessageLookupByLibrary.simpleMessage("Email đã được sử dụng"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("Tạo tài khoản"),
        "skillLevel": MessageLookupByLibrary.simpleMessage("Trình độ"),
        "somethingRequiredError": m8,
        "sortNameFromAtoZ":
            MessageLookupByLibrary.simpleMessage("Từ tên A đến Z"),
        "sortSomethingsFromHigh": m9,
        "sortSomethingsFromLow": m10,
        "sorting": MessageLookupByLibrary.simpleMessage("Sắp xếp"),
        "speaking": MessageLookupByLibrary.simpleMessage("Khả năng nói"),
        "specialties": MessageLookupByLibrary.simpleMessage("Chuyên môn"),
        "starters": MessageLookupByLibrary.simpleMessage("STARTERS"),
        "sttInitializationFailed": MessageLookupByLibrary.simpleMessage(
            "Không bắt đầu tính năng \"lời nói thành văn bản\".\n"),
        "sttInitializationFailedMessageAndroid":
            MessageLookupByLibrary.simpleMessage(
                "Vui lòng đảm bảo quyền micro được cho phép."),
        "sttInitializationFailedMessageIos": MessageLookupByLibrary.simpleMessage(
            "Vui lòng đảm bảo quyền micro và nhận dạng giọng nói được cho phép."),
        "suggestedCourses":
            MessageLookupByLibrary.simpleMessage("Khóa học tham khảo"),
        "suggestedTutors":
            MessageLookupByLibrary.simpleMessage("Gia sư tham khảo"),
        "swipeToCancelClass":
            MessageLookupByLibrary.simpleMessage("Vuốt trái để hủy buổi học"),
        "system": MessageLookupByLibrary.simpleMessage("Hệ thống"),
        "systemThemeModeNote": MessageLookupByLibrary.simpleMessage(
            "Nếu bạn chọn \"Hệ thống\", ứng dụng sẽ tự động điều chỉnh theo chế độ trên thiết bị"),
        "theme": MessageLookupByLibrary.simpleMessage("Chủ đề"),
        "today": MessageLookupByLibrary.simpleMessage("Hôm nay"),
        "toefl": MessageLookupByLibrary.simpleMessage("TOEFL"),
        "toeic": MessageLookupByLibrary.simpleMessage("TOEIC"),
        "tutor": MessageLookupByLibrary.simpleMessage("Gia sư"),
        "tutorAnnoyingIssue":
            MessageLookupByLibrary.simpleMessage("Gia sư này làm phiền tôi"),
        "tutorFakeProfileIssue":
            MessageLookupByLibrary.simpleMessage("Hồ sơ này là giả mạo"),
        "tutorPhotoInappropriateIssue":
            MessageLookupByLibrary.simpleMessage("Ảnh hồ sơ không phù hợp"),
        "tutorReview":
            MessageLookupByLibrary.simpleMessage("Nhận xét từ gia sư"),
        "tutorWithNationality": m11,
        "tutoring": MessageLookupByLibrary.simpleMessage("Giảng dạy"),
        "unknownSomethings": m12,
        "upcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
        "upcomingIn": MessageLookupByLibrary.simpleMessage("bắt đầu sau"),
        "updateProfile": MessageLookupByLibrary.simpleMessage("Cập nhật hồ sơ"),
        "uploadAvatar":
            MessageLookupByLibrary.simpleMessage("Cập nhật ảnh đại diện"),
        "uploadUserInfo":
            MessageLookupByLibrary.simpleMessage("Cập nhật thông tin cá nhân"),
        "usePublicApiKey":
            MessageLookupByLibrary.simpleMessage("Sử dụng api key chung"),
        "videoNotAvailable":
            MessageLookupByLibrary.simpleMessage("Video không khả dụng"),
        "vietnamese": MessageLookupByLibrary.simpleMessage("Việt Nam"),
        "vietnameseLanguage":
            MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
        "viewAll": MessageLookupByLibrary.simpleMessage("Xem tất cả"),
        "vocabulary": MessageLookupByLibrary.simpleMessage("Từ vựng"),
        "voiceRecognition":
            MessageLookupByLibrary.simpleMessage("Nhận dạng giọng nói"),
        "waitingTime": MessageLookupByLibrary.simpleMessage("Thời gian chờ"),
        "wantToStudyRequired":
            MessageLookupByLibrary.simpleMessage("Vui lòng chọn ít nhất 1 mục"),
        "yes": MessageLookupByLibrary.simpleMessage("Có"),
        "youHaveNSessionLeft": m13,
        "yourApiKey": MessageLookupByLibrary.simpleMessage("API key của bạn")
      };
}
