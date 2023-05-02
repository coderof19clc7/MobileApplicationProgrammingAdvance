part of 'upcoming_cubit.dart';

@immutable
class UpcomingState extends WidgetState {
  final bool isLoadingMore;
  final bool isLoadingTotalCall;
  final int nextPage, totalCall, total, currentTotal;
  final List<GroupedBookingInfo?> groupedBookingInfoList;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return UpcomingState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      isLoadingMore: mapJson['isLoadingMore'] as bool? ?? false,
      isLoadingTotalCall: mapJson['isLoadingTotalCall'] as bool? ?? false,
      nextPage: mapJson['nextPage'] as int? ?? 1,
      totalCall: mapJson['totalLearn'] as int? ?? 0,
      total: mapJson['total'] as int? ?? 0,
      currentTotal: mapJson['currentTotal'] as int? ?? 0,
      groupedBookingInfoList: mapJson['groupedBookingInfoList'] != null
          ? (mapJson['groupedBookingInfoList'] as List).map(GroupedBookingInfo.fromJson).toList()
          : [null, null, null],
      // groupedBookingInfoList: mapJson['groupedBookingInfoList'] != null
      //     ? (mapJson['groupedBookingInfoList'] as List<dynamic>)
      //         .map((e) => (e as List<dynamic>)
      //             .map((e) => e != null ? BookingInfo.fromJson(e) : null)
      //             .toList())
      //         .toList()
      //     : const <List<BookingInfo?>?>[null, null, null],
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
    map['isLoadingMore'] = isLoadingMore;
    map['isLoadingTotalCall'] = isLoadingTotalCall;
    map['nextPage'] = nextPage;
    map['totalLearn'] = totalCall;
    map['total'] = total;
    map['currentTotal'] = currentTotal;
    map['groupedBookingInfoList'] = groupedBookingInfoList
        .map((e) => e?.bookingInfoList?.map((e) => e?.toJson()).toList())
        .toList();
    return map;
  }

//<editor-fold desc="Data Methods">
  const UpcomingState({
    super.isLoading,
    super.needNavigateToLogin,
    super.basicStatusFToastState,
    this.isLoadingMore = false,
    this.isLoadingTotalCall = false,
    this.nextPage = 1,
    this.totalCall = 0,
    this.total = 0,
    this.currentTotal = 0,
    this.groupedBookingInfoList = const <GroupedBookingInfo?>[null, null, null],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpcomingState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          needNavigateToLogin == other.needNavigateToLogin &&
          basicStatusFToastState == other.basicStatusFToastState &&
          isLoadingMore == other.isLoadingMore &&
          isLoadingTotalCall == other.isLoadingTotalCall &&
          nextPage == other.nextPage &&
          totalCall == other.totalCall &&
          total == other.total &&
          currentTotal == other.currentTotal &&
          listEquals(groupedBookingInfoList, other.groupedBookingInfoList));

  @override
  int get hashCode =>
      isLoading.hashCode ^
      needNavigateToLogin.hashCode ^
      basicStatusFToastState.hashCode ^
      isLoadingMore.hashCode ^
      isLoadingTotalCall.hashCode ^
      nextPage.hashCode ^
      totalCall.hashCode ^
      total.hashCode ^
      currentTotal.hashCode ^
      groupedBookingInfoList.hashCode;

  @override
  String toString() {
    return 'UpcomingState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' isLoadingMore: $isLoadingMore,'
        ' isLoadingTotalCall: $isLoadingTotalCall,'
        ' nextPage: $nextPage,'
        ' totalLearn: $totalCall,'
        ' total: $total,'
        ' currentTotal: $currentTotal,'
        ' groupedBookingInfoList: $groupedBookingInfoList,'
        ' }';
  }

  UpcomingState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    bool? isLoadingMore,
    bool? isLoadingTotalCall,
    int? nextPage,
    int? totalCall,
    int? total,
    int? currentTotal,
    List<GroupedBookingInfo?>? groupedBookingInfoList,
  }) {
    return UpcomingState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isLoadingTotalCall: isLoadingTotalCall ?? this.isLoadingTotalCall,
      nextPage: nextPage ?? this.nextPage,
      totalCall: totalCall ?? this.totalCall,
      total: total ?? this.total,
      currentTotal: currentTotal ?? this.currentTotal,
      groupedBookingInfoList: groupedBookingInfoList ?? this.groupedBookingInfoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'isLoadingMore': isLoadingMore,
      'isLoadingTotalCall': isLoadingTotalCall,
      'nextPage': nextPage,
      'totalLearn': totalCall,
      'total': total,
      'currentTotal': currentTotal,
      'groupedBookingInfoList': groupedBookingInfoList.map(
        (e) => e?.bookingInfoList?.map((e) => e?.toMap()).toList(),
      ).toList(),
    };
  }

  factory UpcomingState.fromMap(Map<String, dynamic> map) {
    return UpcomingState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      isLoadingMore: map['isLoadingMore'] as bool? ?? false,
      isLoadingTotalCall: map['isLoadingTotalCall'] as bool? ?? false,
      nextPage: map['nextPage'] as int? ?? 1,
      totalCall: map['totalLearn'] as int? ?? 0,
      total: map['total'] as int? ?? 0,
      currentTotal: map['currentTotal'] as int? ?? 0,
      groupedBookingInfoList: map['groupedBookingInfoList'] != null
          ? (map['groupedBookingInfoList'] as List).map(
        (e) => GroupedBookingInfo.fromMap(e as Map<String, dynamic>),
      ).toList()
          : [null, null, null],
      // groupedBookingInfoList: map['groupedBookingInfoList'] != null
      //     ? (map['groupedBookingInfoList'] as List<dynamic>)
      //         .map((e) => (e as List<dynamic>)
      //             .map((e) => e != null ? BookingInfo.fromMap(e as Map<String, dynamic>) : null)
      //             .toList())
      //         .toList()
      //     : const <List<BookingInfo?>?>[null, null, null],
    );
  }

//</editor-fold>
}
