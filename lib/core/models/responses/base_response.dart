import 'package:one_one_learn/core/models/base_model.dart';

class BaseResponse extends BaseModel {
  final int? statusCode;
  final String? message;

  const BaseResponse({this.message, this.statusCode});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

  @override
  List<Object?> get props => [statusCode, message];
}
