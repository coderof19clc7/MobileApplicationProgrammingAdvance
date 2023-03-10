import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class BaseChoiceChip extends StatelessWidget {
  const BaseChoiceChip({super.key, required this.label, this.isSelected = false, this.onSelected, this.unselectedBorderColor});

  final String label;
  final bool isSelected;
  final Function(bool value)? onSelected;
  final Color? unselectedBorderColor;

  @override
  Widget build(BuildContext context) {
    final ubColor = unselectedBorderColor ?? context.theme.colorScheme.outline;
    return FilterChip(
      label: Text(label),
      onSelected: onSelected,
      selected: isSelected,
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalScreenWidth(context, 10),
      ),
      visualDensity: VisualDensity.compact,
      shape: StadiumBorder(
        side: BorderSide(
          color: isSelected ? context.theme.colorScheme.primary : ubColor,
        ),
      ),
      backgroundColor: context.theme.colorScheme.surfaceTint,
      selectedColor: context.theme.colorScheme.primary,
      showCheckmark: false,
      labelStyle: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        color: isSelected
            ? context.theme.colorScheme.onPrimary
            : context.theme.colorScheme.onTertiaryContainer, // listen to state to change color
        fontSize: Dimens.getProportionalScreenWidth(context, 14),
      ),
    );
  }
}
