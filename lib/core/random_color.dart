import 'dart:math';
import 'dart:ui';

/// [RandomColor] generates random colors
class RandomColor {
  /// [generateUsingRGB] generates a random color using RGB
  static Color generateUsingRGB() {
    final r = Random().nextInt(256);
    final g = Random().nextInt(256);
    final b = Random().nextInt(256);

    return Color.fromRGBO(r, g, b, 1);
  }

  /// [generateUsingHex] generates a random color using HEX
  static Color generateUsingHex() {
    final Random random = Random();
    final int value =
        random.nextInt(0xFFFFFF + 1); // Same as 0xFFFFFF + 1 or 16777216
    final fullValue = (value << 8) | 0xFF;

    return Color(fullValue);
  }
}
