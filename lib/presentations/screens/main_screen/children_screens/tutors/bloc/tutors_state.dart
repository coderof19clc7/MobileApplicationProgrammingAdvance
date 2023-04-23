part of 'tutors_cubit.dart';

@immutable
class TutorsState extends WidgetState {
  final int nextPage;
  final bool isLoadingMore;
  final int total;
  final List<TutorInfo?> listTutors;
  final Filters? filters;
  final String? searchText;
  final int sortValue;

  @override
  WidgetState fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return TutorsState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      nextPage: mapJson['nextPage'] as int? ?? 1,
      isLoadingMore: mapJson['isLoadingMore'] as bool? ?? false,
      total: mapJson['total'] as int? ?? 0,
      listTutors: mapJson['listTutors'] != null
          ? (mapJson['listTutors'] as List).map((e) {
            return e != null ? TutorInfo.fromJson(e) : null;
      }).toList()
          : <TutorInfo>[],
      filters: mapJson['filters'] != null
          ? Filters.fromJson(mapJson['filters'])
          : null,
      searchText: mapJson['searchText'] as String?,
      sortValue: mapJson['sortValue'] as int? ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['nextPage'] = nextPage;
    map['isLoadingMore'] = isLoadingMore;
    map['total'] = total;
    map['listTutors'] = listTutors.map((e) => e?.toJson()).toList();
    map['filters'] = filters?.toJson();
    map['searchText'] = searchText;
    map['sortValue'] = sortValue;
    return map;
  }

  @override
  List<Object?> get props => [
    ...super.props,
    nextPage,
    isLoadingMore,
    total,
    listTutors,
    filters,
    searchText,
    sortValue,
  ];

  @override
  bool operator ==(Object other) => identical(this, other)
      || super == other && other is TutorsState
      && runtimeType == other.runtimeType
      && nextPage == other.nextPage
      && isLoadingMore == other.isLoadingMore
      && total == other.total
      && listTutors == other.listTutors
      && filters == other.filters
      && searchText == other.searchText
      && sortValue == other.sortValue;

  @override
  int get hashCode => isLoading.hashCode
      ^ needNavigateToLogin.hashCode
      ^ basicStatusFToastState.hashCode
      ^ nextPage.hashCode
      ^ isLoadingMore.hashCode
      ^ total.hashCode
      ^ listTutors.hashCode
      ^ filters.hashCode
      ^ searchText.hashCode
      ^ sortValue.hashCode;

//<editor-fold desc="Data Methods">
  const TutorsState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.nextPage = 1,
    this.isLoadingMore = false,
    this.total = 0,
    this.listTutors = const <TutorInfo?>[null, null, null],
    this.filters,
    this.searchText,
    this.sortValue = 0,
  });

  @override
  String toString() {
    return 'TutorListState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' nextPage: $nextPage,'
        ' isLoadingMore: $isLoadingMore,'
        ' total: $total,'
        ' listTutors: $listTutors,'
        ' filters: $filters,'
        ' searchText: $searchText,'
        ' sortValue: $sortValue,'
        ' }';
  }

  TutorsState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? nextPage,
    bool? isLoadingMore,
    int? total,
    List<TutorInfo?>? listTutors,
    Filters? filters,
    String? searchText,
    int? sortValue,
  }) {
    return TutorsState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      nextPage: nextPage ?? this.nextPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      total: total ?? this.total,
      listTutors: listTutors ?? this.listTutors,
      filters: filters ?? this.filters,
      searchText: searchText ?? this.searchText,
      sortValue: sortValue ?? this.sortValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'nextPage': nextPage,
      'isLoadingMore': isLoadingMore,
      'total': total,
      'listTutors': listTutors.map((e) => e?.toMap()).toList(),
      'filters': filters?.toMap(),
      'searchText': searchText,
      'sortValue': sortValue,
    };
  }

  factory TutorsState.fromMap(Map<String, dynamic> map) {
    return TutorsState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      nextPage: map['nextPage'] as int? ?? 1,
      isLoadingMore: map['isLoadingMore'] as bool? ?? false,
      total: map['total'] as int? ?? 0,
      listTutors: map['listTutors'] != null
          ? (map['listTutors'] as List).map((e) {
            return e != null ? TutorInfo.fromMap(e as Map<String, dynamic>) : null;
          }).toList()
          : <TutorInfo>[],
      filters: map['filters'] != null
          ? Filters.fromMap(map['filters'] as Map<String, dynamic>)
          : null,
      searchText: map['searchText'] as String?,
      sortValue: map['sortValue'] as int? ?? 0,
    );
  }


//</editor-fold>
}

class TutorsInitialState extends TutorsState {
  TutorsInitialState() : super(
    filters: Filters.defaultFilters(),
  );
}
