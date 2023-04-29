import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';

class TutorInfoResponse extends BaseResponse {
  final TutorInfo? data;

  @override
  List<Object?> get props => [super.props, data];

//<editor-fold desc="Data Methods">
  const TutorInfoResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  factory TutorInfoResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;

    return TutorInfoResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null ? TutorInfo.fromJson(mapJson['data']) : null,
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

  TutorInfoResponse copyWith({
    int? statusCode,
    String? message,
    TutorInfo? data,
  }) {
    return TutorInfoResponse(
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

  factory TutorInfoResponse.fromMap(Map<String, dynamic> map) {
    return TutorInfoResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null
          ? TutorInfo.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

//</editor-fold>
}
