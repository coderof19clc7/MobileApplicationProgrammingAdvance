import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class TextFieldOutline extends StatefulWidget {
  const TextFieldOutline({
    super.key,
    this.textController,
    this.minLines,
    this.maxLength,
    this.maxLines = 1,
    this.hintText,
    this.errorText,
    this.leftWidget,
    this.rightWidget,
    this.contentPadding,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.enable = true,
    this.isDense = true,
    this.canTextBeObscured = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  final TextEditingController? textController;
  final int? minLines, maxLength;
  final int maxLines;
  final String? hintText;
  final String? errorText;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final bool readOnly, enable, isDense;
  // true means the text field is used for password
  final bool canTextBeObscured;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;

  @override
  State<TextFieldOutline> createState() => _TextFieldOutlineState();
}

class _TextFieldOutlineState extends State<TextFieldOutline> {
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.canTextBeObscured;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
      onSubmitted: (value) {
        UIHelper.hideKeyboard(context);
        widget.onSubmitted?.call(value);
      },
      onTap: () {
        widget.onTap?.call();
      },
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium,
      ).copyWith(
        fontSize: Dimens.getProportionalHeight(context, 15),
      ),
      readOnly: widget.readOnly,
      enabled: widget.enable,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall,
        ).copyWith(
          fontSize: Dimens.getProportionalHeight(context, 15),
        ),
        filled: true,
        fillColor: context.theme.colorScheme.tertiaryContainer,
        contentPadding: widget.contentPadding,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.theme.colorScheme.error,
            width: 2,
          ),
        ),
        errorText: widget.errorText?.isNotEmpty == true ? widget.errorText : null,
        isDense: widget.isDense,
        border: OutlineInputBorder(
          borderSide: widget.errorText?.isNotEmpty == true
              ? BorderSide(color: context.theme.colorScheme.error)
              : BorderSide(color: context.theme.colorScheme.outline),
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: widget.leftWidget,
        suffixIcon: widget.canTextBeObscured
            ? GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            color: context.theme.colorScheme.onInverseSurface,
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        )
            : widget.rightWidget,
      ),
    );
  }
}
