part of 'booking_cubit.dart';

class BookingState extends WidgetState {
  const BookingState({
    super.isLoading = true,
    this.tutorId = '',
    this.scheduleTable = const ScheduleTable(days: []),
  });

  final ScheduleTable scheduleTable;
  final String tutorId;

  BookingState copyWith({
    bool? isLoading,
    String? tutorId,
    ScheduleTable? scheduleTable,
  }) {
    return BookingState(
      isLoading: isLoading ?? this.isLoading,
      tutorId: tutorId ?? this.tutorId,
      scheduleTable: scheduleTable ?? this.scheduleTable,
    );
  }

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return BookingState(
      isLoading: mapJson['isLoading'] as bool? ?? true,
      tutorId: mapJson['tutorId'] as String? ?? '',
      scheduleTable: mapJson['scheduleTable'] != null ? ScheduleTable.fromJson(mapJson['scheduleTable']) : const ScheduleTable(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['tutorId'] = tutorId;
    map['scheduleTable'] = scheduleTable.toJson();
    return map;
  }

  @override
  List<Object?> get props => [...super.props, tutorId, scheduleTable];
}
