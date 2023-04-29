part of 'tutor_information_cubit.dart';

@immutable
class TutorInformationState extends WidgetState {
  const TutorInformationState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.isLoadingData = false,
    required this.tutorId,
    this.tutorInformation,
  });

  final bool isLoadingData;
  final String tutorId;
  final TutorInfo? tutorInformation;

  @override
  List<Object?> get props => [
    isLoading,
    needNavigateToLogin,
    basicStatusFToastState,
    isLoadingData,
    tutorId,
    tutorInformation,
  ];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return TutorInformationState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      isLoadingData: mapJson['isLoadingData'] as bool? ?? false,
      tutorId: mapJson['tutorId'] as String? ?? '',
      tutorInformation: mapJson['tutorInformation'] != null
          ? TutorInfo.fromJson(mapJson['tutorInformation'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['isLoadingData'] = isLoadingData;
    map['tutorId'] = tutorId;
    map['tutorInformation'] = tutorInformation?.toJson();

    return map;
  }

  TutorInformationState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    bool? isLoadingData,
    String? tutorId,
    TutorInfo? tutorInformation,
  }) {
    return TutorInformationState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      isLoadingData: isLoadingData ?? this.isLoadingData,
      tutorId: tutorId ?? this.tutorId,
      tutorInformation: tutorInformation ?? this.tutorInformation,
    );
  }

  @override
  String toString() {
    return 'TutorInformationState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' isLoadingData: $isLoadingData,'
        ' tutorId: $tutorId,'
        ' tutorInformation: $tutorInformation'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'isLoadingData': isLoadingData,
      'tutorId': tutorId,
      'tutorInformation': tutorInformation?.toMap(),
    };
  }

  factory TutorInformationState.fromMap(Map<String, dynamic> map) {
    return TutorInformationState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(
              map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      isLoadingData: map['isLoadingData'] as bool? ?? false,
      tutorId: map['tutorId'] as String? ?? '',
      tutorInformation: map['tutorInformation'] as TutorInfo?,
    );
  }
}
