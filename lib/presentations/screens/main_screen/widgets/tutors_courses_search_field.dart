import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/bottom_sheet_dialogs/bodies/tutors_courses_list_filter.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/bottom_sheet_dialogs/normal_bottom_sheet_dialog.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class TutorsCoursesSearchField extends StatelessWidget {
  const TutorsCoursesSearchField({
    super.key,
    this.hintText = '',
    this.isLoadingMore = false,
    required this.listFilterBodyBottomSheet,
    required this.onSubmitted,
  });

  final String hintText;
  final bool isLoadingMore;
  final TutorsCoursesListFilterBottomSheet listFilterBodyBottomSheet;
  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // search and filter field
        Expanded(
          child: TextFieldOutline(
            enable: !isLoadingMore,
            onSubmitted: onSubmitted,
            hintText: hintText,
          ),
        ),
        const EmptyProportionalSpace(width: 10),
        PrimaryOutlineButton(
          onTap: isLoadingMore ? null : () {
            NormalBottomSheetDialog.show(
              context,
              leftPadding: 0,
              rightPadding: 0,
              initialChildSize: 0.5018,
              body: listFilterBodyBottomSheet,
            );
          },
          width: Dimens.getProportionalWidth(context, 37),
          paddingVertical: Dimens.getProportionalHeight(
            context, 12,
          ),
          preferGradient: false,
          borderColor: context.theme.colorScheme.primary.withOpacity(
            isLoadingMore ? 0.5 : 1,
          ),
          bodyColor: context.theme.colorScheme.background,
          child: Icon(
            Icons.filter_alt_rounded,
            color: isLoadingMore
                ? context.theme.colorScheme.primary.withOpacity(0.5)
                : null,
          ),
        ),
      ],
    );
  }
}
