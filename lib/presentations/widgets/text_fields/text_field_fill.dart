import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class TextFieldFill extends StatefulWidget {
  const TextFieldFill({
    super.key,
    this.textController,
    this.hintText,
    this.leftWidget,
    this.rightWidget,
    this.contentPadding,
    this.keyboardType = TextInputType.text,
    this.canTextBeObscured = false,
  });

  final TextEditingController? textController;
  final String? hintText;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  // true means the text field is used for password
  final bool canTextBeObscured;

  @override
  State<TextFieldFill> createState() => _TextFieldFillState();
}

class _TextFieldFillState extends State<TextFieldFill> {
  late bool _obscureText;
  late TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.canTextBeObscured;
    _textController = widget.textController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // build widget textfield  has background radius and icon left email
    return TextField(
      controller: _textController,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintStyle: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          fontSize: Dimens.getProportionalScreenWidth(context, 14),
          color: context.theme.colorScheme.onInverseSurface,
        ),
        filled: true,
        fillColor: context.theme.colorScheme.inverseSurface,
        contentPadding: widget.contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
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
