import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:layout_tester/src/trait_assert/assert.dart';

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

/// List of possible relations for [RelationAssert].
enum PropertyRelation {
  /// Property is equal value.
  equal,

  /// Property is unequal value.
  unEqual,

  /// Property is greater than value.
  greaterThan,

  /// Property is greater than or equal value.
  greaterThanEqual,

  /// Property is less than value.
  lessThan,

  /// Property is less than or equal value.
  lessThanEqual;

  /// Applies the appropriate operation for this [PropertyRelation] entry.
  bool evaluate(num value, num compareValue) {
    switch (this) {
      case PropertyRelation.equal:
        return value == compareValue;
      case PropertyRelation.unEqual:
        return value != compareValue;
      case PropertyRelation.greaterThan:
        return value > compareValue;
      case PropertyRelation.greaterThanEqual:
        return value >= compareValue;
      case PropertyRelation.lessThan:
        return value < compareValue;
      case PropertyRelation.lessThanEqual:
        return value <= compareValue;
    }
  }
}

/// Describes the state of a widget in relation to a specified value.
class RelationAssert extends TraitAssert with EquatableMixin {
  /// Creates an instance of [RelationAssert].
  const RelationAssert({
    required this.relation,
    required this.value,
    required this.action,
  });

  /// The treated relation.
  final PropertyRelation relation;

  /// The compare value.
  final double value;

  /// The action to perform.
  final bool Function(Rect targetBounds, double value) action;

  /// Invokes [action] with [value] and the provided bounds parameter.
  bool evaluate(Rect targetBounds) => action(targetBounds, value);

  @override
  List<Object?> get props => [relation, value, action];
}