import 'package:one_one_learn/core/models/requests/base_request.dart';

class BookingListRequest extends BaseRequest {
  final int? page;
  final int? perPage;
  final int? dateTimeGte;
  final int? dateTimeLte;
  final String? orderBy;
  final String? sortBy;

  const BookingListRequest({
    this.page,
    this.perPage,
    this.dateTimeGte,
    this.dateTimeLte,
    this.orderBy,
    this.sortBy,
  });

  BookingListRequest copyWith({
    int? page,
    int? perPage,
    int? dateTimeGte,
    int? dateTimeLte,
    String? orderBy,
    String? sortBy,
  }) {
    return BookingListRequest(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      dateTimeGte: dateTimeGte ?? this.dateTimeGte,
      dateTimeLte: dateTimeLte ?? this.dateTimeLte,
      orderBy: orderBy ?? this.orderBy,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  factory BookingListRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return BookingListRequest(
      page: mapJson['page'] as int?,
      perPage: mapJson['perPage'] as int?,
      dateTimeGte: mapJson['dateTimeGte'] as int?,
      dateTimeLte: mapJson['dateTimeLte'] as int?,
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
    if (dateTimeLte != null) {
      map['dateTimeLte'] = dateTimeLte;
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
  List<Object?> get props => [page, perPage, dateTimeGte, dateTimeLte, orderBy, sortBy];

  @override
  String toString() {
    return 'BookedClassesRequest{'
        ' page: $page,'
        ' perPage: $perPage'
        ' dateTimeGte: $dateTimeGte,'
        ' dateTimeLte: $dateTimeLte,'
        ' orderBy: $orderBy,'
        ' sortBy: $sortBy,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'perPage': perPage,
      'dateTimeGte': dateTimeGte,
      'dateTimeLte': dateTimeLte,
      'orderBy': orderBy,
      'sortBy': sortBy,
    };
  }

  factory BookingListRequest.fromMap(Map<String, dynamic> map) {
    return BookingListRequest(
      page: map['page'] as int?,
      perPage: map['perPage'] as int?,
      dateTimeGte: map['dateTimeGte'] as int?,
      dateTimeLte: map['dateTimeLte'] as int?,
      orderBy: map['orderBy'] as String?,
      sortBy: map['sortBy'] as String?,
    );
  }
}
