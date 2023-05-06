import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/booking_list_request.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/booking_schedule_request.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/cancel_schedule_request.dart';
import 'package:one_one_learn/core/models/requests/schedule_and_booking/edit_request_request.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booked_classes_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_schedule_response.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/edit_request_response.dart';
import 'package:one_one_learn/core/network/repositories/base_repository.dart';

class BookingRepository extends BaseRepository {
  BookingRepository() : super(ApiServices.booking);

  Future<BookedClassesResponse> getBookedClasses({
    required BookingListRequest query,
  }) async {
    return BookedClassesResponse.fromJson(await request(
      method: ApiMethods.get,
      path: ApiEndpoints.listStudent,
      queryParameters: query,
      headers: {
        ApiConstants.contentType: ApiConstants.textPlain,
      }
    ));
  }

  Future<BookingScheduleResponse> bookingSchedule({
    required BookingScheduleRequest bookingScheduleRequest,
  }) async {
    return BookingScheduleResponse.fromJson(await request(
      method: ApiMethods.post,
      path: '',
      data: bookingScheduleRequest,
    ));
  }

  Future<EditRequestResponse> editRequestOfBookingInfo({
    required String bookingInfoId,
    required EditRequestRequest editRequestRequest,
  }) async {
    return EditRequestResponse.fromJson(await request(
      method: ApiMethods.post,
      path: '${ApiEndpoints.studentRequest}/$bookingInfoId',
      data: editRequestRequest,
    ));
  }

  Future<BaseResponse> cancelScheduleDetail({
    required CancelScheduleRequest cancelScheduleRequest,
  }) async {
    return EditRequestResponse.fromJson(await request(
      method: ApiMethods.delete,
      path: ApiEndpoints.scheduleDetail,
      data: cancelScheduleRequest,
    ));
  }
}
