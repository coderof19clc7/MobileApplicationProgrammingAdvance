import 'package:one_one_learn/core/models/requests/base_request.dart';

/// filters : {"specialties":["starters"],"nationality":{"isVietNamese":true,"isNative":true},"date":null,"tutoringTimeAvailable":[null,null]}
/// search : "teacher name"
/// page : "1"
/// perPage : 12
class TutorSearchRequest extends BaseRequest {

  @override
  List<Object?> get props => [filters, search, page, perPage];

//<editor-fold desc="Data Methods">
  const TutorSearchRequest({
    this.filters,
    this.search,
    this.page,
    this.perPage,
  });

  factory TutorSearchRequest.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return TutorSearchRequest(
      filters: mapJson['filters'] != null ? Filters.fromJson(mapJson['filters']) : null,
      search: mapJson['search'] as String?,
      page: mapJson['page'] as String?,
      perPage: mapJson['perPage'] as num?,
    );
  }

  final Filters? filters;
  final String? search;
  final String? page;
  final num? perPage;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (filters != null) {
      map['filters'] = filters?.toJson();
    }
    map['search'] = search;
    map['page'] = page;
    map['perPage'] = perPage;
    return map;
  }

  @override
  String toString() {
    return 'TutorSearchRequest{'
        ' filters: $filters,'
        ' search: $search,'
        ' page: $page,'
        ' perPage: $perPage,'
        ' }';
  }

  TutorSearchRequest copyWith({
    Filters? filters,
    String? search,
    String? page,
    num? perPage,
  }) {
    return TutorSearchRequest(
      filters: filters ?? this.filters,
      search: search ?? this.search,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filters': filters?.toMap(),
      'search': search,
      'page': page,
      'perPage': perPage,
    };
  }

  factory TutorSearchRequest.fromMap(Map<String, dynamic> map) {
    return TutorSearchRequest(
      filters: map['filters'] != null ? Filters.fromJson(map['filters']) : null,
      search: map['search'] as String?,
      page: map['page'] as String?,
      perPage: map['perPage'] as num?,
    );
  }

//</editor-fold>
}

/// specialties : ["starters"]
/// nationality : {"isVietNamese":true,"isNative":true}
/// date : null
/// tutoringTimeAvailable : [null,null]
class Filters {

//<editor-fold desc="Data Methods">
  Filters({
    this.specialties,
    this.nationality,
    required this.date,
    this.tutoringTimeAvailable,
  });

  Filters.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    specialties = mapJson['specialties'] != null
        ? (mapJson['specialties'] as List).map((e) => e.toString()).toList()
        : <String>[];
    nationality = mapJson['nationality'] != null
        ? Nationality.fromJson(mapJson['nationality']) : null;
    date = mapJson['date'];
    if (mapJson['tutoringTimeAvailable'] != null) {
      tutoringTimeAvailable = [];
      mapJson['tutoringTimeAvailable'].forEach((v) {
        tutoringTimeAvailable?.add(v.fromJson(v));
      });
    }
  }

  List<String>? specialties;
  Nationality? nationality;
  dynamic date;
  List<dynamic>? tutoringTimeAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['specialties'] = specialties;
    if (nationality != null) {
      map['nationality'] = nationality?.toJson();
    }
    map['date'] = date;
    if (tutoringTimeAvailable != null) {
      map['tutoringTimeAvailable'] = tutoringTimeAvailable?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Filters &&
          runtimeType == other.runtimeType &&
          specialties == other.specialties &&
          nationality == other.nationality &&
          date == other.date &&
          tutoringTimeAvailable == other.tutoringTimeAvailable);

  @override
  int get hashCode =>
      specialties.hashCode ^
      nationality.hashCode ^
      date.hashCode ^
      tutoringTimeAvailable.hashCode;

  @override
  String toString() {
    return 'Filters{'
        ' specialties: $specialties,'
        ' nationality: $nationality,'
        ' date: $date,'
        ' tutoringTimeAvailable: $tutoringTimeAvailable,'
        ' }';
  }

  Filters copyWith({
    List<String>? specialties,
    Nationality? nationality,
    dynamic date,
    List<dynamic>? tutoringTimeAvailable,
  }) {
    return Filters(
      specialties: specialties ?? this.specialties,
      nationality: nationality ?? this.nationality,
      date: date ?? this.date,
      tutoringTimeAvailable: tutoringTimeAvailable ?? this.tutoringTimeAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'specialties': specialties,
      'nationality': nationality?.toMap(),
      'date': date,
      'tutoringTimeAvailable': tutoringTimeAvailable?.map((e) => e.toMap()).toList(),
    };
  }

  factory Filters.fromMap(Map<String, dynamic> map) {
    List<dynamic>? tutoringTimeAvailable;
    if (map['tutoringTimeAvailable'] != null) {
      tutoringTimeAvailable = [];
      map['tutoringTimeAvailable'].forEach((v) {
        tutoringTimeAvailable?.add(v.fromJson(v));
      });
    }
    return Filters(
      specialties: map['specialties'] as List<String>,
      nationality: map['nationality'] != null
          ? Nationality.fromJson(map['nationality']) : null,
      date: map['date'] as dynamic,
      tutoringTimeAvailable: tutoringTimeAvailable,
    );
  }

//</editor-fold>
}

/// isVietNamese : true
/// isNative : true
class Nationality {
//<editor-fold desc="Data Methods">
  Nationality({
    this.isVietNamese,
    this.isNative,
  });

  Nationality.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    isVietNamese = mapJson['isVietNamese'] as bool?;
    isNative = mapJson['isNative'] as bool?;
  }
  bool? isVietNamese;
  bool? isNative;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isVietNamese'] = isVietNamese;
    map['isNative'] = isNative;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nationality &&
          runtimeType == other.runtimeType &&
          isVietNamese == other.isVietNamese &&
          isNative == other.isNative);

  @override
  int get hashCode => isVietNamese.hashCode ^ isNative.hashCode;

  @override
  String toString() {
    return 'Nationality{'
        ' isVietNamese: $isVietNamese,'
        ' isNative: $isNative,'
        ' }';
  }

  Nationality copyWith({
    bool? isVietNamese,
    bool? isNative,
  }) {
    return Nationality(
      isVietNamese: isVietNamese ?? this.isVietNamese,
      isNative: isNative ?? this.isNative,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isVietNamese': isVietNamese,
      'isNative': isNative,
    };
  }

  factory Nationality.fromMap(Map<String, dynamic> map) {
    return Nationality(
      isVietNamese: map['isVietNamese'] as bool?,
      isNative: map['isNative'] as bool?,
    );
  }

//</editor-fold>
}