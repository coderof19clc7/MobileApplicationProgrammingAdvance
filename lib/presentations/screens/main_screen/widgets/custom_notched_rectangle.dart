import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomNotchedRectangle extends NotchedShape {
  const CustomNotchedRectangle();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    const s1 = 15.0;
    const s2 = 8.0;
    const addedRadius = -1;

    final notchRadius = guest.width / 2.0 + addedRadius;
    final r = notchRadius;
    final a = -1.0 * r - s2;
    final b = host.top - guest.center.dy;

    final n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final p2yA = math.sqrt(r * r - p2xA * p2xA);
    final p2yB = math.sqrt(r * r - p2xB * p2xB);

    final p = <Offset>[Offset(a - s1, b), Offset(a, b)];
    final cmp = b < 0 ? -1.0 : 1.0;
    p
      ..add(cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB))
      ..add(Offset(-1.0 * p[2].dx, p[2].dy))
      ..add(Offset(-1.0 * p[1].dx, p[1].dy))
      ..add(Offset(-1.0 * p[0].dx, p[0].dy));

    for (var i = 0; i < p.length; i += 1) {
      p[i] += guest.center;
    }

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
