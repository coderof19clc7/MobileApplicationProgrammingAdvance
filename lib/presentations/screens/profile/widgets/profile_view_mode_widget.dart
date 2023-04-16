import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/avatar_widget.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/skill_current_widget.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class ProfileViewModeWidget extends StatelessWidget {
  const ProfileViewModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //avatar
          const AvatarWidget(),
          const EmptyProportionalSpace(height: 20),
          buildUsernameAndEmailWidget(context),
          const EmptyProportionalSpace(height: 20),
          buildInfoCurrentWidget(context, S.current.dateOfBirth, '20/12/1999'),
          const EmptyProportionalSpace(height: 20),
          buildInfoCurrentWidget(context, S.current.phoneNumber, '+84 123 456 789'),
          const EmptyProportionalSpace(height: 20),
          buildInfoCurrentWidget(context, S.current.skillLevel, 'Beginner'),
          const EmptyProportionalSpace(height: 20),
          SkillCurrentWidget(title: S.current.learningInterests),
          const EmptyProportionalSpace(height: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTitle(context, S.current.preferredSchedule),
                const EmptyProportionalSpace(height: 10),
                buildTextContent(context, 'Lorep ipsum duwang'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildTextContent(BuildContext context, String content) {
    return Text(
      content,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(),
    );
  }

  Widget buildUsernameAndEmailWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Huy Minh',
          style: Dimens.getProportionalFont(context, context.theme.textTheme.titleLarge).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const EmptyProportionalSpace(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              UIHelper.getIconFromNationalityCode('DE'),
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              'Netherlands',
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall),
            ),
          ],
        ),
        const EmptyProportionalSpace(height: 10),
        Text(
          'huyminh@lettutor.com',
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall),
        ),
      ],
    );
  }

  // info title text and sub text into  right widget
  Widget buildInfoCurrentWidget(BuildContext context, String title, String subText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          subText,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium),
        ),
      ],
    );
  }
}
