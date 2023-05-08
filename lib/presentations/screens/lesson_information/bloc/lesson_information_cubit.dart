import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/requests/report/save_report_lesson_request.dart';
import 'package:one_one_learn/core/models/responses/report/save_report_lesson_resposne.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/core/network/repositories/lesson_report_repository.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

part 'lesson_information_state.dart';

class LessonInformationCubit extends WidgetCubit<LessonInformationState> {
  LessonInformationCubit({
    required GroupedBookingInfo groupedBookingInfo,
  }) : super(widgetState: LessonInformationState(groupedBookingInfo: groupedBookingInfo));

  final lessonReportRepository = injector<LessonReportRepository>();

  @override
  void onWidgetCreated() {}

  Future<void> reportBooking(String bookingId, int reasonId, String note) async {
    final saveReportLessonResponse = await fetchApi<SaveReportLessonResponse>(
      () => lessonReportRepository.saveReportLesson(
        saveReportLessonRequest: SaveReportLessonRequest(
          bookingId: bookingId,
          reasonId: reasonId,
          note: note,
        ),
      ),
      showLoading: false,
    );

    if (saveReportLessonResponse != null && saveReportLessonResponse.statusCode == ApiStatusCode.success) {
      saveReportLessonResponse.message?.let(showSuccessToast);
    }
  }
}
