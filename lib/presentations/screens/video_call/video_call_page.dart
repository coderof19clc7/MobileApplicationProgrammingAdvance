import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_jitsi_meet/jitsi_meet.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/presentations/screens/main_screen/bloc/main_cubit.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_tutor_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
// import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.meetingUrl,
    this.tutorInfo,
    this.onMeetingStatusChanged,
  });

  final DateTime startTime, endTime;
  final TutorInfo? tutorInfo;
  final String meetingUrl;
  final void Function(bool)? onMeetingStatusChanged;

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  final itemDistance = 7.0;
  final textHeader = S.current.waitingTime;
  var sessionText = S.current.session;
  var durationText = '00:00:00';
  var enableButton = false;

  Timer? _timer;

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

  Future<void> joinMeeting() async {
    final featureFlags = getFeatureFlag();
    if (!kIsWeb && Platform.isAndroid) {
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    }
    final options = getJitsiMeetingOptions(featureFlags);
    JitsiMeet.joinMeeting(
      options,
      listener: getJitsiMeetingListener(),
    );
  }

  List<String> decodeMeetingUrl() {
    final tokenMeeting = widget.meetingUrl.split('token=')[1];
    final base64Decoded = base64.decode(base64.normalize(tokenMeeting.split('.')[1]));
    final urlObject = utf8.decode(base64Decoded);
    final jsonRes = json.decode(urlObject) as Map<String, dynamic>;
    final roomId = jsonRes['room'] as String? ?? '';

    return [roomId, tokenMeeting];
  }

  void updateShowButtonStatus ({bool currentStatus = false}) {
    if (mounted) {
      setState(() {
        if (enableButton != currentStatus) {
          enableButton = currentStatus;
        }
      });
    }
  }

  void onOpenMeetingButtonClick() {
    joinMeeting();
    Navigator.of(context).pop();
  }

  void updateDurationText() {
    final isCountDown = widget.startTime.difference(DateTime.now()).inMilliseconds > 0;
    if (!isCountDown) {
      onOpenMeetingButtonClick();
    } else if (mounted) {
      setState(() {
        final newDuration = widget.startTime.difference(DateTime.now());

        final days = newDuration.inDays.remainder(24).toString().padLeft(2, '0');
        final hours = newDuration.inHours.remainder(60).toString().padLeft(2, '0');
        final minutes = newDuration.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds = newDuration.inSeconds.remainder(60).toString().padLeft(2, '0');
        durationText = days == '00'
            ? '$hours:$minutes:$seconds'
            : '$days:$hours:$minutes:$seconds';

        if (sessionText == S.current.session) {
          sessionText += ': ${DateFormat(AppDateFormats.tHHmm).format(widget.startTime)}'
              ' -'
              ' ${DateFormat(AppDateFormats.tHHmm).format(widget.endTime)}';
        }

        if (!enableButton) {
          enableButton = true;
        }
      });
    }
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
    final roomAndToken = decodeMeetingUrl();
    final userInfo = MainCubit.getInstance().state.userInfo;
    return JitsiMeetingOptions(
      serverURL: ApiConstants.meetingServerLink,
      room: roomAndToken[0],
      featureFlags: featureFlags,
      token: roomAndToken[1],
      userAvatarURL: userInfo?.avatar,
      userDisplayName: userInfo?.name,
      userEmail: userInfo?.email,
    );
  }

  JitsiMeetingListener getJitsiMeetingListener() {
    return JitsiMeetingListener(
      onOpened: () {
        debugPrint('JitsiMeetingListener - onOpened');
        widget.onMeetingStatusChanged?.call(true);
        updateShowButtonStatus();
      },
      onClosed: () {
        debugPrint('JitsiMeetingListener - onClosed');
        widget.onMeetingStatusChanged?.call(false);
        updateShowButtonStatus(currentStatus: true);
      },
      onError: (error) {
        debugPrint('JitsiMeetingListener - onError: error: $error');
      },
      onConferenceWillJoin: (url) {
        debugPrint('JitsiMeetingListener - onConferenceWillJoin: url: $url');
      },
      onConferenceJoined: (url) {
        debugPrint('JitsiMeetingListener - onConferenceJoined: url:$url');
        widget.onMeetingStatusChanged?.call(true);
        updateShowButtonStatus();
      },
      onConferenceTerminated: (url, error) {
        debugPrint(
          'JitsiMeetingListener - onConferenceTerminated:\n'
          'url: $url,\nerror: $error'
        );
        widget.onMeetingStatusChanged?.call(false);
        updateShowButtonStatus(currentStatus: true);
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
    final tutorInfoTextStyle = Dimens.getProportionalFont(
      context, context.theme.textTheme.displayLarge,
    ).copyWith(
      fontSize: Dimens.getProportionalWidth(context, 25),
      color: context.theme.colorScheme.onBackground,
    );

    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: Container(
        width: Dimens.getScreenWidth(context),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Column(
          children: [
            // waiting time field
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textHeader,
                    textAlign: TextAlign.center,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.displayMedium,
                    ).copyWith(
                      fontSize: Dimens.getProportionalWidth(context, 30),
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                  EmptyProportionalSpace(height: itemDistance),
                  Text(
                    durationText,
                    textAlign: TextAlign.center,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.displayLarge,
                    ).copyWith(
                      fontSize: Dimens.getProportionalWidth(context, 55),
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // meeting general information and open meeting button field
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.getProportionalWidth(context, 20),
                ),
                width: Dimens.getScreenWidth(context),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // meeting session's information
                      Text(
                        DateFormat(AppDateFormats.eeeMMMdyyyy).format(widget.startTime),
                        textAlign: TextAlign.center,
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.titleLarge,
                        ).copyWith(
                          fontSize: Dimens.getProportionalWidth(context, 35),
                          color: context.theme.colorScheme.onBackground,
                        ),
                      ),
                      EmptyProportionalSpace(height: itemDistance),
                      Text(
                        sessionText,
                        textAlign: TextAlign.center,
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.displayLarge,
                        ).copyWith(
                          fontSize: Dimens.getProportionalWidth(context, 20),
                          fontWeight: FontWeight.bold,
                          color: context.theme.colorScheme.onBackground,
                        ),
                      ),
                      EmptyProportionalSpace(height: itemDistance * 3),

                      // tutor's information
                      SimpleTutorInformation(
                        tutorInfo: widget.tutorInfo,
                        avatarSize: Dimens.getScreenWidth(context) * 0.2,
                        mainAxisAlignment: MainAxisAlignment.center,
                        nameStyle: tutorInfoTextStyle.copyWith(fontWeight: FontWeight.bold),
                        countryFlagStyle: tutorInfoTextStyle,
                        countryNameStyle: tutorInfoTextStyle,
                      ),
                      EmptyProportionalSpace(height: itemDistance * 3),

                      PrimaryFillButton(
                        onTap: enableButton
                            ? onOpenMeetingButtonClick
                          : null,
                        paddingVertical: Dimens.getProportionalWidth(context, 20),
                        preferGradient: enableButton,
                        bgColor: AppColors.neutralBlue500,
                        child: Text(
                          S.current.openMeeting,
                          style: Dimens.getProportionalFont(
                            context, context.theme.textTheme.headlineLarge,
                          ).copyWith(
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
