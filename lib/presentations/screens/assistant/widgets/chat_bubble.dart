import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/chat_bubble_painter.dart';
import 'package:one_one_learn/presentations/screens/assistant/widgets/markdown_content.dart';
import 'package:one_one_learn/presentations/widgets/others/assistant_icon_widget.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({
    super.key,
    this.isMe = true,
    this.isPlaying = false,
    this.message = '',
    required this.index,
    this.onPlayTap
  });

  final bool isMe, isPlaying;
  final String message;
  final int index;
  final Future<void> Function()? onPlayTap;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  double verticalPadding = 10;
  late final FocusNode _focusNode;
  late final CupertinoTextSelectionControls _selectionControls;

  @override
  void initState() {
    _focusNode = FocusNode();
    _selectionControls = CupertinoTextSelectionControls();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: verticalPadding,
        // bottom: verticalPadding,
        left: widget.isMe ? 0 : 7,
        right: widget.isMe ? 7 : 0,
      ),
      width: Dimens.getScreenWidth(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: widget.isMe ? buildMyMessage() : buildPartnerMessage(),
          ),
        ],
      ),
    );
  }

  Widget buildMyMessage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CustomPaint(
        painter: ChatBubblePainter(
          scrollable: Scrollable.of(context),
          colors: AppColors.primaryGradient.colors,
          colorStops: [0.12, 0.9],
          bubbleContext: context,
        ),
        child: messageWidget(),
      ),
    );
  }

  Widget buildPartnerMessage() {
    return Row(
      children: [
        AssistantIconWidget(
          width: Dimens.getScreenWidth(context) * 0.055,
          height: Dimens.getScreenWidth(context) * 0.055,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CustomPaint(
              painter: ChatBubblePainter(
                scrollable: Scrollable.of(context),
                colors: [
                  context.theme.colorScheme.outlineVariant,
                  context.theme.colorScheme.outlineVariant,
                ],
                bubbleContext: context,
              ),
              child: messageWidget(),
            ),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () async {
            await widget.onPlayTap?.call();
          },
          child: widget.isPlaying
              ? const Icon(Icons.pause_circle_outline_rounded)
              : const Icon(Icons.play_circle_outline_rounded),
        ),
      ],
    );
  }

  Widget messageWidget() {
    final messagesAsList = widget.isMe
        ? [widget.message]
        : widget.message.split(RegExp(r'(?<!\()```(?!```\))'));
    final length = messagesAsList.length;
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxWidth: Dimens.getScreenWidth(context) * 0.7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.isMe ? 0 : 10),
      ),
      child: SelectableRegion(
        focusNode: _focusNode,
        selectionControls: _selectionControls,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < length; i++)
              Container(
                margin: EdgeInsets.only(top: i == 0 ? 0 : 5),
                child: buildContentParts(i, length - 1, messagesAsList[i]),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildContentParts(int index, int maxIndex, String messagePart) {
    // prepare text to render by trying to remove new lines from start and end
    final textColor = widget.isMe ? AppColors.white : context.theme.colorScheme.onBackground;
    final length = messagePart.length;
    var firstIndex = 0, finalLength = length;
    for (var i = 0; i < length; i++) {
      final curLastIndex = length - 1 - i;
      if (messagePart[i] != '\n' && messagePart[curLastIndex] != '\n') {
        break;
      }
      if (messagePart[i] == '\n') {
        firstIndex = i + 1;
      }
      if (messagePart[curLastIndex] == '\n') {
        finalLength = curLastIndex;
      }
    }
    final messageToRender = messagePart.substring(firstIndex, finalLength);

    if (index.isEven) {
      if (messageToRender.isNotEmpty && (index == 0 || index == maxIndex)) {
        return Text(
          messageToRender,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        );
      }

      return const SizedBox.shrink();
    }

    if (kDebugMode) {
      print('messagePart: $messagePart');
    }

    final firstNewLineIndex = messagePart.indexOf('\n');
    var language = '';
    if (firstNewLineIndex > -1) {
      language = messagePart.substring(0, firstNewLineIndex);
    }

    return SizedBox(
      width: double.infinity,
      child: MarkdownContent(
        data: messageToRender,
        language: language,
      ),
    );
  }
}
