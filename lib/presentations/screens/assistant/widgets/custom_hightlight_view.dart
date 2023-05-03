import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highlighter/highlighter.dart' show highlight, Node;
import 'package:highlighter/languages/all.dart';

/// Highlight Flutter Widget
class CustomHighlightView extends StatelessWidget {
  /// The original code to be highlighted
  final String source;

  /// Highlight language
  ///
  /// It is recommended to give it a value for performance
  ///
  /// [All available languages](https://github.com/predatorx7/highlight/tree/master/highlight/lib/languages)
  final String? language;

  final bool autoDetection;

  /// Highlight theme
  ///
  /// [All available themes](https://github.com/predatorx7/highlight/blob/master/flutter_highlighter/lib/themes)
  final Map<String, TextStyle> theme;

  /// Padding
  final EdgeInsetsGeometry? padding;

  /// Text styles
  ///
  /// Specify text styles such as font family and font size
  final TextStyle? textStyle;

  CustomHighlightView(String input, {
    super.key,
    this.language,
    this.autoDetection = false,
    this.theme = const {},
    this.padding,
    this.textStyle,
    int tabSize = 8, // TODO: https://github.com/flutter/flutter/issues/50087
  }) : source = input.replaceAll('\t', ' ' * tabSize);

  List<TextSpan> _convert(List<Node> nodes) {
    List<TextSpan> spans = [];
    var currentSpans = spans;
    List<List<TextSpan>> stack = [];

    traverse(Node node) {
      if (node.value != null) {
        currentSpans.add(node.className == null
            ? TextSpan(text: node.value)
            : TextSpan(text: node.value, style: theme[node.className!]));
      } else if (node.children != null) {
        List<TextSpan> tmp = [];
        currentSpans
            .add(TextSpan(children: tmp, style: theme[node.className!]));
        stack.add(currentSpans);
        currentSpans = tmp;

        for (var n in node.children!) {
          traverse(n);
          if (n == node.children!.last) {
            currentSpans = stack.isEmpty ? spans : stack.removeLast();
          }
        }
      }
    }

    for (var node in nodes) {
      traverse(node);
    }

    return spans;
  }

  static const _rootKey = 'root';
  static const _defaultFontColor = Color(0xff000000);
  static const _defaultBackgroundColor = Color(0xffffffff);

  // TODO: dart:io is not available at web platform currently
  // See: https://github.com/flutter/flutter/issues/39998
  // So we just use monospace here for now
  static const _defaultFontFamily = 'monospace';

  @override
  Widget build(BuildContext context) {
    var finalTextStyle = TextStyle(
      fontFamily: _defaultFontFamily,
      color: theme[_rootKey]?.color ?? _defaultFontColor,
    );
    finalTextStyle = finalTextStyle.merge(textStyle);
    final allSupportedLanguages = allLanguages.keys.toList();
    var languageToRender =
    allSupportedLanguages.contains(language ?? '') ? language : 'dart';

    return Container(
      color: theme[_rootKey]?.backgroundColor ?? _defaultBackgroundColor,
      padding: padding,
      child: Text.rich(
        TextSpan(
          style: finalTextStyle,
          children:
          _convert(highlight.parse(
            source, language: languageToRender, autoDetection: autoDetection,
          ).nodes!),
        ),
      ),
    );
  }
}
