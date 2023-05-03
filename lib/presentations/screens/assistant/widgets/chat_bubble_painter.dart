import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ChatBubblePainter extends CustomPainter {
  ChatBubblePainter({
    required ScrollableState scrollable,
    required BuildContext bubbleContext,
    required List<Color> colors,
    List<double>? colorStops,
  })  : _scrollable = scrollable,
        _bubbleContext = bubbleContext,
        _colors = colors,
        _colorStops = colorStops,
        super(repaint: scrollable.position);

  final ScrollableState _scrollable;
  final BuildContext _bubbleContext;
  final List<Color> _colors;
  final List<double>? _colorStops;

  @override
  void paint(Canvas canvas, Size size) {
    final scrollableBox = _scrollable.context.findRenderObject() as RenderBox?;
    final bubbleBox = _bubbleContext.findRenderObject() as RenderBox?;

    if (scrollableBox == null || bubbleBox == null) {
      return;
    }

    if (_colors.length < 2) return;

    final scrollableRect = Offset.zero & scrollableBox.size;
    final origin = bubbleBox.localToGlobal(Offset.zero, ancestor: scrollableBox);
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        scrollableRect.topCenter,
        scrollableRect.bottomCenter,
        _colors,
        _colorStops,
        TileMode.clamp,
        Matrix4.translationValues(-origin.dx, -origin.dy, 0.0).storage,
      );
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(ChatBubblePainter oldDelegate) {
    return oldDelegate._scrollable != _scrollable ||
        oldDelegate._bubbleContext != _bubbleContext ||
        oldDelegate._colors != _colors;
  }
}
