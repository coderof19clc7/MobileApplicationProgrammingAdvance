import 'package:one_one_learn/core/models/requests/base_request.dart';

class BookedClassesRequest extends BaseRequest {
  final int? page;
  final int? perPage;
  final int? dateTimeGte;
  final String? orderBy;
  final String? sortBy;

  const BookedClassesRequest({
    this.page,
    this.perPage,
    this.dateTimeGte,
    this.orderBy,
    this.sortBy,
  });

  BookedClassesRequest copyWith({
    int? page,
    int? perPage,
    int? dateTimeGte,
    String? orderBy,
    String? sortBy,
  }) {
    return BookedClassesRequest(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      dateTimeGte: dateTimeGte ?? this.dateTimeGte,
      orderBy: orderBy ?? this.orderBy,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  factory BookedClassesRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return BookedClassesRequest(
      page: mapJson['page'] as int?,
      perPage: mapJson['perPage'] as int?,
      dateTimeGte: mapJson['dateTimeGte'] as int?,
      orderBy: mapJson['orderBy'] as String?,
      sortBy: mapJson['sortBy'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (page != null) {
      map['page'] = page;
    }
    if (perPage != null) {
      map['perPage'] = perPage;
    }
    if (dateTimeGte != null) {
      map['dateTimeGte'] = dateTimeGte;
    }
    if (orderBy != null) {
      map['orderBy'] = orderBy;
    }
    if (sortBy != null) {
      map['sortBy'] = sortBy;
    }
    return map;
  }

  @override
  List<Object?> get props => [page, perPage, dateTimeGte, orderBy, sortBy];

  @override
  String toString() {
    return 'ScheduleQueryRequest{'
        ' page: $page,'
        ' perPage: $perPage'
        ' dateTimeGte: $dateTimeGte,'
        ' orderBy: $orderBy,'
        ' sortBy: $sortBy,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'perPage': perPage,
      'dateTimeGte': dateTimeGte,
      'orderBy': orderBy,
      'sortBy': sortBy,
    };
  }

  factory BookedClassesRequest.fromMap(Map<String, dynamic> map) {
    return BookedClassesRequest(
      page: map['page'] as int?,
      perPage: map['perPage'] as int?,
      dateTimeGte: map['dateTimeGte'] as int?,
      orderBy: map['orderBy'] as String?,
      sortBy: map['sortBy'] as String?,
    );
  }
}
