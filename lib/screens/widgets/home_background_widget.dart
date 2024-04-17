import 'package:flutter/material.dart';
import 'package:test_task/core/random_color.dart';
import 'package:test_task/screens/widgets/app_radiant.dart';

/// [HomeBackgroundWidget] is the background widget on the home screen
class HomeBackgroundWidget extends StatefulWidget {
  /// [colorGenerationType] The type of color generation
  final ColorGenerationType colorGenerationType;

  /// Creates a [HomeBackgroundWidget]

  const HomeBackgroundWidget({
    super.key,
    this.colorGenerationType = ColorGenerationType.hex,
  });

  @override
  State<HomeBackgroundWidget> createState() => __HomeBackgroundState();
}

class __HomeBackgroundState extends State<HomeBackgroundWidget>
    with SingleTickerProviderStateMixin {
  static const ColorGenerationType _colorGenerationType =
      ColorGenerationType.hex;

  late final AnimationController _controller;
  Color? _color;
  Color? _previousColor;
  Offset? centerOffset;

  @override
  void initState() {
    super.initState();
    _color = _generateRandomColor();
    _previousColor = _color;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      value: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: _onTap,
      child: SizedBox.expand(
        child: AnimatedBuilder(
          animation: _controller,
          // ignore: avoid_unused_parameters
          builder: (context, child) {
            return CustomPaint(
              painter: BackgroundPainter(
                color: _color ?? Colors.white,
                previousColor: _previousColor ?? Colors.white,
                centerOffset: centerOffset ?? Offset.zero,
                progress: _controller.value,
              ),
            );
          },
        ),
      ),
    );
  }

  void _onTap(TapDownDetails details) {
    _previousColor = _color;
    _color = _generateRandomColor();
    centerOffset = details.localPosition;
    _controller.forward(from: 0);
  }

  Color _generateRandomColor() {
    switch (_colorGenerationType) {
      case ColorGenerationType.rgb:
        return RandomColor.generateUsingRGB();
      case ColorGenerationType.hex:
        return RandomColor.generateUsingHex();
    }
  }
}

/// [ColorGenerationType] is the type of color generation
enum ColorGenerationType {
  ///[rgb] RGB

  rgb,

  /// [hex] HEX

  hex,
}

/// [BackgroundPainter] is a custom painter for the background
class BackgroundPainter extends CustomPainter {
  static const _k = 3;

  /// [centerOffset] The center of the gradient, as an offset.
  /// Use this property to specify the center of the gradient.
  final Offset centerOffset;

  /// [color] The color of the gradient
  final Color color;

  /// [previousColor] The previous color of the gradient
  final Color previousColor;

  /// [progress] The progress of the gradient
  final double progress;

  /// [BackgroundPainter] Creates a custom painter for the background
  BackgroundPainter({
    required this.centerOffset,
    required this.color,
    required this.previousColor,
    required this.progress,
    super.repaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;
    final rect = Rect.fromLTWH(
      0,
      0,
      size.width * _k,
      size.height * _k,
    );

    paint.shader = AppRadiant(
      stops: const [
        0.8,
        1,
      ],
      colors: [
        color,
        previousColor,
      ],
      centerOffset: centerOffset,
      radius: progress,
    ).createShader(rect);

    canvas.drawPaint(paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
