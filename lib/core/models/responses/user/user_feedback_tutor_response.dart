import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/feedback/feed_back.dart';

class UserFeedbackTutorResponse extends BaseResponse {
  const UserFeedbackTutorResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  @override
  List<Object?> get props => [...super.props, data];

  factory UserFeedbackTutorResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return UserFeedbackTutorResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message']  as String?,
      data: mapJson['data'] != null ? FeedBack.fromJson(mapJson['data']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  final FeedBack? data;

  UserFeedbackTutorResponse copyWith({  String? message,
    FeedBack? data,
  }) => UserFeedbackTutorResponse(  message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  String toString() {
    return 'UserFeedbackTutorResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' data: $data,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory UserFeedbackTutorResponse.fromMap(Map<String, dynamic> map) {
    return UserFeedbackTutorResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null ? FeedBack.fromMap(map['data'] as Map<String, dynamic>) : null,
    );
  }
}
