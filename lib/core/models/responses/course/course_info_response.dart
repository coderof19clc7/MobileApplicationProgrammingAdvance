import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/course/course_information.dart';

class CourseInfoResponse extends BaseResponse {
  final CourseInformation? data;

  @override
  List<Object?> get props => [super.props, data];

  const CourseInfoResponse({
    super.message,
    this.data,
  });

  factory CourseInfoResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    return CourseInfoResponse(
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null ? CourseInformation.fromJson(json['data']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (data != null) {
      map['data'] = data!.toJson();
    }

    return map;
  }
}
