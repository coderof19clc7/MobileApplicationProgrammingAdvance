import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key});

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  var showButton = true;

  final _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );

  @override
  void initState() {
    super.initState();

    final startTime = DateTime.now().add(
      Duration(
        days: Random().nextInt(5),
        hours: Random().nextInt(5) + 1,
        minutes: Random().nextInt(5) + 1,
      ),
    );

    final durationUntilClass = startTime.difference(DateTime.now());
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
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: SizedBox(
        width: Dimens.getScreenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Video Conference Widget',
              textAlign: TextAlign.center,
            ),
            if (showButton)
              PrimaryFillButton(
                onTap: () async {
                  final featureFlags = {FeatureFlag.isPipEnabled: true};
                  final options = JitsiMeetingOptions(
                    roomNameOrUrl: 'https://meet.jit.si/LongTermFarmsDenySoftly',
                    featureFlags: featureFlags,
                  );
                  await JitsiMeetWrapper.joinMeeting(
                    options: options,
                    listener: JitsiMeetingListener(
                      onConferenceJoined: (url) {
                        setState(() {
                          showButton = false;
                        });
                      },
                      onConferenceTerminated: (url, error) {
                        setState(() {
                          showButton = true;
                        });
                      },
                      onClosed: () {
                        setState(() {
                          showButton = true;
                        });
                      },
                    ),
                  );
                },
                child: const Text('test'),
              ),
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
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                    fontSize: Dimens.getProportionalScreenWidth(context, 15),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
