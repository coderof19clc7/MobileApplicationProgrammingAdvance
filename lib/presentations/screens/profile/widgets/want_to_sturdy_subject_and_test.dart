import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/base_choice_chip.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class WantToSturdySubjectAndTest extends StatelessWidget {
  const WantToSturdySubjectAndTest({
    super.key,
    this.isEdit = false,
    this.listSelectedLearnTopics = const [],
    this.listSelectedTestPreparations = const [],
    this.onSelected,
  });

  final bool isEdit;
  final List<String> listSelectedLearnTopics;
  final List<String> listSelectedTestPreparations;
  final void Function(bool, bool, String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      clipBehavior: Clip.hardEdge,
      spacing: Dimens.getProportionalWidth(context, 8),
      runSpacing: Dimens.getProportionalWidth(context, 8),
      children: [
        ...buildListWantToSturdy(context),
        ...buildListWantToSturdy(context, isLearnTopics: false),
      ],
    );
  }

  List<Widget> buildListWantToSturdy(BuildContext context, {
    bool isLearnTopics = true,
  }) {
    final dataList = isLearnTopics
        ? MapConstants.learnTopicsMap.entries
        : MapConstants.testPreparationsMap.entries;
    final selectedList = isLearnTopics ? listSelectedLearnTopics : listSelectedTestPreparations;

    if (!isEdit) {
      return selectedList.map((e) {
        return FakeChip(text: e);
      }).toList();
    }

    return dataList.map((e) {
      return BaseChoiceChip(
        label: e.value['name'] ?? '',
        isSelected: selectedList.contains(e.key),
        onSelected: (value) {
          onSelected?.call(isLearnTopics, value, e.key);
        },
      );
    }).toList();
  }
}
