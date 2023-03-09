import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class BaseChoiceChip extends StatelessWidget {
  const BaseChoiceChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
  });

  final String label;
  final bool isSelected;
  final Function(bool value)? onSelected;

  @override
  Widget build(BuildContext context) {
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
          color: isSelected ? context.theme.colorScheme.primary : context.theme.colorScheme.outline,
        ),
      ),
      backgroundColor: context.theme.colorScheme.tertiaryContainer,
      selectedColor: context.theme.colorScheme.primary,
      showCheckmark: false,
      labelStyle: TextStyle(
        color: isSelected
            ? context.theme.colorScheme.onPrimary
            : context.theme.colorScheme.onTertiaryContainer, // listen to state to change color
        fontSize: Dimens.getProportionalScreenWidth(context, 14),
      ),
    );
  }
}
