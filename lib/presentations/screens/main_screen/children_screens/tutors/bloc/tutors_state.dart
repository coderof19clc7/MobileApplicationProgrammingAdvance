part of 'tutors_cubit.dart';

@immutable
class TutorsState extends WidgetState {
  final int nextPage;
  final bool isRefreshing;
  final int total;
  final List<TutorInfo?> listTutors;
  final Filters? filters;
  final bool isDescending;

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
      isRefreshing: mapJson['isRefreshing'] as bool? ?? false,
      total: mapJson['total'] as int? ?? 0,
      listTutors: mapJson['listTutors'] != null
          ? (mapJson['listTutors'] as List).map((e) {
            return e != null ? TutorInfo.fromJson(e) : null;
      }).toList()
          : <TutorInfo>[],
      filters: mapJson['filters'] != null
          ? Filters.fromJson(mapJson['filters'])
          : null,
      isDescending: mapJson['isDescending'] as bool? ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['nextPage'] = nextPage;
    map['isRefreshing'] = isRefreshing;
    map['total'] = total;
    map['listTutors'] = listTutors.map((e) => e?.toJson()).toList();
    map['filters'] = filters?.toJson();
    map['isDescending'] = isDescending;
    return map;
  }

  @override
  List<Object?> get props => [
    ...super.props,
    nextPage,
    isRefreshing,
    total,
    listTutors,
    filters,
    isDescending,
  ];

//<editor-fold desc="Data Methods">
  const TutorsState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.nextPage = 1,
    this.isRefreshing = false,
    this.total = 0,
    this.listTutors = const <TutorInfo?>[null, null, null],
    this.filters,
    this.isDescending = true,
  });

  @override
  String toString() {
    return 'TutorListState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' nextPage: $nextPage,'
        ' isRefreshing: $isRefreshing,'
        ' total: $total,'
        ' listTutors: $listTutors,'
        ' filters: $filters,'
        ' isDescending: $isDescending,'
        ' }';
  }

  TutorsState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    int? nextPage,
    bool? isRefreshing,
    int? total,
    List<TutorInfo?>? listTutors,
    Filters? filters,
    bool? isDescending,
  }) {
    return TutorsState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      nextPage: nextPage ?? this.nextPage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      total: total ?? this.total,
      listTutors: listTutors ?? this.listTutors,
      filters: filters ?? this.filters,
      isDescending: isDescending ?? this.isDescending,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'nextPage': nextPage,
      'isRefreshing': isRefreshing,
      'total': total,
      'listTutors': listTutors.map((e) => e?.toMap()).toList(),
      'filters': filters?.toMap(),
      'isDescending': isDescending,
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
      isRefreshing: map['isRefreshing'] as bool? ?? false,
      total: map['total'] as int? ?? 0,
      listTutors: map['listTutors'] != null
          ? (map['listTutors'] as List).map((e) {
            return e != null ? TutorInfo.fromMap(e as Map<String, dynamic>) : null;
          }).toList()
          : <TutorInfo>[],
      filters: map['filters'] != null
          ? Filters.fromMap(map['filters'] as Map<String, dynamic>)
          : null,
      isDescending: map['isDescending'] as bool? ?? false,
    );
  }

//</editor-fold>
}
