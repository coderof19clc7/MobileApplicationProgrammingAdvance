import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/simple_list_fake_chips.dart';
import 'package:one_one_learn/presentations/widgets/others/app_dropdown.dart';
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
  late final List<int> data2ListMapKeys;
  late final Map<int, void Function(void Function())> data2MenuSetStateMap;
  late final List<int> data3ListMapKeys;

  late List<String> newData1Filter;
  late List<int> newData2Filter;
  late int newData3Filter;

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();

    data1ListMap = widget.data1Map.entries.toList();
    data2ListMapKeys = widget.data2Map.keys.toList();
    data2MenuSetStateMap = {};
    data3ListMapKeys = widget.data3Map.keys.toList();

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

  void onNewFilterData1Changed({
    required MapEntry<String, String> item, required bool isSelected,
  }) {
    final isFirst = (item.key == data1ListMap.first.key)
        && (item.value == data1ListMap.first.value);
    setState(() {
      if (isFirst) {
        // clear all specialities list
        newData1Filter = <String>[];
      } else {
        // add or remove speciality
        final curData1Filter = [...newData1Filter];
        if (isSelected) {
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
  }

  void onNewFilterData2Changed({required int item, required bool isSelected}) {
    // update new data2 filter
    var needClearAll = false;
    if (item == data2ListMapKeys.first) {
      // clear all specialities list
      newData2Filter = <int>[];
      needClearAll = true;
    } else {
      // add or remove speciality
      final curData2Filter = [...newData2Filter];
      if (isSelected) {
        newData2Filter = [...curData2Filter, item];
        if (newData2Filter.length == widget.data2Map.length - 1) {
          newData2Filter = <int>[];
          needClearAll = true;
        }
        newData2Filter.sort();
      } else {
        newData2Filter = [...curData2Filter]..remove(item);
      }
    }

    // re-render UI
    setState(() {});
    if (needClearAll) {
      final listMenuSetStateFunction = data2MenuSetStateMap.values.toList();
      for (final menuSetStateFunction in listMenuSetStateFunction) {
        menuSetStateFunction(() {});
      }
    } else {
      data2MenuSetStateMap[item]?.call(() {});
      data2MenuSetStateMap[data2ListMapKeys.first]?.call(() {});
    }
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
                const EmptyProportionalSpace(height: 5),
                Wrap(
                  clipBehavior: Clip.hardEdge,
                  spacing: Dimens.getProportionalWidth(context, 8),
                  children: data1ListMap.map((item) {
                    final isFirst = (item.key == data1ListMap[0].key)
                        && (item.value == data1ListMap[0].value);
                    return BaseChoiceChip(
                      label: toBeginningOfSentenceCase(item.value)!,
                      isSelected: isFirst
                          ? newData1Filter.isEmpty == true
                          : newData1Filter.contains(item.key) == true,
                      onSelected: (value) {
                        onNewFilterData1Changed(item: item, isSelected: value);
                      },
                      unselectedBorderColor: context.theme.colorScheme.outlineVariant,
                    );
                  }).toList(),
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
                AppDropDown<int>(
                  value: newData2Filter.isEmpty ? data2ListMapKeys.first : newData2Filter.last,
                  data: data2ListMapKeys,
                  width: Dimens.getScreenWidth(context) * 0.5,
                  itemBuilder: (item) {
                    final text = widget.data2Map[item] ?? '';
                    return DropdownMenuItem<int>(
                      value: item,
                      enabled: false,
                      child: StatefulBuilder(
                        builder: (context, menuSetState) {
                          data2MenuSetStateMap[item] = menuSetState;
                          var isSelected = false;
                          if (newData2Filter.isEmpty) {
                            isSelected = item == data2ListMapKeys.first;
                          } else {
                            isSelected = newData2Filter.contains(item);
                          }

                          return ListTileTheme(
                            horizontalTitleGap: 0,
                            child: CheckboxListTile(
                              value: isSelected,
                              onChanged: (value) {
                                if (value != null) {
                                  onNewFilterData2Changed(item: item, isSelected: value);
                                }
                              },
                              activeColor: context.theme.colorScheme.primary,
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              title: Text(
                                text,
                                style: Dimens.getProportionalFont(
                                  context, context.theme.textTheme.bodyMedium,
                                ).copyWith(
                                  color: context.theme.colorScheme.onTertiaryContainer,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  selectedItemBuilder: (context) {
                    return data2ListMapKeys.map((item) {
                      final count = item == data2ListMapKeys.first
                          ? data2ListMapKeys.length - 1
                          : newData2Filter.length;
                      return Text(
                        '$count ${S.current.item.toLowerCase()}',
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(
                          color: context.theme.colorScheme.onTertiaryContainer,
                        ),
                      );},
                    ).toList();
                  },
                  onChanged: (value) {},
                ),
                const EmptyProportionalSpace(height: 7),
                SimpleListFakeChips(
                  listData: newData2Filter.isEmpty
                      ? ([...data2ListMapKeys]..removeAt(0)).map((e) {
                    return widget.data2Map[e] ?? '';
                  }).toList()
                      : newData2Filter.map((e) {
                    return widget.data2Map[e] ?? '';
                  }).toList(),
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
                AppDropDown<int>(
                  value: newData3Filter,
                  data: data3ListMapKeys,
                  width: Dimens.getScreenWidth(context) * 0.5,
                  itemBuilder: (item) {
                    final text = widget.data3Map[item] ?? '';
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
                  width: Dimens.getScreenWidth(context) * 0.25,
                  paddingVertical: Dimens.getProportionalHeight(context, 10),
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  preferGradient: false,
                  child: Text(
                    S.current.reset,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.bodyMedium,
                    ).copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                      fontSize: Dimens.getProportionalWidth(context, 16),
                    ),
                  ),
                ),
                const EmptyProportionalSpace(width: 10),
                PrimaryFillButton(
                  onTap: () {
                    Navigator.pop(context);
                    widget.onApplyFilters?.call(newData1Filter, newData2Filter, newData3Filter);
                  },
                  width: Dimens.getScreenWidth(context) * 0.25,
                  paddingVertical: Dimens.getProportionalHeight(context, 10),
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  preferGradient: false,
                  hasShadow: false,
                  child: Text(
                    S.current.filter,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.bodyMedium,
                    ).copyWith(
                      color: context.theme.colorScheme.onPrimary,
                      fontSize: Dimens.getProportionalWidth(context, 16),
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
