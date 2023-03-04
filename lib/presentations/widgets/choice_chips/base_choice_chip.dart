import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class BaseChoiceChip extends StatelessWidget {
  const BaseChoiceChip({
    super.key, required this.label, this.isSelected = false, this.onSelected,
  });

  final String label;
  final bool isSelected;
  final Function(bool value)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      onSelected: onSelected,
      selected: isSelected,
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalScreenWidth(context, 10),
      ),
      visualDensity: VisualDensity.compact,
      shape: StadiumBorder(
        side: BorderSide(
          color: isSelected ? AppColors.primaryBlue400 : AppColors.grey,
        ),
      ),
      backgroundColor: AppColors.white,
      selectedColor: AppColors.primaryBlue400,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.white : AppColors.black, // listen to state to change color
        fontSize: Dimens.getProportionalScreenWidth(context, 14),
      ),
    );
  }
}
