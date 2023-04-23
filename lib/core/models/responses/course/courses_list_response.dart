import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/course/course_information.dart';

class CoursesListResponse extends BaseResponse {

  @override
  List<Object?> get props => [...super.props, data];

//<editor-fold desc="Data Methods">
  const CoursesListResponse({
    super.statusCode,
    super.message,
    this.data,
  });

  factory CoursesListResponse.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return CoursesListResponse(
      statusCode: mapJson['statusCode'] as int?,
      message: mapJson['message'] as String?,
      data: mapJson['data'] != null ? Data.fromJson(mapJson['data']) : null,
    );
  }

  final Data? data;

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
    return 'CoursesListResponse{'
        ' statusCode: $statusCode,'
        ' message: $message,'
        ' data: $data,'
        ' }';
  }

  CoursesListResponse copyWith({
    int? statusCode,
    String? message,
    Data? data,
  }) {
    return CoursesListResponse(
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

  factory CoursesListResponse.fromMap(Map<String, dynamic> map) {
    return CoursesListResponse(
      statusCode: map['statusCode'] as int?,
      message: map['message'] as String?,
      data: map['data'] != null ? Data.fromMap(map['data'] as Map<String, dynamic>) : null,
    );
  }

//</editor-fold>
}

class Data {

//<editor-fold desc="Data Methods">
  Data({
    this.count,
    this.rows,
  });

  Data.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    count = mapJson['count'] as num?;
    if (mapJson['rows'] != null) {
      rows = [];
      for (final v in mapJson['rows'] as List) {
        rows?.add(CourseInformation.fromJson(v));
      }
    }
  }

  num? count;
  List<CourseInformation>? rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (rows != null) {
      map['rows'] = rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Data &&
          runtimeType == other.runtimeType &&
          count == other.count &&
          listEquals(rows, other.rows)
      );

  @override
  int get hashCode => count.hashCode ^ rows.hashCode;

  @override
  String toString() {
    return 'Data{ count: $count,' + ' rows: $rows, }';
  }

  Data copyWith({
    num? count,
    List<CourseInformation>? rows,
  }) {
    return Data(
      count: count ?? this.count,
      rows: rows ?? this.rows,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'rows': rows?.map((e) => e.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      count: map['count'] as num?,
      rows: map['rows'] != null
          ? (map['rows'] as List).map(
            (e) => CourseInformation.fromMap(e as Map<String, dynamic>),
      ).toList()
          : null,
    );
  }

//</editor-fold>
}