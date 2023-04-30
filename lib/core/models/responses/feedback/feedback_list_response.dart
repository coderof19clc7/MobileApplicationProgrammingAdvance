import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/feedback/feed_back.dart';

class FeedbackListResponse extends BaseResponse {
  const FeedbackListResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  @override
  List<Object?> get props => [...super.props, data];

  factory FeedbackListResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return FeedbackListResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null ? Data.fromJson(mapJson['data']) : null,
    );
  }

  final Data? data;

  FeedbackListResponse copyWith({
    int? statusCode,
    String? message,
    Data? data,
  }) => FeedbackListResponse(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    data: data ?? this.data,
  );

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

  @override
  String toString() {
    return 'FeedbackListResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' data: $data'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory FeedbackListResponse.fromMap(Map<String, dynamic> map) {
    return FeedbackListResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null ? Data.fromMap(map['data'] as Map<String, dynamic>) : null,
    );
  }
}

@immutable
class Data {
  const Data({
    this.count,
    this.rows,
  });

  factory Data.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return Data(
      count: mapJson['count'] as num?,
      rows: mapJson['rows'] != null
          ? (mapJson['rows'] as List).map(FeedBack.fromJson).toList()
          : null,
    );
  }

  final num? count;
  final List<FeedBack>? rows;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data &&
          runtimeType == other.runtimeType &&
          count == other.count &&
          listEquals(rows, other.rows);

  @override
  int get hashCode => count.hashCode ^ rows.hashCode;

  Data copyWith({  num? count,
    List<FeedBack>? rows,
  }) => Data(  count: count ?? this.count,
    rows: rows ?? this.rows,
  );

  @override
  String toString() {
    return 'Data{'
        ' count: $count,'
        ' rows: $rows'
        ' }';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (rows != null) {
      map['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'rows': rows?.map((e) => e.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      count: map['count'] as num,
      rows: map['rows'] != null
          ? (map['rows'] as List).map((e) => FeedBack.fromMap(e as Map<String, dynamic>)).toList()
          : null,
    );
  }
}
