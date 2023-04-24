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
    required this.data1Values,
    this.data1CurrentFilter = const <String>[],
    this.data1RenderValues,
    required this.data2Values,
    this.data2CurrentFilter = const <int>[],
    this.data2RenderValues,
    required this.data3Values,
    this.data3CurrentFilter = 0,
    this.data3RenderValues,
    this.onApplyFilters,
  });

  final String label1, label2;
  final List<String> data1Values;
  final List<String> data1CurrentFilter;
  final List<String>? data1RenderValues;
  final List<int> data2Values;
  final List<int> data2CurrentFilter;
  final List<String>? data2RenderValues;
  final List<int> data3Values;
  final int data3CurrentFilter;
  final List<String>? data3RenderValues;
  final Function(List<String>, List<int>, int)? onApplyFilters;

  @override
  State<TutorsCoursesListFilterBottomSheet> createState() => _TutorsCoursesListFilterBottomSheetState();
}

class _TutorsCoursesListFilterBottomSheetState extends State<TutorsCoursesListFilterBottomSheet> {
  late ScrollController _scrollController1;
  late ScrollController _scrollController2;

  late List<String> newData1Filter;
  late List<int> newData2Filter;
  late int newData3Filter;

  @override
  void initState() {
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();

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
              // data1 (specialties or categories) filter
              Text(
                widget.label1,
                style: Dimens.getProportionalFont(
                  context,
                  context.theme.textTheme.displayMedium,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              const EmptyProportionalSpace(height: 15),
              SizedBox(
                height: Dimens.getScreenHeight(context) * 0.045,
                child: ListView.builder(
                  controller: _scrollController1,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.data1Values.length,
                  itemBuilder: (context, index) {
                    final label =  widget.data1RenderValues != null
                        ? widget.data1RenderValues![index]
                        : widget.data1Values[index];
                    return Container(
                      margin: EdgeInsets.only(
                        right: Dimens.getProportionalWidth(
                          context, (index == widget.data1Values.length - 1) ? 0 : 10,
                        ),
                      ),
                      child: BaseChoiceChip(
                        label: toBeginningOfSentenceCase(label)!,
                        isSelected: index == 0
                            ? newData1Filter.isEmpty == true
                            : newData1Filter.contains(widget.data1Values[index]) == true,
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
                                newData1Filter = [...curData1Filter, widget.data1Values[index]];
                                if (newData1Filter.length == widget.data1Values.length - 1) {
                                  newData1Filter = <String>[];
                                }
                              } else {
                                newData1Filter = [...curData1Filter]..remove(widget.data1Values[index]);
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
                  context,
                  context.theme.textTheme.displayMedium,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              const EmptyProportionalSpace(height: 15),
              SizedBox(
                height: Dimens.getScreenHeight(context) * 0.045,
                child: ListView.builder(
                  controller: _scrollController2,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.data2Values.length,
                  itemBuilder: (context, index) {
                    final label =  widget.data2RenderValues != null
                        ? widget.data2RenderValues![index]
                        : widget.data2Values[index].toString();
                    return Container(
                      margin: EdgeInsets.only(
                        right: Dimens.getProportionalWidth(
                          context, (index == widget.data2Values.length - 1) ? 0 : 10,
                        ),
                      ),
                      child: BaseChoiceChip(
                        label: toBeginningOfSentenceCase(label)!,
                        isSelected: index == 0
                            ? newData2Filter.isEmpty == true
                            : newData2Filter.contains(widget.data2Values[index]) == true,
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
                                newData2Filter = [...curData2Filter, widget.data2Values[index]];
                                if (newData2Filter.length == widget.data2Values.length - 1) {
                                  newData2Filter = <int>[];
                                }
                              } else {
                                newData2Filter = [...curData2Filter]..remove(widget.data2Values[index]);
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
                  context,
                  context.theme.textTheme.displayMedium,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              const EmptyProportionalSpace(height: 15),
              FilterDropDown<int>(
                value: newData3Filter,
                data: widget.data3Values,
                itemBuilder: (item) {
                  var index = widget.data3Values.indexOf(item);
                  if (index < 0) {
                    index = 0;
                  }
                  final text = '${widget.data3RenderValues != null
                      ? widget.data3RenderValues![index]
                      : widget.data3Values[index]}';
                  return DropdownMenuItem<int>(
                    value: item,
                    alignment: Alignment.center,
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
