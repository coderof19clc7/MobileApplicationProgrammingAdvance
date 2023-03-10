import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/profile/widgets/avatar_widget.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/profile/widgets/skill_current_widget.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class ProfileEditModeWidget extends StatelessWidget {
  const ProfileEditModeWidget({super.key});

  Widget textViewCurrent(BuildContext context, {required String title, Widget? iconWidget, Color? backgroundColor, bool? isBorder = true}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(5),
        border: isBorder == true ? Border.all(color: context.theme.colorScheme.outline) : null,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalScreenWidth(context, 12),
        vertical: Dimens.getProportionalScreenWidth(context, 14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium),
          ),
          iconWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AvatarWidget(isEditAvt: true),
          const EmptyProportionalSpace(height: 20),
          Text(
            'huyminh@lettutor.com',
            style: Dimens.getProportionalFont(context, context.theme.textTheme.titleLarge).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const EmptyProportionalSpace(height: 20),
          textViewCurrent(context, title: 'Huy Minh'),
          const EmptyProportionalSpace(height: 20),
          textViewCurrent(
            context,
            title: '20/12/1999',
            iconWidget: Icon(
              Icons.calendar_today_outlined,
              color: context.theme.colorScheme.onSurfaceVariant,
              size: Dimens.getProportionalScreenWidth(context, 17),
            ),
          ),
          const EmptyProportionalSpace(height: 20),
          textViewCurrent(
            context,
            title: '+84901111323',
            backgroundColor: context.theme.colorScheme.outlineVariant,
            isBorder: false,
          ),
          const EmptyProportionalSpace(height: 20),
          textViewCurrent(
            context,
            title: '${UIHelper.getIconFromNationalityCode('VN')} Viet Nam',
            iconWidget: Icon(
              Icons.expand_more_rounded,
              color: context.theme.colorScheme.onTertiaryContainer,
              size: Dimens.getProportionalScreenWidth(context, 22),
            ),
          ),
          const EmptyProportionalSpace(height: 20),
          textViewCurrent(
            context,
            title: 'Intermediate',
            iconWidget: Icon(
              Icons.expand_more_rounded,
              color: context.theme.colorScheme.onTertiaryContainer,
              size: Dimens.getProportionalScreenWidth(context, 22),
            ),
          ),
          const EmptyProportionalSpace(height: 20),
          SkillCurrentWidget(title: S.current.learningInterests),
          // TODO(coderof19clc7): Add preffered schedule form field
        ],
      ),
    );
  }
}
