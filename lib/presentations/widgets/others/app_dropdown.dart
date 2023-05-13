import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    this.value,
    required this.data,
    this.selectedItemBuilder,
    required this.itemBuilder,
    this.leadingIcon,
    this.errorText,
    this.alignment = Alignment.centerLeft,
    this.width,
    this.verticalPadding,
    this.buttonStyleData,
    this.iconStyleData,
    this.dropdownStyleData,
    this.menuItemStyleData = const MenuItemStyleData(),
    this.dropdownSearchData,
    this.onChanged,
    this.onMenuStateChange,
  });

  final T? value;
  final List<T> data;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final DropdownMenuItem<T> Function(T item) itemBuilder;
  final AlignmentGeometry alignment;
  final Widget? leadingIcon;
  final String? errorText;
  final double? width, verticalPadding;
  final ButtonStyleData? buttonStyleData;
  final IconStyleData? iconStyleData;
  final DropdownStyleData? dropdownStyleData;
  final MenuItemStyleData menuItemStyleData;
  final DropdownSearchData<T>? dropdownSearchData;
  final Function(T? value)? onChanged;
  final Function(bool)? onMenuStateChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField2<T>(
        value: value,
        isExpanded: true,
        selectedItemBuilder: selectedItemBuilder,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: context.theme.colorScheme.surfaceTint,
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? Dimens.getProportionalHeight(context, 7),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: context.theme.colorScheme.outline),
          ),
          errorText: errorText?.isNotEmpty == true ? errorText : null,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: context.theme.colorScheme.error),
          ),
        ),
        buttonStyleData: buttonStyleData ?? const ButtonStyleData(
          padding: EdgeInsets.zero,
        ),
        iconStyleData: iconStyleData ?? IconStyleData(
          icon: Container(
            margin: EdgeInsets.only(
              right: Dimens.getProportionalWidth(context, 10),
            ),
            child: SvgPicture.string(SvgIcons.getIcon(
              SvgIconEnum.downArrow,
              fillColor: context.theme.iconTheme.color,
            )),
          ),
        ),
        dropdownStyleData: dropdownStyleData ?? DropdownStyleData(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceTint,
            borderRadius: BorderRadius.circular(10),
          ),
          maxHeight: Dimens.getProportionalHeight(context, 150),
        ),
        menuItemStyleData: menuItemStyleData,
        dropdownSearchData: dropdownSearchData,
        alignment: alignment,
        items: data.map(itemBuilder).toList(),
        onChanged: onChanged,
        onMenuStateChange: onMenuStateChange,
      ),
    );
  }
}
