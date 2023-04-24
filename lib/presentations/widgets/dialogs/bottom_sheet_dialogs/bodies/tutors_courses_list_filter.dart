import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/core/models/requests/tutor/tutor_search_request.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/filter_dropdown.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/base_choice_chip.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class TutorsCoursesListFilterBottomSheet extends StatefulWidget {
  const TutorsCoursesListFilterBottomSheet({
    super.key,
    required this.choiceChipsValues,
    
    this.sortValue = 0,
    this.onApplyFilters,
  });

  final Filters choiceChipsValues;
  final List<String>? choiceChipsRenderValues;
  final int sortValue;
  final Function(Filters, int)? onApplyFilters;

  @override
  State<TutorsCoursesListFilterBottomSheet> createState() => _TutorsCoursesListFilterBottomSheetState();
}

class _TutorsCoursesListFilterBottomSheetState extends State<TutorsCoursesListFilterBottomSheet> {
  late ScrollController _scrollController;

  // constants
  final specialtiesMap = {
    'all': S.current.all,
    'english-for-kids': S.current.englishForKids,
    'business-english': S.current.businessEnglish,
    'conversational-english': S.current.conversationalEnglish,
    'starters': S.current.starters,
    'movers': S.current.movers,
    'flyers': S.current.flyers,
    'ket': S.current.ket,
    'pet': S.current.pet,
    'ielts': S.current.ielts,
    'toefl': S.current.toefl,
    'toeic': S.current.toeic,
  };
  final nationalityValues = [0, 1, 2, 3];
  final sortValues = [0, 1, -1];

  // default values
  final _defaultFilters = Filters.defaultFilters();
  final _defaultIsDescending = 0;

  late Filters newFilters;
  int newNationalityValue = 0;
  int newSortValue = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    newFilters = (widget.choiceChipsValues ?? _defaultFilters).copyWith();
    if (newFilters.nationality?.isVietNamese == null
        && newFilters.nationality?.isNative == null
    ) {
      newNationalityValue = 0;
    } else if (newFilters.nationality?.isVietNamese == false
        && newFilters.nationality?.isNative == false
    ) {
      newNationalityValue = 1;
    } else if (newFilters.nationality?.isVietNamese == true) {
      newNationalityValue = 2;
    } else if (newFilters.nationality?.isNative == true) {
      newNationalityValue = 3;
    }
    newSortValue = widget.sortValue;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final specialtiesList = specialtiesMap.entries.toList();
    final numSpecialties = specialtiesList.length;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.getProportionalWidth(context, 16),
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
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: numSpecialties,
                  itemBuilder: (context, index) {
                    // category filter
                    return Container(
                      margin: EdgeInsets.only(
                        right: Dimens.getProportionalWidth(
                          context, (index == numSpecialties - 1) ? 0 : 10,
                        ),
                      ),
                      child: BaseChoiceChip(
                        label: toBeginningOfSentenceCase(specialtiesList[index].value)!,
                        isSelected: index == 0
                            ? newFilters.specialties?.isEmpty == true
                            : newFilters.specialties?.contains(specialtiesList[index].key) == true,
                        onSelected: (value) {
                          // update specialities list
                          setState(() {
                            if (index == 0) {
                              // clear all specialities list
                              newFilters.specialties = <String>[];
                            } else {
                              // add or remove speciality
                              final curSpecialities = newFilters.specialties ?? <String>[];
                              if (value) {
                                newFilters.specialties = [...curSpecialities, specialtiesList[index].key];
                              } else {
                                newFilters.specialties =  [...curSpecialities]..remove(specialtiesList[index].key);
                              }
                            }
                          });
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
              FilterDropDown<int>(
                value: newNationalityValue,
                data: nationalityValues,
                alignment: AlignmentDirectional.centerStart,
                itemBuilder: (item) {
                  var nationality = S.current.all;
                  if (item == 1) {
                    nationality = S.current.foreign;
                  } else if (item == 2) {
                    nationality = S.current.vietnamese;
                  } else if (item == 3) {
                    nationality = S.current.nativeEnglish;
                  }
                  return DropdownMenuItem<int>(
                    value: item,
                    child: Text(
                      item == 0 ? nationality : S.current.tutorWithNationality(nationality),
                      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                        color: context.theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                  );
                },
                onChanged: (value) {
                  setState(() {
                    newNationalityValue = value ?? 0;
                    newFilters.nationality = Nationality(
                      isVietNamese: value == 2 ? true : (value == 1 ? false : null),
                      isNative: value == 3 ? true : (value == 1 ? false : null),
                    );
                  });
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
                value: newSortValue,
                data: sortValues,
                leadingIcon: const Icon(Icons.sort_rounded),
                itemBuilder: (item) {
                  final text = item == 0
                      ? S.current.sortRatingFromNameAtoZ
                      : (item == 1
                      ? S.current.sortRatingFromLowest
                      : S.current.sortRatingFromHighest);
                  return DropdownMenuItem<int>(
                    value: item,
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                        color: context.theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                  );
                },
                onChanged: (value) {
                  setState(() {
                    newSortValue = value ?? 0;
                  });
                },
              ),
            ],
          ),
        ),

        const EmptyProportionalSpace(height: 25),

        Divider(
          height: Dimens.getProportionalHeight(context, 2),
          color: context.theme.colorScheme.onInverseSurface,
        ),

        const EmptyProportionalSpace(height: 25),

        // button field
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.getProportionalWidth(context, 16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryOutlineButton(
                onTap: () {
                  setState(() {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                    );
                    newFilters = _defaultFilters.copyWith();
                    newNationalityValue = 0;
                    newSortValue = _defaultIsDescending;
                  });
                },
                width: Dimens.getScreenWidth(context) * 0.21282,
                paddingVertical: Dimens.getProportionalHeight(context, 5),
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
                onTap: () {
                  Navigator.pop(context);
                  widget.onApplyFilters?.call(newFilters, newSortValue);
                },
                width: Dimens.getScreenWidth(context) * 0.21282,
                paddingVertical: Dimens.getProportionalHeight(context, 5),
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
