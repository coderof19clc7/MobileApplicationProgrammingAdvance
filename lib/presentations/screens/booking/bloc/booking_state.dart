part of 'booking_cubit.dart';

class BookingState extends WidgetState {
  const BookingState({
    super.isLoading = false,
    super.needNavigateToLogin,
    super.basicStatusFToastState,
    this.tutorId = '',
    this.tutorName = '',
    this.scheduleTable = const ScheduleTable(days: []),
    this.currentStartDateTime,
    this.currentEndDateTime,
  });

  @override
  List<Object?> get props => [
    ...super.props,
    tutorId,
    tutorName,
    scheduleTable,
    currentStartDateTime,
    currentEndDateTime,
  ];

  final String tutorId, tutorName;
  final ScheduleTable scheduleTable;
  final DateTime? currentStartDateTime;
  final DateTime? currentEndDateTime;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return BookingState(
      isLoading: mapJson['isLoading'] as bool? ?? true,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      tutorId: mapJson['tutorId'] as String? ?? '',
      tutorName: mapJson['tutorName'] as String? ?? '',
      scheduleTable: mapJson['scheduleTable'] != null
          ? ScheduleTable.fromJson(mapJson['scheduleTable'])
          : const ScheduleTable(days: []),
      currentStartDateTime: mapJson['currentStartDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(mapJson['currentStartDateTime'] as int)
          : null,
      currentEndDateTime: mapJson['currentEndDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(mapJson['currentEndDateTime'] as int)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['tutorId'] = tutorId;
    map['tutorName'] = tutorName;
    map['scheduleTable'] = scheduleTable.toJson();
    map['currentStartDateTime'] = currentStartDateTime?.millisecondsSinceEpoch;
    map['currentEndDateTime'] = currentEndDateTime?.millisecondsSinceEpoch;
    return map;
  }

  BookingState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    String? tutorId,
    String? tutorName,
    ScheduleTable? scheduleTable,
    DateTime? currentStartDateTime,
    DateTime? currentEndDateTime,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      tutorId: tutorId ?? this.tutorId,
      tutorName: tutorName ?? this.tutorName,
      scheduleTable: scheduleTable ?? this.scheduleTable,
      currentStartDateTime: currentStartDateTime ?? this.currentStartDateTime,
      currentEndDateTime: currentEndDateTime ?? this.currentEndDateTime,
    );
  }

  @override
  String toString() {
    return 'BookingState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' tutorId: $tutorId'
        ' tutorName: $tutorName,'
        ' scheduleTable: $scheduleTable,'
        ' currentStartDateTime: $currentStartDateTime,'
        ' currentEndDateTime: $currentEndDateTime,'
        ' }';
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'tutorId': tutorId,
      'tutorName': tutorName,
      'scheduleTable': scheduleTable.toMap(),
      'currentStartDateTime': currentStartDateTime?.millisecondsSinceEpoch,
      'currentEndDateTime': currentEndDateTime?.millisecondsSinceEpoch,
    };
  }

  factory BookingState.fromMap(Map<String, dynamic> map) {
    return BookingState(
      isLoading: map['isLoading'] as bool,
      needNavigateToLogin: map['needNavigateToLogin'] as bool,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      tutorId: map['tutorId'] as String? ?? '',
      tutorName: map['tutorName'] as String? ?? '',
      scheduleTable: map['scheduleTable'] != null
          ? ScheduleTable.fromMap(map['scheduleTable'] as Map<String, dynamic>)
          : const ScheduleTable(days: []),
      currentStartDateTime: map['currentStartDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['currentStartDateTime'] as int)
          : null,
      currentEndDateTime: map['currentEndDateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['currentEndDateTime'] as int)
          : null,
    );
  }
}
