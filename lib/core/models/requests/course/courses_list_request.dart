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
    this.levels,
    this.sortValue,
  });

  String toQueryString() {
    var queryString = '?';
    if (page != null) queryString += 'page=$page&';
    if (size != null) queryString += 'size=$size&';
    if (q != null) queryString += 'q=$q&';
    if (categoriesId != null) {
      final categoriesQueryList = categoriesId?.map((e) {
        return '${ApiConstants.categoriesId}=$e&';
      }).toList() ?? <String>[];
      queryString += categoriesQueryList.join();
    }
    if (levels != null) {
      final levelsQueryList = levels?.map((e) {
        return '${ApiConstants.levels}=$e&';
      }).toList() ?? <String>[];
      queryString += levelsQueryList.join();
    }
    if (sortValue != null && sortValue != 0) {
      final sortQuery = (sortValue == 1 ? 'asc' : 'desc').toUpperCase();
      queryString += '${ApiConstants.order}=level&${ApiConstants.orderBy}=$sortQuery&';
    }
    return queryString.substring(0, queryString.length - 1);
  }

  factory CoursesListRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return CoursesListRequest(
      page: mapJson['page'] as num?,
      size: mapJson['size'] as num?,
      q: mapJson['q'] as String?,
      categoriesId: mapJson[ApiConstants.categoriesId] != null
          ? (mapJson[ApiConstants.categoriesId] as List).map((e) => e.toString()).toList()
          : null,
      levels: mapJson[ApiConstants.levels] != null
          ? (mapJson[ApiConstants.levels] as List).map((e) => e as int).toList()
          : null,
      sortValue: mapJson[ApiConstants.orderBy] as int?,
    );
  }

  final num? page;
  final num? size;
  final String? q;
  final List<String>? categoriesId;
  final List<int>? levels;
  final int? sortValue;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['size'] = size;
    if (q?.isNotEmpty == true) map['q'] = q;
    if (categoriesId != null) map[ApiConstants.categoriesId] = categoriesId;
    if (levels != null) map[ApiConstants.levels] = levels;
    if (sortValue != null) map[ApiConstants.orderBy] = sortValue;
    return map;
  }

  @override
  String toString() {
    return 'CoursesListRequest{'
        ' page: $page,'
        ' size: $size,'
        ' q: $q,'
        ' categoriesId: $categoriesId,'
        ' levels: $levels,'
        ' sortValue: $sortValue,'
        ' }';
  }

  CoursesListRequest copyWith({
    num? page,
    num? size,
    String? q,
    List<String>? categoriesId,
    List<int>? levels,
    int? sortValue,
  }) {
    return CoursesListRequest(
      page: page ?? this.page,
      size: size ?? this.size,
      q: q ?? this.q,
      categoriesId: categoriesId ?? this.categoriesId,
      levels: levels ?? this.levels,
      sortValue: sortValue ?? this.sortValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'size': size,
      'q': q,
      'categoriesId': categoriesId,
      'levels': levels,
      'sortValue': sortValue,
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
      levels: map[ApiConstants.levels] != null 
          ? (map[ApiConstants.levels] as List).map((e) => e as int).toList() 
          : null,
      sortValue: map[ApiConstants.orderBy] as int?,
    );
  }
}
