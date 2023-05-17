import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class TextFieldFill extends StatefulWidget {
  const TextFieldFill({
    super.key,
    this.textController,
    this.minLines,
    this.maxLines = 1,
    this.hintText,
    this.errorText,
    this.leftWidget,
    this.rightWidget,
    this.contentPadding,
    this.keyboardType = TextInputType.text,
    this.isDense = false,
    this.canTextBeObscured = false,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? textController;
  final int? minLines;
  final int maxLines;
  final String? hintText;
  final String? errorText;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  // true means the text field is used for password
  final bool isDense, canTextBeObscured;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  State<TextFieldFill> createState() => _TextFieldFillState();
}

class _TextFieldFillState extends State<TextFieldFill> {
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.canTextBeObscured;
  }

  @override
  Widget build(BuildContext context) {
    // build widget textfield  has background radius and icon left email
    return TextField(
      controller: widget.textController,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintStyle: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          fontSize: Dimens.getProportionalWidth(context, 14),
          color: context.theme.colorScheme.onInverseSurface,
        ),
        filled: true,
        fillColor: context.theme.colorScheme.inverseSurface,
        contentPadding: widget.contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        isDense: widget.isDense,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.theme.colorScheme.error,
          ),
        ),
        errorText: widget.errorText?.isNotEmpty == true ? widget.errorText : null,
        hintText: widget.hintText,
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
