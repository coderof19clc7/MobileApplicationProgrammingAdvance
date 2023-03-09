import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/tutors_screen/widgets/filter_dropdown.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/base_choice_chip.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class TutorFilterBottomSheet extends StatelessWidget {
  const TutorFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final nationalityCodes = [
      'VN',
      'DE',
      'US',
      'GB',
      'FR',
      'IT',
      'ES',
      'CA',
      'AU',
      'JP',
      'KR',
      'CN',
    ];
    final sortValues = [1, -1];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Dimens.getProportionalScreenWidth(context, 16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // category filters
              Text(
                S.current.specialties,
                style: Dimens.getProportionalFont(
                  context,
                  context.theme.textTheme.displayMedium,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              const EmptyProportionalSpace(height: 15),
              SizedBox(
                height: Dimens.getScreenHeight(context) * 0.045,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    // category filter
                    return Container(
                      margin: EdgeInsets.only(
                        right: Dimens.getProportionalScreenWidth(
                          context,
                          index == 14 ? 16 : 10,
                        ),
                      ),
                      child: BaseChoiceChip(
                        label: toBeginningOfSentenceCase(S.current.all)!,
                        isSelected: index.isEven,
                        onSelected: (value) {
                          // update state
                        },
                        unselectedBorderColor: context.theme.colorScheme.outlineVariant,
                      ),
                    );
                  },
                ),
              ),

              const EmptyProportionalSpace(height: 20),

              // nationality filter
              Text(
                S.current.nationality,
                style: Dimens.getProportionalFont(
                  context,
                  context.theme.textTheme.displayMedium,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              const EmptyProportionalSpace(height: 15),
              FilterDropDown<String>(
                value: nationalityCodes.first,
                data: nationalityCodes,
                selectedItemBuilder: (context) {
                  return nationalityCodes.map((code) {
                    return Text(UIHelper.getIconFromNationalityCode(code));
                  }).toList();
                },
                itemBuilder: (item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        text: UIHelper.getIconFromNationalityCode(item),
                        children: [
                          TextSpan(text: '  ' + item),
                        ],
                        style: context.theme.textTheme.bodySmall!.copyWith(
                          fontSize: Dimens.getProportionalScreenWidth(
                            context,
                            12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const EmptyProportionalSpace(height: 20),

              // sorting filters
              Text(
                S.current.sorting,
                style: Dimens.getProportionalFont(
                  context,
                  context.theme.textTheme.displayMedium,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              const EmptyProportionalSpace(height: 15),
              FilterDropDown<int>(
                value: sortValues.first,
                data: sortValues,
                leadingIcon: const Icon(Icons.sort_rounded),
                itemBuilder: (item) {
                  return DropdownMenuItem<int>(
                    value: item,
                    alignment: Alignment.center,
                    child: Text(
                      item == 1 ? S.current.sortRatingFromHighest : S.current.sortRatingFromLowest,
                      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                        color: context.theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        const EmptyProportionalSpace(height: 25),

        Divider(
          height: Dimens.getProportionalScreenHeight(context, 2),
          color: context.theme.colorScheme.onInverseSurface,
        ),

        const EmptyProportionalSpace(height: 25),

        // button field
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.getProportionalScreenWidth(context, 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryOutlineButton(
                onTap: () {},
                width: Dimens.getScreenWidth(context) * 0.21282,
                paddingVertical: Dimens.getProportionalScreenHeight(context, 5),
                borderRadiusValue: Dimens.getScreenWidth(context),
                preferGradient: false,
                child: Text(
                  S.current.reset,
                  style: Dimens.getProportionalFont(
                    context,
                    context.theme.textTheme.bodyMedium,
                  ).copyWith(
                    color: context.theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const EmptyProportionalSpace(width: 10),
              PrimaryFillButton(
                onTap: () {},
                width: Dimens.getScreenWidth(context) * 0.21282,
                paddingVertical: Dimens.getProportionalScreenHeight(context, 5),
                borderRadiusValue: Dimens.getScreenWidth(context),
                preferGradient: false,
                hasShadow: false,
                child: Text(
                  S.current.filter,
                  style: Dimens.getProportionalFont(
                    context,
                    context.theme.textTheme.bodyMedium,
                  ).copyWith(
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
