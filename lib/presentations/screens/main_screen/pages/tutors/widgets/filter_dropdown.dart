import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
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
    this.alignment = Alignment.center,
  });

  final T? value;
  final List<T> data;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final DropdownMenuItem<T> Function(T item) itemBuilder;
  final AlignmentGeometry alignment;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceTint,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.theme.colorScheme.outline,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalWidth(context, 10),
        vertical: Dimens.getProportionalHeight(context, 7),
      ),
      // height: Dimens.getProportionalScreenHeight(context, 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leadingIcon ?? const SizedBox.shrink(),
              DropdownButton<T>(
                value: value,
                isDense: true,
                selectedItemBuilder: selectedItemBuilder,
                icon: Container(
                  margin: EdgeInsets.only(
                    left: Dimens.getProportionalWidth(context, 7),
                  ),
                  child: SvgPicture.string(SvgIcons.getIcon(
                    SvgIconEnum.downArrow,
                    fillColor: context.theme.iconTheme.color,
                  )),
                ),
                menuMaxHeight: Dimens.getProportionalHeight(context, 150),
                alignment: alignment,
                items: data.map(itemBuilder).toList(),
                onChanged: (value) {},
                underline: const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
