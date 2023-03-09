import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color fromRgba(int r, int g, int b, double a) {
    return Color.fromRGBO(r, g, b, a);
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true, bool withAlpha = false}) => '${leadingHashSign ? '#' : ''}'
      '${withAlpha ? alpha.toRadixString(16).padLeft(2, '0') : ''}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AppColors {
  static const transparent = Colors.transparent;
  static const white = Colors.white; // #FFFFFF
  static const black = Colors.black; // #000000

  static final primaryBlue100 = HexColor.fromHex('#E0EAFF');
  static final primaryBlue200 = HexColor.fromHex('#DAEAFC');
  static final primaryBlue300 = HexColor.fromHex('#169EFF');
  static final primaryBlue400 = HexColor.fromHex('#2381EF');
  static final primaryBlue500 = HexColor.fromHex('#0F68D0');
  static final primaryBlue800 = HexColor.fromHex('#26394D');
  static final primaryBlue900 = HexColor.fromHex('#213344');

  static final neutralBlue100 = HexColor.fromHex('#E4E6E9');
  static final neutralBlue200 = HexColor.fromHex('#EDEEF0');
  static final neutralBlue400 = HexColor.fromHex('#B7BDC4');
  static final neutralBlue500 = HexColor.fromHex('#8A949F');
  static final neutralBlue700 = HexColor.fromHex('#35393A');
  static final neutralBlue900 = HexColor.fromHex('#232425');

  static final red300 = HexColor.fromHex('#F94B23');
  static final red400 = HexColor.fromHex('#EF2323');
  static final red700 = HexColor.fromHex('#CF8D8D');

  static final neutralRed200 = HexColor.fromHex('#F6EAEA');
  static final neutralRed700 = HexColor.fromHex('#3D2F23');

  static final grey = HexColor.fromHex('#C0C5CA');

  static final primaryGradient = LinearGradient(
    colors: [primaryBlue400, primaryBlue500],
  );
}

class Effects {
  // shadow effects
  static final primaryShadow = BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 8,
    color: AppColors.primaryBlue400.withOpacity(0.44),
  );
  static final normalShadowXS = BoxShadow(
    offset: const Offset(-2, 5),
    blurRadius: 5,
    color: AppColors.black.withOpacity(0.08),
  );
  static final normalShadowSM = BoxShadow(
    offset: const Offset(-2, 5),
    blurRadius: 14,
    color: AppColors.black.withOpacity(0.25),
  );
}
