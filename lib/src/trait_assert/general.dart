import 'dart:ui';
import 'package:flutter_test/flutter_test.dart' as ft;

import 'package:layout_tester/src/trait_assert/assert.dart';
import 'package:layout_tester/src/trait_assert/evaluator.dart';
import 'package:layout_tester/src/widget_trait.dart';

import 'base.dart';

/// Describes the position of a widget targeted by [WidgetTrait].
///
/// The positional information is relative to the test screen dimension.
class PositionAssert extends GeneralTraitAssert {
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

  /// Creates an instance of [PositionAssert] with the given location.
  const PositionAssert.location(double x, double y) : this(left: x, top: y);

  /// Creates an instance of [PositionAssert] from the given offset.
  PositionAssert.offset(Offset offset) : this(left: offset.dx, top: offset.dy);

  /// Creates an instance of [PositionAssert] from the given rectangle.
  PositionAssert.bounds(Rect rect)
      : this(
          left: rect.left,
          top: rect.top,
          right: rect.right,
          bottom: rect.bottom,
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

  @override
  void evaluate(
    ft.WidgetTester tester,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) =>
      PositionEvaluator.evaluateAssert(
        this,
        tester: tester,
        trait: trait,
        rootTraits: rootTraits,
      );
}

/// Describes the size of a widget targeted by [WidgetTrait].
///
/// The dimensional information is relative to the test screen dimension.
class SizeAssert extends GeneralTraitAssert {
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

  /// Creates an instance of [SizeAssert] fom the given size.
  SizeAssert.dimension(Size size)
      : this(width: size.width, height: size.height);

  /// The width.
  final double? width;

  /// The height.
  final double? height;

  @override
  List<Object?> get props => [width, height];

  @override
  void evaluate(
    ft.WidgetTester tester,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) =>
      SizeEvaluator.evaluateAssert(
        this,
        tester: tester,
        trait: trait,
        rootTraits: rootTraits,
      );
}

/// List of possible relations for [RelationAssert].
enum PropertyRelation {
  /// Property is equal value.
  equal,

  /// Property is unequal value.
  unequal,

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
      case PropertyRelation.unequal:
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
class RelationAssert extends GeneralTraitAssert {
  /// Creates an instance of [RelationAssert].
  const RelationAssert._({
    required this.relation,
    required this.value,
    required this.action,
  });

  /// Creates an instance of [RelationAssert] for the given property relation.
  factory RelationAssert._propertyIs(
    PropertyRelation relation,
    double Function(Rect targetBounds) pGetter,
    double value,
  ) =>
      RelationAssert._(
        relation: relation,
        value: value,
        action: (targetBounds, value) =>
            relation.evaluate(pGetter(targetBounds), value),
      );

  /// Creates an instance of [RelationAssert] for the width relation.
  factory RelationAssert.widthIs(PropertyRelation relation, double value) =>
      RelationAssert._propertyIs(
        relation,
        (targetBounds) => targetBounds.width,
        value,
      );

  /// Creates an instance of [RelationAssert] for the height relation.
  factory RelationAssert.heightIs(PropertyRelation relation, double value) =>
      RelationAssert._propertyIs(
        relation,
        (targetBounds) => targetBounds.height,
        value,
      );

  /// Creates an instance of [RelationAssert] for the left relation.
  factory RelationAssert.leftIs(PropertyRelation relation, double value) =>
      RelationAssert._propertyIs(
        relation,
        (targetBounds) => targetBounds.left,
        value,
      );

  /// Creates an instance of [RelationAssert] for the top relation.
  factory RelationAssert.topIs(PropertyRelation relation, double value) =>
      RelationAssert._propertyIs(
        relation,
        (targetBounds) => targetBounds.top,
        value,
      );

  /// Creates an instance of [RelationAssert] for the right relation.
  factory RelationAssert.rightIs(PropertyRelation relation, double value) =>
      RelationAssert._propertyIs(
        relation,
        (targetBounds) => targetBounds.right,
        value,
      );

  /// Creates an instance of [RelationAssert] for the bottom relation.
  factory RelationAssert.bottomIs(PropertyRelation relation, double value) =>
      RelationAssert._propertyIs(
        relation,
        (targetBounds) => targetBounds.bottom,
        value,
      );

  /// The treated relation.
  final PropertyRelation relation;

  /// The compare value.
  final double value;

  /// The action to perform.
  final bool Function(Rect targetBounds, double value) action;

  @override
  List<Object?> get props => [relation, value, action];

  @override
  void evaluate(
    ft.WidgetTester tester,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) =>
      RelationEvaluator.evaluateAssert(
        this,
        tester: tester,
        trait: trait,
        rootTraits: rootTraits,
      );
}
