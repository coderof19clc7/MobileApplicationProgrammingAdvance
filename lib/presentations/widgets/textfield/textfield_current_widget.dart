import 'package:flutter/material.dart';

///Created by Nguyen Huu Tuong on 02/03/2023.
class TextFieldCurrentWidget extends StatefulWidget {
  const TextFieldCurrentWidget({super.key, this.hintText,  this.leftWidget,  this.rightWidget});

  final String? hintText;
  final Widget? leftWidget;
  final Widget? rightWidget;

  @override
  State<TextFieldCurrentWidget> createState() => _TextFieldCurrentWidgetState();
}
class _TextFieldCurrentWidgetState extends State<TextFieldCurrentWidget> {
  bool _obscureText = true;
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // build widget textfield  has background radius and icon left email
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          controller: _textController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            hintText: widget.hintText ?? 'Enter your password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: InkWell(
              onTap: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: _obscureText ? Colors.grey : Colors.blue,
              ),
            ),
          ),
        )


    );
  }
}


