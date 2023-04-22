import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/course/course_information.dart';

class CourseInfoResponse extends BaseResponse {
  final CourseInformation? data;

  @override
  List<Object?> get props => [super.props, data];

//<editor-fold desc="Data Methods">
  const CourseInfoResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  factory CourseInfoResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    return CourseInfoResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null ? CourseInformation.fromJson(mapJson['data']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if(statusCode != null) {
      map['statusCode'] = statusCode;
    }
    if(message != null) {
      map['message'] = message;
    }
    if (data != null) {
      map['data'] = data!.toJson();
    }

    return map;
  }

  @override
  String toString() {
    return 'CourseInfoResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' data: $data,'
        ' }';
  }

  CourseInfoResponse copyWith({
    int? statusCode,
    String? message,
    CourseInformation? data,
  }) {
    return CourseInfoResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  factory CourseInfoResponse.fromMap(Map<String, dynamic> map) {
    return CourseInfoResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null
          ? CourseInformation.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

//</editor-fold>
}
