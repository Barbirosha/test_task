import 'dart:typed_data';
import 'dart:ui' as ui show Gradient;

import 'package:flutter/material.dart';

/// [AppRadiant] 2D radial gradient that use [centerOffset] to define the 
/// center of the gradient
class AppRadiant extends RadialGradient {
  /// [centerOffset] The center of the gradient, as an offset.
  final Offset? centerOffset;

  /// [tileModeGradient] How this gradient should tile the plane
  final TileMode? tileModeGradient;

  /// [AppRadiant] Creates a 2D radial gradient.
  const AppRadiant({
    required super.colors,
    required super.radius,
    this.centerOffset,
    super.stops,
    this.tileModeGradient,
  });

  @override
  Shader createShader(Rect rect, {TextDirection? textDirection}) {
    return ui.Gradient.radial(
      centerOffset ?? Offset.zero,
      radius * rect.shortestSide,
      colors,
      _impliedStops(),
      tileModeGradient ?? TileMode.clamp,
      _resolveTransform(rect, textDirection),
      focal?.resolve(textDirection).withinRect(rect),
      focalRadius * rect.shortestSide,
    );
  }

  List<double> _impliedStops() {
    if (stops != null) {
      return stops ?? <double>[];
    }
    const maxColors = 2;
    assert(
      colors.length >= maxColors,
      'colors list must have at least two colors',
    );
    final double separation = 1.0 / (colors.length - 1);

    return List<double>.generate(
      colors.length,
      (int index) => index * separation,
      growable: false,
    );
  }

  Float64List? _resolveTransform(Rect bounds, TextDirection? textDirection) {
    return transform?.transform(bounds, textDirection: textDirection)?.storage;
  }
}
