import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_highlighter/themes/a11y-light.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/custom_hightlight_view.dart';
// import 'package:markdown_widget/markdown_widget.dart';

class MarkdownContent extends StatelessWidget {
  const MarkdownContent({
    super.key,
    required this.data,
    this.language = 'dart',
  });

  final String data, language;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: '```\n$data\n```',
      shrinkWrap: true,
      selectable: true,
      builders: {
        'code': CodeElementBuilder(language: language),
      },
    );
  }
}

// custom code element builder for flutter_markdown
class CodeElementBuilder extends MarkdownElementBuilder {
  CodeElementBuilder({required this.language});

  final String language;

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    return NotificationListener(
      onNotification: (notification) {
        return true;
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          children: [
            CustomHighlightView(
              // The original code to be highlighted
              element.textContent,

              // Specify language
              // It is recommended to give it a value for performance
              language: language,

              autoDetection: true,

              // Specify highlight theme
              // All available themes are listed in `themes` folder
              theme: a11yLightTheme,

              // Specify padding
              padding: const EdgeInsets.all(8),

              // text style
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// custom code block node for markdown_widget
// class CustomCodeBlockNode extends ElementNode {
//   CustomCodeBlockNode(this.content, this.preConfig, this.scrollController);
//
//   final String content;
//   final PreConfig preConfig;
//   final ScrollController? scrollController;
//
//   @override
//   InlineSpan build() {
//     final splitContents = content.split(RegExp(r'(\r?\n)|(\r?\t)|(\r)'));
//     if(splitContents.last.isEmpty) splitContents.removeLast();
//     return WidgetSpan(
//         child: Container(
//           decoration: preConfig.decoration,
//           margin: preConfig.margin,
//           padding: preConfig.padding,
//           width: double.infinity,
//           child: NotificationListener(
//             onNotification: (notification) {
//               return true;
//             },
//             child: Scrollbar(
//               controller: scrollController,
//               thumbVisibility: true,
//               child: SingleChildScrollView(
//                 controller: scrollController,
//                 physics: const ClampingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: List.generate(splitContents.length, (index) {
//                     final currentContent = splitContents[index];
//                     return ProxyRichText(TextSpan(
//                       children: highLightSpans(currentContent,
//                           language: preConfig.language,
//                           theme: preConfig.theme,
//                           textStyle: style),
//                     ));
//                   }),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
//
//   @override
//   TextStyle get style => preConfig.textStyle.merge(parentStyle);
// }
