import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';
// import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
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

  Map<FeatureFlagEnum, Object> getFeatureFlag() {
    return {
      /*FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
      FeatureFlagEnum.ANDROID_SCREENSHARING_ENABLED: false,
      FeatureFlagEnum.AUDIO_FOCUS_DISABLED: false,
      FeatureFlagEnum.AUDIO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.AUDIO_ONLY_BUTTON_ENABLED: false,
      FeatureFlagEnum.CALENDAR_ENABLED: false,
      FeatureFlagEnum.CAR_MODE_ENABLED: false,
      FeatureFlagEnum.CLOSE_CAPTIONS_ENABLED: false,
      FeatureFlagEnum.CONFERENCE_TIMER_ENABLED: false,
      FeatureFlagEnum.CHAT_ENABLED: false,
      FeatureFlagEnum.FILMSTRIP_ENABLED: false,
      FeatureFlagEnum.FULLSCREEN_ENABLED: true,
      FeatureFlagEnum.HELP_BUTTON_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: false,
      FeatureFlagEnum.IOS_RECORDING_ENABLED: false,
      FeatureFlagEnum.IOS_SCREENSHARING_ENABLED: false,
      FeatureFlagEnum.SPEAKERSTATS_ENABLED: false,
      FeatureFlagEnum.KICK_OUT_ENABLED: false,
      FeatureFlagEnum.LIVE_STREAMING_ENABLED: false,
      FeatureFlagEnum.LOBBY_MODE_ENABLED: false,
      FeatureFlagEnum.MEETING_NAME_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
      FeatureFlagEnum.NOTIFICATIONS_ENABLED: false,
      FeatureFlagEnum.OVERFLOW_MENU_ENABLED: true,
      FeatureFlagEnum.PIP_ENABLED: false,
      FeatureFlagEnum.PREJOIN_PAGE_ENABLED: false,
      FeatureFlagEnum.RAISE_HAND_ENABLED: false,
      FeatureFlagEnum.REACTIONS_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: false,
      FeatureFlagEnum.REPLACE_PARTICIPANT: false,*/
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED: false,
      FeatureFlagEnum.NOTIFICATIONS_ENABLED: false,
      FeatureFlagEnum.OVERFLOW_MENU_ENABLED: true,
      FeatureFlagEnum.PIP_ENABLED: true,
      FeatureFlagEnum.PREJOIN_PAGE_ENABLED: true,
      FeatureFlagEnum.RAISE_HAND_ENABLED: false,
      FeatureFlagEnum.REACTIONS_ENABLED: false,
      FeatureFlagEnum.RECORDING_ENABLED: false,
      FeatureFlagEnum.REPLACE_PARTICIPANT: true,
      FeatureFlagEnum.RESOLUTION: FeatureFlagVideoResolution.MD_RESOLUTION,
      /*FeatureFlagEnum.SECURITY_OPTIONS_ENABLED: false,
      FeatureFlagEnum.SERVER_URL_CHANGE_ENABLED: false,
      FeatureFlagEnum.SETTINGS_ENABLED: false,
      FeatureFlagEnum.TILE_VIEW_ENABLED: true,
      FeatureFlagEnum.TOOLBOX_ALWAYS_VISIBLE: false,
      FeatureFlagEnum.TOOLBOX_ENABLED: true,
      FeatureFlagEnum.VIDEO_MUTE_BUTTON_ENABLED: true,
      FeatureFlagEnum.VIDEO_SHARE_BUTTON_ENABLED: false,*/
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
  }

  JitsiMeetingOptions getJitsiMeetingOptions(Map<FeatureFlagEnum, Object> featureFlags) {
    return JitsiMeetingOptions(
      room: 'LongTermFarmsDenySoftly',
      featureFlags: featureFlags,
    );
  }

  JitsiMeetingListener getJitsiMeetingListener() {
    return JitsiMeetingListener(
      onOpened: () {
        debugPrint('JitsiMeetingListener - onOpened');
      },
      onClosed: () {
        debugPrint('JitsiMeetingListener - onClosed');
        // setState(() {
        //   showButton = true;
        // });
      },
      onError: (error) {
        debugPrint('JitsiMeetingListener - onError: error: $error');
      },
      onConferenceWillJoin: (url) {
        debugPrint('JitsiMeetingListener - onConferenceWillJoin: url: $url');
      },
      onConferenceJoined: (url) {
        debugPrint('JitsiMeetingListener - onConferenceJoined: url:$url');
        // setState(() {
        //   showButton = false;
        // });
      },
      onConferenceTerminated: (url, error) {
        debugPrint(
          'JitsiMeetingListener - onConferenceTerminated:\n'
          'url: $url,\nerror: $error'
        );
        // setState(() {
        //   showButton = true;
        // });
      },
      onParticipantLeft: (participantId) {
        debugPrint('JitsiMeetingListener - onParticipantLeft: $participantId');
      },
      onParticipantJoined: (email, name, role, participantId) {
        debugPrint(
          'JitsiMeetingListener - onParticipantJoined: '
          'email: $email, name: $name, role: $role, '
          'participantId: $participantId'
        );
      },
      onAudioMutedChanged: (muted) {
        debugPrint('JitsiMeetingListener - onAudioMutedChanged: muted: $muted');
      },
      onVideoMutedChanged: (muted) {
        debugPrint('JitsiMeetingListener - onVideoMutedChanged: muted: $muted');
      },
      onScreenShareToggled: (participantId, isSharing) {
        debugPrint(
          'JitsiMeetingListener - onScreenShareToggled: '
          'participantId: $participantId, isSharing: $isSharing'
        );
      },
      genericListeners: [
        JitsiGenericListener(
          eventName: 'readyToClose',
          callback: (dynamic message) {
            debugPrint('JitsiMeetingListener - readyToClose callback');
          },
        ),
      ],
    );
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
                  final featureFlags = getFeatureFlag();
                  if (!kIsWeb && Platform.isAndroid) {
                    featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
                  }
                  final options = getJitsiMeetingOptions(featureFlags);
                  await JitsiMeet.joinMeeting(
                    options,
                    listener: getJitsiMeetingListener(),
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
                    fontSize: Dimens.getProportionalWidth(context, 15),
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
