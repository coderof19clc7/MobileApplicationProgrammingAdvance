import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';

class FilterDropDown<T> extends StatelessWidget {
  const FilterDropDown({
    super.key,
    this.value,
    required this.data,
    this.selectedItemBuilder,
    required this.itemBuilder,
    this.leadingIcon,
  });

  final T? value;
  final List<T> data;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final DropdownMenuItem<T> Function(T item) itemBuilder;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.theme.colorScheme.outline,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalScreenWidth(context, 10),
      ),
      height: Dimens.getProportionalScreenHeight(context, 36),
      child: Row(
        children: [
          leadingIcon ?? const SizedBox.shrink(),
          DropdownButton<T>(
            value: value,
            selectedItemBuilder: selectedItemBuilder,
            icon: Container(
              margin: EdgeInsets.only(
                left: Dimens.getProportionalScreenWidth(context, 3),
              ),
              child: SvgPicture.string(SvgIcons.getIcon(
                SvgIconEnum.downArrow,
                fillColor: context.theme.iconTheme.color,
              )),
            ),
            menuMaxHeight: Dimens.getProportionalScreenHeight(context, 150),
            alignment: Alignment.center,
            items: data.map(itemBuilder).toList(),
            onChanged: (value) {},
            underline: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
