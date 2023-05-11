import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/presentations/screens/profile/bloc/profile_cubit.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/avatar_widget.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/want_to_sturdy_subject_and_test.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class ProfileViewModeWidget extends StatelessWidget {
  const ProfileViewModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        const itemDistance = 20.0;
        final userInfo = state.userInfo;
        final listSelectedWantToSturdy = [
          ...state.selectedLearnTopics.map((e) {
            return MapConstants.learnTopicsMap[e]?['name'] ?? '';
          }),
          ...state.selectedTestPreparations.map((e) {
            return MapConstants.testPreparationsMap[e]?['name'] ?? '';
          }),
        ];
        
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //avatar
              AvatarWidget(currentUrl: userInfo?.avatar),
              const EmptyProportionalSpace(height: itemDistance - 3),

              // general information
              buildUsernameAndEmailWidget(
                context,
                name: userInfo?.name ?? '',
                countryCode: userInfo?.country,
                email: userInfo?.email ?? '',
              ),
              const EmptyProportionalSpace(height: itemDistance + 5),

              // date of birth
              buildInfoCurrentWidget(context, S.current.dateOfBirth, userInfo?.birthday ?? ''),
              const EmptyProportionalSpace(height: itemDistance),

              // skill level
              buildInfoCurrentWidget(
                context,
                S.current.skillLevel,
                MapConstants.userLevels[userInfo?.level ?? ''] ?? '',
              ),
              const EmptyProportionalSpace(height: itemDistance),

              // want to sturdy
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildTitle(context, S.current.learningInterests),
                    const EmptyProportionalSpace(height: 10),
                    WantToSturdySubjectAndTest(
                      listSelectedLearnTopics: listSelectedWantToSturdy,
                    ),
                  ],
                ),
              ),
              const EmptyProportionalSpace(height: itemDistance),

              // preferred schedule
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTitle(context, S.current.preferredSchedule),
                    const EmptyProportionalSpace(height: 10),
                    buildTextContent(
                      context,
                      userInfo?.studySchedule ?? '',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title, style: Dimens.getProportionalFont(
        context, context.theme.textTheme.headlineLarge,
      ).copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildTextContent(BuildContext context, String content, {
    TextAlign textAlign = TextAlign.end,
    bool isEmail = false,
  }) {
    return Text(
      content,
      textAlign: textAlign,
      style: Dimens.getProportionalFont(
        context, context.theme.textTheme.displayMedium,
      ).copyWith(
        fontStyle: isEmail ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }

  Widget buildUsernameAndEmailWidget(BuildContext context, {
    required String name,
    String? countryCode,
    required String email,
  }) {
    const distance = 7.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(context, name),
        const EmptyProportionalSpace(height: distance),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTextContent(
              context, UIHelper.getIconFromNationalityCode(countryCode),
            ),
            const EmptyProportionalSpace(width: 8),
            buildTextContent(
              context, MapConstants.countries[countryCode] ?? '',
            ),
          ],
        ),
        const EmptyProportionalSpace(height: distance),
        buildTextContent(context, email, isEmail: true),
      ],
    );
  }

  // info title text and sub text into  right widget
  Widget buildInfoCurrentWidget(BuildContext context, String title, String subText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTitle(context, title),
        Flexible(child: buildTextContent(context, subText)),
      ],
    );
  }
}
