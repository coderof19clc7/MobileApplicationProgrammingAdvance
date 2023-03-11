import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/profile_edit_mode_widget.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/profile_view_mode_widget.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:intl/intl.dart'; 

class DateModel {
  DateTime date;
  String weekday;
  DateModel({required this.date, required this.weekday});
}

class DataSelectFilter {
//<editor-fold desc="Data Methods">
  DataSelectFilter({
    this.name,
    this.nameOther,
    this.isSelect = false,
    this.index,
  });
  DataSelectFilter.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    nameOther = json['nameOther'] as String;
    isSelect = json['isSelect'] as bool? ?? false;
    index = json['index'] as int;
  }
  String? name;
  String? nameOther;
  bool isSelect = false;
  int? index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['nameOther'] = nameOther;
    map['isSelect'] = isSelect;
    map['index'] = index;
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataSelectFilter &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          nameOther == other.nameOther &&
          isSelect == other.isSelect &&
          index == other.index);

  @override
  int get hashCode => name.hashCode ^ nameOther.hashCode ^ isSelect.hashCode ^ index.hashCode;

  @override
  String toString() {
    return 'DataSelectFilter{ name: $name, nameOther: $nameOther, isSelect: $isSelect, index: $index, }';
  }

  DataSelectFilter copyWith({
    String? name,
    String? nameOther,
    bool? isSelect,
    int? index,
  }) {
    return DataSelectFilter(
      name: name ?? this.name,
      nameOther: nameOther ?? this.nameOther,
      isSelect: isSelect ?? this.isSelect,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nameOther': nameOther,
      'isSelect': isSelect,
      'index': index,
    };
  }

  factory DataSelectFilter.fromMap(Map<String, dynamic> map) {
    return DataSelectFilter(
      name: map['name'] as String,
      nameOther: map['nameOther'] as String,
      isSelect: map['isSelect'] as bool,
      index: map['index'] as int,
    );
  }

//</editor-fold>
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _isEditMode = false;
  @override
  void initState() {
    super.initState();
// get current date and time
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    // create a list to store the dates and weekdays for the current month
    final datesAndWeekdays = <DateModel>[];
    // loop through the days of the month and add them to the list
    for (var i = 1; i <= daysInMonth; i++) {
      final date = DateTime(now.year, now.month, i);
      final weekday = DateFormat('EEEE', 'vi').format(date);
      final model = DateModel(date: date, weekday: weekday);
      datesAndWeekdays.add(model);
    }
    // print the dates and weekdays in the list
    for (final model in datesAndWeekdays) {
      print('${model.date} is a ${model.weekday}');
    }
  }

  // function weekdays current of month
  List<String> getListWeekOfMonth() {
    final list = <String>[];
    // final now = DateTime.now();
    final now = DateTime(2023, 3, 15);

    final firstDayOfMonth = DateTime(now.year, now.month);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    final firstWeekDay = firstDayOfMonth.weekday;
    final lastWeekDay = lastDayOfMonth.weekday;

    final firstWeekDayOfMonth = firstDayOfMonth.subtract(Duration(days: firstWeekDay - 1));
    final lastWeekDayOfMonth = lastDayOfMonth.add(Duration(days: 7 - lastWeekDay));

    for (var i = 0; i < lastWeekDayOfMonth.difference(firstWeekDayOfMonth).inDays / 7; i++) {
      list.add('Tuần ${i + 1}');
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleTransparentAppBar(
        height: Dimens.getTopSafeAreaHeight(context),
        actions: [
          !_isEditMode ? Padding(
            padding: EdgeInsets.only(right: Dimens.getScreenWidth(context) * 0.04),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isEditMode = !_isEditMode;
                });
              },
              child: Icon(
                Icons.edit,
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ) : const SizedBox.shrink(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.getScreenWidth(context) * 0.05,
          vertical: Dimens.getScreenWidth(context) * 0.02,
        ),
        child: !_isEditMode
            ? const ProfileViewModeWidget() : const ProfileEditModeWidget(),
      ),
    );
  }
}
