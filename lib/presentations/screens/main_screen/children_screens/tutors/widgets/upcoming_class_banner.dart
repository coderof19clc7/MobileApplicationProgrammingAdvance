import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class UpcomingClassBanner extends StatefulWidget {
  const UpcomingClassBanner({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.upcomingDateFormat,
    required this.upcomingTimeFormat,
    this.onClassSessionEnded,
  });

  final DateTime startTime, endTime;
  final String upcomingDateFormat, upcomingTimeFormat;
  final Function()? onClassSessionEnded;

  @override
  State<UpcomingClassBanner> createState() => _UpcomingClassBannerState();
}

class _UpcomingClassBannerState extends State<UpcomingClassBanner> {
  Timer? _timer;
  Color? textColor;
  var durationText = '(${S.current.upcomingIn} 00:00:00)';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timer.tick;
      updateDurationText();
    });
  }

  @override
  void dispose() {
    if (_timer != null && _timer?.isActive == true) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }

  void updateDurationText() {
    final differenceTime = widget.startTime.difference(DateTime.now()).inMilliseconds;
    final isCountDown = differenceTime > 0;
    if (mounted) {
      setState(() {
        final newDuration = isCountDown
            ? widget.startTime.difference(DateTime.now())
            : DateTime.now().difference(widget.startTime);
        textColor = isCountDown
            ? (differenceTime > 5 * 60 * 1000
            ? context.theme.colorScheme.onPrimary
            : AppColors.orangeYellow)
            : AppColors.green400;
        final textHeader = isCountDown ? S.current.upcomingIn : S.current.sessionProgressIn;

        final days = newDuration.inDays.remainder(24).toString().padLeft(2, '0');
        final hours = newDuration.inHours.remainder(60).toString().padLeft(2, '0');
        final minutes = newDuration.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds = newDuration.inSeconds.remainder(60).toString().padLeft(2, '0');
        durationText = days == '00'
            ? '($textHeader $hours:$minutes:$seconds)'
            : '($textHeader $days:$hours:$minutes:$seconds)';
      });
    }

    if (!isCountDown) {
      if (widget.endTime.difference(DateTime.now()).inMilliseconds < 0) {
        widget.onClassSessionEnded?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final startDateText = DateFormat(widget.upcomingDateFormat).format(widget.startTime);
    final startTimeText = DateFormat(widget.upcomingTimeFormat).format(widget.startTime);
    final endTimeText = DateFormat(widget.upcomingTimeFormat).format(widget.endTime);

    final upcomingText = '$startDateText at $startTimeText to $endTimeText';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          upcomingText,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
            fontWeight: FontWeight.w600,
            fontSize: Dimens.getProportionalWidth(context, 19),
          ),
        ),
        const EmptyProportionalSpace(height: 15),
        Text(
          durationText,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 16),
            color: textColor ?? context.theme.colorScheme.onPrimary
          ),
        ),
      ],
    );
  }
}
