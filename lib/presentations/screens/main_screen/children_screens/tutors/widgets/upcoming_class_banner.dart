import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class UpcomingClassBanner extends StatefulWidget {
  const UpcomingClassBanner({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.upcomingDateFormat,
    required this.upcomingTimeFormat,
    required this.topLabel,
    required this.buttonLabel,
    required this.onTap,
    required this.width,
  });

  final DateTime startTime, endTime;
  final String topLabel, buttonLabel, upcomingDateFormat, upcomingTimeFormat;
  final double width;
  final Function() onTap;

  @override
  State<UpcomingClassBanner> createState() => _UpcomingClassBannerState();
}

class _UpcomingClassBannerState extends State<UpcomingClassBanner> {
  final _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );

  @override
  void initState() {
    super.initState();
    final durationUntilClass = widget.startTime.difference(DateTime.now());
    _stopWatchTimer
      ..setPresetHoursTime(durationUntilClass.inHours)
      ..onStartTimer();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final startDateText = DateFormat(widget.upcomingDateFormat).format(widget.startTime);
    final startTimeText = DateFormat(widget.upcomingTimeFormat).format(widget.startTime);
    final endTimeText = DateFormat(widget.upcomingTimeFormat).format(widget.endTime);

    final upcomingText = '$startDateText at $startTimeText to $endTimeText';

    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      padding: EdgeInsets.only(
        top: Dimens.getTopSafeAreaHeight(context) + Dimens.getProportionalHeight(context, 28),
        bottom: Dimens.getProportionalHeight(context, 28),
      ),
      width: widget.width,
      child: BlocBuilder<UpcomingCubit, UpcomingState>(
        builder: (BuildContext context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.topLabel,
                style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
                  fontSize: Dimens.getProportionalWidth(context, 15),
                ),
              ),
              const EmptyProportionalSpace(height: 15),
              Text(
                upcomingText,
                style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: Dimens.getProportionalWidth(context, 19),
                ),
              ),
              const EmptyProportionalSpace(height: 15),
              StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: 0,
                builder: (context, snapshot) {
                  if (snapshot.data == 0) {
                    return const SizedBox.shrink();
                  }

                  final durationUntilClass = Duration(milliseconds: snapshot.data ?? 0);
                  final days = durationUntilClass.inDays.remainder(24).toString().padLeft(2, '0');
                  final hours = durationUntilClass.inHours.remainder(60).toString().padLeft(2, '0');
                  final minutes = durationUntilClass.inMinutes.remainder(60).toString().padLeft(2, '0');
                  final seconds = durationUntilClass.inSeconds.remainder(60).toString().padLeft(2, '0');

                  return Text(
                    days == '00'
                        ? '(${S.current.upcomingIn} $hours:$minutes:$seconds)'
                        : '(${S.current.upcomingIn} $days:$hours:$minutes:$seconds)',
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
                      fontSize: Dimens.getProportionalWidth(context, 15),
                    ),
                  );
                },
              ),
              const EmptyProportionalSpace(height: 15),
              PrimaryFillButton(
                width: Dimens.getProportionalWidth(context, 160),
                bgColor: context.theme.colorScheme.secondary,
                preferGradient: false,
                boxShadow: [Effects.normalShadowSM],
                borderRadiusValue: Dimens.getScreenWidth(context),
                onTap: widget.onTap,
                paddingVertical: Dimens.getProportionalWidth(context, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login_rounded,
                      color: context.theme.colorScheme.onSecondary,
                      size: Dimens.getProportionalWidth(context, 17),
                    ),
                    SizedBox(width: Dimens.getProportionalWidth(context, 5)),
                    Text(
                      widget.buttonLabel,
                      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                        color: context.theme.colorScheme.onSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimens.getProportionalWidth(context, 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
