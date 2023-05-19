import 'package:one_one_learn/core/models/requests/base_request.dart';

class UserFeedbackTutorRequest extends BaseRequest {

  @override
  List<Object?> get props => [rating, content, bookingId, userId];

//<editor-fold desc="Data Methods">
  const UserFeedbackTutorRequest({
    this.rating,
    this.content,
    this.bookingId,
    this.userId,
  });

  factory UserFeedbackTutorRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return UserFeedbackTutorRequest(
      rating: mapJson['rating'] as int?,
      content: mapJson['content'] as String?,
      bookingId: mapJson['bookingId'] as String?,
      userId: mapJson['userId'] as String?,
    );
  }

  final int? rating;
  final String? content;
  final String? bookingId;
  final String? userId;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (rating != null) {
      map['rating'] = rating;
    }
    map['content'] = content ?? '';
    if (bookingId?.isNotEmpty == true) {
      map['bookingId'] = bookingId;
    }
    if (userId?.isNotEmpty == true) {
      map['userId'] = userId;
    }
    return map;
  }

  @override
  String toString() {
    return 'ReportTutorRequest{'
        ' rating: $rating,'
        ' content: $content,'
        ' bookingId: $bookingId,'
        ' userId: $userId,'
        ' }';
  }

  UserFeedbackTutorRequest copyWith({
    int? rating,
    String? content,
    String? bookingId,
    String? userId,
  }) {
    return UserFeedbackTutorRequest(
      rating: rating ?? this.rating,
      content: content ?? this.content,
      bookingId: bookingId ?? this.bookingId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rating': rating,
      'content': content,
      'bookingId': bookingId,
      'userId': userId,
    };
  }

  factory UserFeedbackTutorRequest.fromMap(Map<String, dynamic> map) {
    return UserFeedbackTutorRequest(
      rating: map['rating'] as int?,
      content: map['content'] as String?,
      bookingId: map['bookingId'] as String?,
      userId: map['userId'] as String?,
    );
  }

//</editor-fold>
}
