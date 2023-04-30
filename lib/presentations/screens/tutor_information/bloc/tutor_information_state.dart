part of 'tutor_information_cubit.dart';

@immutable
class TutorInformationState extends WidgetState {
  const TutorInformationState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.isLoadingData = false,
    this.isLoadingMoreFeedback = false,
    required this.tutorId,
    this.tutorInformation,
    this.feedbackNextPage = 1,
    this.feedbackTotal = 0,
    this.feedbackList = const <FeedBack?>[null, null, null],
  });

  final bool isLoadingData, isLoadingMoreFeedback;
  final String tutorId;
  final TutorInfo? tutorInformation;
  final int feedbackNextPage, feedbackTotal;
  final List<FeedBack?> feedbackList;

  @override
  List<Object?> get props => [
    isLoading,
    needNavigateToLogin,
    basicStatusFToastState,
    isLoadingData,
    isLoadingMoreFeedback,
    tutorId,
    tutorInformation,
    feedbackNextPage,
    feedbackTotal,
    feedbackList,
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
      isLoadingMoreFeedback: mapJson['isLoadingMoreFeedback'] as bool? ?? false,
      tutorId: mapJson['tutorId'] as String? ?? '',
      tutorInformation: mapJson['tutorInformation'] != null
          ? TutorInfo.fromJson(mapJson['tutorInformation'])
          : null,
      feedbackNextPage: mapJson['feedbackNextPage'] as int? ?? 1,
      feedbackTotal: mapJson['feedbackTotal'] as int? ?? 0,
      feedbackList: mapJson['feedbackList'] != null
          ? (mapJson['feedbackList'] as List).map(
        (e) => e != null ? FeedBack.fromJson(e) : null
      ).toList()
          : const <FeedBack?>[null, null, null],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['isLoadingData'] = isLoadingData;
    map['isLoadingMoreFeedback'] = isLoadingMoreFeedback;
    map['tutorId'] = tutorId;
    map['tutorInformation'] = tutorInformation?.toJson();
    map['feedbackNextPage'] = feedbackNextPage;
    map['feedbackTotal'] = feedbackTotal;
    map['feedbackList'] = feedbackList.map((e) => e?.toJson()).toList();

    return map;
  }

  TutorInformationState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    bool? isLoadingData,
    bool? isLoadingMoreFeedback,
    String? tutorId,
    TutorInfo? tutorInformation,
    int? feedbackNextPage,
    int? feedbackTotal,
    List<FeedBack?>? feedbackList,
  }) {
    return TutorInformationState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      isLoadingData: isLoadingData ?? this.isLoadingData,
      isLoadingMoreFeedback: isLoadingMoreFeedback ?? this.isLoadingMoreFeedback,
      tutorId: tutorId ?? this.tutorId,
      tutorInformation: tutorInformation ?? this.tutorInformation,
      feedbackNextPage: feedbackNextPage ?? this.feedbackNextPage,
      feedbackTotal: feedbackTotal ?? this.feedbackTotal,
      feedbackList: feedbackList ?? this.feedbackList,
    );
  }

  @override
  String toString() {
    return 'TutorInformationState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' isLoadingData: $isLoadingData,'
        ' isLoadingMoreFeedback: $isLoadingMoreFeedback,'
        ' tutorId: $tutorId,'
        ' tutorInformation: $tutorInformation'
        ' feedbackNextPage: $feedbackNextPage,'
        ' feedbackTotal: $feedbackTotal,'
        ' feedbackList: $feedbackList,'
        ' }';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is TutorInformationState &&
          runtimeType == other.runtimeType &&
          isLoadingData == other.isLoadingData &&
          isLoadingMoreFeedback == other.isLoadingMoreFeedback &&
          tutorId == other.tutorId &&
          tutorInformation == other.tutorInformation &&
          feedbackNextPage == other.feedbackNextPage &&
          feedbackTotal == other.feedbackTotal &&
          listEquals(feedbackList, other.feedbackList);

  @override
  int get hashCode =>
      super.hashCode ^
      isLoadingData.hashCode ^
      isLoadingMoreFeedback.hashCode ^
      tutorId.hashCode ^
      tutorInformation.hashCode ^
      feedbackNextPage.hashCode ^
      feedbackTotal.hashCode ^
      feedbackList.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'isLoadingData': isLoadingData,
      'isLoadingMoreFeedback': isLoadingMoreFeedback,
      'tutorId': tutorId,
      'tutorInformation': tutorInformation?.toMap(),
      'feedbackNextPage': feedbackNextPage,
      'feedbackTotal': feedbackTotal,
      'feedbackList': feedbackList.map((e) => e?.toMap()).toList(),
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
      isLoadingMoreFeedback: map['isLoadingMoreFeedback'] as bool? ?? false,
      tutorId: map['tutorId'] as String? ?? '',
      tutorInformation: map['tutorInformation'] as TutorInfo?,
      feedbackNextPage: map['feedbackNextPage'] as int? ?? 1,
      feedbackTotal: map['feedbackTotal'] as int? ?? 0,
      feedbackList: map['feedbackList'] != null
          ? (map['feedbackList'] as List).map(
              (e) => e != null ? FeedBack.fromMap(e as Map<String, dynamic>) : null)
          .toList()
          : const <FeedBack?>[null, null, null],
    );
  }
}
