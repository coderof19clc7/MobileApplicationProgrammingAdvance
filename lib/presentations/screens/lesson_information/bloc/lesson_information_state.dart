part of 'lesson_information_cubit.dart';

@immutable
class LessonInformationState extends WidgetState {
  const LessonInformationState({
    super.isLoading,
    super.needNavigateToLogin,
    super.basicStatusFToastState,
    required this.groupedBookingInfo,
  });

  final GroupedBookingInfo groupedBookingInfo;

  @override
  List<Object?> get props => [
    ...super.props,
    groupedBookingInfo,
  ];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return LessonInformationState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      groupedBookingInfo: mapJson['groupedBookingInfo'] != null
          ? GroupedBookingInfo.fromJson(mapJson['groupedBookingInfo'])
          : const GroupedBookingInfo(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    if (basicStatusFToastState != null) {
      map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    }
    map['groupedBookingInfo'] = groupedBookingInfo.toJson();
    return map;
  }

  LessonInformationState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    GroupedBookingInfo? groupedBookingInfo,
  }) {
    return LessonInformationState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      groupedBookingInfo: groupedBookingInfo ?? this.groupedBookingInfo,
    );
  }


  @override
  String toString() {
    return 'LessInformationState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' groupedBookingInfo: $groupedBookingInfo'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'groupedBookingInfo': groupedBookingInfo.toMap(),
    };
  }

  factory LessonInformationState.fromMap(Map<String, dynamic> map) {
    return LessonInformationState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      groupedBookingInfo: map['groupedBookingInfo'] != null
          ? GroupedBookingInfo.fromMap(map['groupedBookingInfo'] as Map<String, dynamic>)
          : const GroupedBookingInfo(),
    );
  }
}
