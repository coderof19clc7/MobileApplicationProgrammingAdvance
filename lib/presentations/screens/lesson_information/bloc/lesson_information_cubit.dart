import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';

part 'lesson_information_state.dart';

class LessonInformationCubit extends WidgetCubit<LessonInformationState> {
  LessonInformationCubit({
    required GroupedBookingInfo groupedBookingInfo,
  }) : super(widgetState: LessonInformationState(groupedBookingInfo: groupedBookingInfo));

  @override
  void onWidgetCreated() {}
}
