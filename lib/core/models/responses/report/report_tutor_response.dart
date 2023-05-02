import 'package:one_one_learn/core/models/responses/base_response.dart';

class ReportTutorResponse extends BaseResponse {
  const ReportTutorResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  @override
  List<Object?> get props => [...super.props, data];

  factory ReportTutorResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return ReportTutorResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null
          ? ReportTutorResponse.fromJson(mapJson['data'])
          : null,
    );

  }
  final ReportTutorResponse? data;

  ReportTutorResponse copyWith({
    int? statusCode,
    String? message,
    ReportTutorResponse? data,
  }) => ReportTutorResponse(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  @override
  String toString() {
    return 'ReportTutorResponse{'
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

  factory ReportTutorResponse.fromMap(Map<String, dynamic> map) {
    return ReportTutorResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null
          ? ReportTutorResponse.fromMap(map['data'] as Map<String, dynamic>)
          : null
    );
  }
}
