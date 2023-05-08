import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/report/save_report_lesson_info.dart';

class SaveReportLessonResponse extends BaseResponse {
  const SaveReportLessonResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  @override
  List<Object?> get props => [...super.props, data];

  factory SaveReportLessonResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    SaveReportLessonInfo? data;
    if (mapJson['data'] != null && mapJson['data'] !is List<int>) {
      data = SaveReportLessonInfo.fromJson(mapJson['data']);
    }
    return SaveReportLessonResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: data,
    );

  }
  final SaveReportLessonInfo? data;

  SaveReportLessonResponse copyWith({
    int? statusCode,
    String? message,
    SaveReportLessonInfo? data,
  }) => SaveReportLessonResponse(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  String toString() {
    return 'SaveReportLessonResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' data: $data'
        ' }';
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

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory SaveReportLessonResponse.fromMap(Map<String, dynamic> map) {
    return SaveReportLessonResponse(
        statusCode: map['statusCode'] as int?,
        message: map['message'] as String?,
        data: map['data'] != null
            ? SaveReportLessonInfo.fromMap(map['data'] as Map<String, dynamic>)
            : null
    );
  }
}
