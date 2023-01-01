import 'package:equatable/equatable.dart';

import 'base.dart';

/// Describes the position of a widget targeted by [WidgetTrait].
///
/// The positional information is relative to the test screen dimension.
class PositionAssert extends TraitAssert with EquatableMixin {
  /// Creates an instance of [PositionAssert].
  const PositionAssert({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  /// Creates an instance of [PositionAssert] with all values
  /// (left, top, right, bottom) set.
  // ignore: non_constant_identifier_names
  const PositionAssert.LTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) : this(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );

  /// Offset to the left border of the scope.
  final double? left;

  /// Offset to the top border of the scope.
  final double? top;

  /// Offset to the right border of the scope.
  final double? right;

  /// Offset to the bottom border of the scope.
  final double? bottom;

  /// Returns the values for [left], [top], [right] and [bottom] in a list.
  List<double?> getLTRB() => [left, top, right, bottom];

  @override
  List<Object?> get props => [left, top, right, bottom];
}

/// Describes the size of a widget targeted by [WidgetTrait].
///
/// The dimensional information is relative to the test screen dimension.
class SizeAssert extends TraitAssert with EquatableMixin {
  /// Creates an instance of [SizeAssert].
  const SizeAssert({
    this.width,
    this.height,
  });

  /// Creates an instance of [SizeAssert] with all values (width, height) set.
  // ignore: non_constant_identifier_names
  const SizeAssert.WH(double width, double height)
      : this(width: width, height: height);

  /// Creates an instance of [SizeAssert] with all values set to [value].
  const SizeAssert.symmetric(double value) : this(width: value, height: value);

  /// The width.
  final double? width;

  /// The height.
  final double? height;

  @override
  List<Object?> get props => [width, height];
}
