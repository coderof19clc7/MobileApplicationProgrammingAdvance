import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    required this.label1,
    required this.label2,
    required this.data1Map,
    this.data1CurrentFilter = const <String>[],
    required this.data2Map,
    this.data2CurrentFilter = const <int>[],
    required this.data3Map,
    this.data3CurrentFilter = 0,
    this.onApplyFilters,
  });

  final String label1, label2;
  final Map<String, String> data1Map;
  final List<String> data1CurrentFilter;
  final Map<int, String> data2Map;
  final List<int> data2CurrentFilter;
  final Map<int, String> data3Map;
  final int data3CurrentFilter;
  final Function(List<String>, List<int>, int)? onApplyFilters;

  @override
  State<TutorsCoursesListFilterBottomSheet> createState() => _TutorsCoursesListFilterBottomSheetState();
}

class _TutorsCoursesListFilterBottomSheetState extends State<TutorsCoursesListFilterBottomSheet> {
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;

  late final List<MapEntry<String, String>> data1ListMap;
  late final List<MapEntry<int, String>> data2ListMap;
  late final List<MapEntry<int, String>> data3ListMap;
  late final List<int> data3ListMapValues;

  late List<String> newData1Filter;
  late List<int> newData2Filter;
  late int newData3Filter;

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();

    data1ListMap = widget.data1Map.entries.toList();
    data2ListMap = widget.data2Map.entries.toList();
    data3ListMap = widget.data3Map.entries.toList();
    data3ListMapValues = widget.data3Map.keys.toList();

    newData1Filter = [...widget.data1CurrentFilter];
    newData2Filter = [...widget.data2CurrentFilter];
    newData3Filter = widget.data3CurrentFilter;
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                // data1 (specialties or categories) filter
                Text(
                  widget.label1,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.displayMedium,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const EmptyProportionalSpace(height: 15),
                SizedBox(
                  height: Dimens.getScreenHeight(context) * 0.045,
                  child: ListView.builder(
                    controller: _scrollController1,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: widget.data1Map.length,
                    itemBuilder: (context, index) {
                      final item = data1ListMap[index];
                      return Container(
                        margin: EdgeInsets.only(
                          right: Dimens.getProportionalWidth(
                            context, (index == widget.data1Map.length - 1) ? 0 : 10,
                          ),
                        ),
                        child: BaseChoiceChip(
                          label: toBeginningOfSentenceCase(item.value)!,
                          isSelected: index == 0
                              ? newData1Filter.isEmpty == true
                              : newData1Filter.contains(data1ListMap[index].key) == true,
                          onSelected: (value) {
                            // update specialities list
                            setState(() {
                              if (index == 0) {
                                // clear all specialities list
                                newData1Filter = <String>[];
                              } else {
                                // add or remove speciality
                                final curData1Filter = [...newData1Filter];
                                if (value) {
                                  newData1Filter = [...curData1Filter, item.key];
                                  if (newData1Filter.length == widget.data1Map.length - 1) {
                                    newData1Filter = <String>[];
                                  }
                                  newData1Filter.sort();
                                } else {
                                  newData1Filter = [...curData1Filter]..remove(item.key);
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

                // data2 (nationality or level) filter
                Text(
                  widget.label2,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.displayMedium,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const EmptyProportionalSpace(height: 15),
                SizedBox(
                  height: Dimens.getScreenHeight(context) * 0.045,
                  child: ListView.builder(
                    controller: _scrollController2,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: widget.data2Map.length,
                    itemBuilder: (context, index) {
                      final item = data2ListMap[index];
                      return Container(
                        margin: EdgeInsets.only(
                          right: Dimens.getProportionalWidth(
                            context, (index == widget.data2Map.length - 1) ? 0 : 10,
                          ),
                        ),
                        child: BaseChoiceChip(
                          label: toBeginningOfSentenceCase(item.value)!,
                          isSelected: index == 0
                              ? newData2Filter.isEmpty == true
                              : newData2Filter.contains(data2ListMap[index].key) == true,
                          onSelected: (value) {
                            // update specialities list
                            setState(() {
                              if (index == 0) {
                                // clear all specialities list
                                newData2Filter = <int>[];
                              } else {
                                // add or remove speciality
                                final curData2Filter = [...newData2Filter];
                                if (value) {
                                  newData2Filter = [...curData2Filter, item.key];
                                  if (newData2Filter.length == widget.data2Map.length - 1) {
                                    newData2Filter = <int>[];
                                  }
                                  newData2Filter.sort();
                                } else {
                                  newData2Filter = [...curData2Filter]..remove(item.key);
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

                // data3 (sorting) filters
                Text(
                  S.current.sorting,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.displayMedium,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                const EmptyProportionalSpace(height: 15),
                FilterDropDown<int>(
                  value: newData3Filter,
                  data: data3ListMapValues,
                  itemBuilder: (item) {
                    var index = data3ListMapValues.indexOf(item);
                    if (index < 0) {
                      index = 0;
                    }
                    final text = data3ListMap[index].value;
                    return DropdownMenuItem<int>(
                      value: item,
                      child: Text(
                        text, style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(
                          color: context.theme.colorScheme.onTertiaryContainer,
                        ),
                      ),
                    );
                  },
                  onChanged: (value) {
                    setState(() {
                      newData3Filter = value ?? 0;
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

          // buttons field
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
                      _scrollController1.animateTo(
                        0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                      _scrollController2.animateTo(
                        0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                      newData1Filter = <String>[];
                      newData2Filter = <int>[];
                      newData3Filter = 0;
                    });
                  },
                  width: Dimens.getScreenWidth(context) * 0.21282,
                  paddingVertical: Dimens.getProportionalHeight(context, 5),
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  preferGradient: false,
                  child: Text(
                    S.current.reset,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.bodyMedium,
                    ).copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const EmptyProportionalSpace(width: 10),
                PrimaryFillButton(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onApplyFilters?.call(newData1Filter, newData2Filter, newData3Filter);
                  },
                  width: Dimens.getScreenWidth(context) * 0.21282,
                  paddingVertical: Dimens.getProportionalHeight(context, 5),
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  preferGradient: false,
                  hasShadow: false,
                  child: Text(
                    S.current.filter,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.bodyMedium,
                    ).copyWith(
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
