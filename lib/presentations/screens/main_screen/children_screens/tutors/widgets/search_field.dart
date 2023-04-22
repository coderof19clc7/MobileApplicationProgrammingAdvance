import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/tutor_filter_bottom_sheet.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/bottom_sheet_dialogs/normal_bottom_sheet_dialog.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorsCubit, TutorsState>(
      builder: (tutorsSearchFieldContext, state) {
        return Row(
          children: [
            // search and filter field
            Expanded(
              child: TextFieldOutline(
                enable: !state.isLoadingMore,
                textController: context.read<TutorsCubit>().tutorsTextEditingController,
                onSubmitted: (value) {
                  context.read<TutorsCubit>().onSearchTextSubmitted();
                },
                hintText: S.current.searchHintTutor,
              ),
            ),
            const EmptyProportionalSpace(width: 10),
            PrimaryOutlineButton(
              onTap: state.isLoadingMore ? null : () {
                final now = DateTime.now();
                if (kDebugMode) {
                  print('now: ${now.millisecondsSinceEpoch}');
                  print('now - 35 min: ${now.subtract(
                    const Duration(minutes: 35),
                  ).millisecondsSinceEpoch}');
                  print('now + 5 min: ${now.add(
                    const Duration(minutes: 5),
                  ).millisecondsSinceEpoch}');
                  print('testTime: ${DateTime.fromMillisecondsSinceEpoch(1639805436469)}');
                }
                NormalBottomSheetDialog.show(
                  context,
                  leftPadding: 0,
                  rightPadding: 0,
                  initialChildSize: 0.5018,
                  body: TutorFilterBottomSheet(
                    currentFilters: state.filters,
                    sortValue: state.sortValue,
                    onApplyFilters: (filters, sortValue) {
                      context.read<TutorsCubit>().onApplyFilters(
                        filters, sortValue,
                      );
                    },
                  ),
                );
              },
              width: Dimens.getProportionalWidth(context, 37),
              paddingVertical: Dimens.getProportionalHeight(
                context, 12,
              ),
              preferGradient: false,
              borderColor: context.theme.colorScheme.primary.withOpacity(
                state.isLoadingMore ? 0.5 : 1,
              ),
              bodyColor: context.theme.colorScheme.background,
              child: Icon(
                Icons.filter_alt_rounded,
                color: state.isLoadingMore
                    ? context.theme.colorScheme.primary.withOpacity(0.5)
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
