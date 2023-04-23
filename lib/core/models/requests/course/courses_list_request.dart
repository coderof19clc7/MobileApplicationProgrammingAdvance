import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/base_request.dart';

class CoursesListRequest extends BaseRequest {
  @override
  List<Object?> get props => [page, size];

//<editor-fold desc="Data Methods">
  const CoursesListRequest({
    this.page,
    this.size,
    this.q,
    this.categoriesId,
  });

  factory CoursesListRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return CoursesListRequest(
      page: mapJson['page'] as num?,
      size: mapJson['size'] as num?,
      q: mapJson['q'] as String?,
      categoriesId: mapJson[ApiConstants.categoriesId] != null
          ? (mapJson[ApiConstants.categoriesId] as List).map((e) => e.toString()).toList()
          : null,
    );
  }

  final num? page;
  final num? size;
  final String? q;
  final List<String>? categoriesId;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['size'] = size;
    if (q?.isNotEmpty == true) map['q'] = q;
    if (categoriesId != null) map[ApiConstants.categoriesId] = categoriesId;
    return map;
  }

  @override
  String toString() {
    return 'CoursesListRequest{'
        ' page: $page,'
        ' size: $size,'
        ' q: $q,'
        ' categoriesId: $categoriesId,'
        ' }';
  }

  CoursesListRequest copyWith({
    num? page,
    num? size,
    String? q,
    List<String>? categoriesId,
  }) {
    return CoursesListRequest(
      page: page ?? this.page,
      size: size ?? this.size,
      q: q ?? this.q,
      categoriesId: categoriesId ?? this.categoriesId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'size': size,
      'q': q,
      'categoriesId': categoriesId,
    };
  }

  factory CoursesListRequest.fromMap(Map<String, dynamic> map) {
    return CoursesListRequest(
      page: map['page'] as num?,
      size: map['size'] as num?,
      q: map['q'] as String?,
      categoriesId: map[ApiConstants.categoriesId] != null
          ? (map[ApiConstants.categoriesId] as List).map((e) => e.toString()).toList()
          : null,
    );
  }
}
