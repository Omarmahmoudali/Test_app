import 'dart:math';

import 'package:flutter/material.dart';

/// An extension for relative length units similar to CSS.
extension RelativeLength on double {
  static final _window = WidgetsBinding.instance!.window;
  static final _width = _window.physicalSize.width / _window.devicePixelRatio;
  static final _height = _window.physicalSize.height / _window.devicePixelRatio;
  static final _max = max(_width, _height);
  static final _min = min(_width, _height);

  /// Relative to 1% of the screen width.
  double get vw => (_width / 100.0) * this;

  /// Relative to 1% of the screen height.
  double get vh => (_height / 100.0) * this;

  /// Relative to 1% of the screen's smaller dimension.
  double get vmin => (_min / 100.0) * this;

  /// Relative to 1% of the screen's larger dimension.
  double get vmax => (_max / 100.0) * this;
}