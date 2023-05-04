import 'package:flutter/material.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/presentations/screens/video_call/video_call_page.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key, required this.args});

  final VideoCallArguments args;

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.fromMillisecondsSinceEpoch(
      args.bookingInfo?.scheduleDetailInfo?.startPeriodTimestamp ?? 0,
      isUtc: true,
    ).toLocal();
    final endTime = DateTime.fromMillisecondsSinceEpoch(
      args.bookingInfo?.scheduleDetailInfo?.endPeriodTimestamp ?? 0,
      isUtc: true,
    ).toLocal();
    final tutorInfo = args.bookingInfo?.scheduleDetailInfo?.scheduleInfo?.tutorInfo;
    final meetingUrl = args.bookingInfo?.studentMeetingLink ?? '';
    return VideoCallPage(
      startTime: startTime,
      endTime: endTime,
      tutorInfo: tutorInfo,
      meetingUrl: meetingUrl,
      onMeetingStatusChanged: args.onMeetingStatusChanged,
    );
  }
}

class VideoCallArguments {
  final BookingInfo? bookingInfo;
  final void Function(bool)? onMeetingStatusChanged;

  const VideoCallArguments({
    required this.bookingInfo,
    this.onMeetingStatusChanged,
  });
}
