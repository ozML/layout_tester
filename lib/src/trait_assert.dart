import 'dart:ui';

import 'package:equatable/equatable.dart';

import 'widget_trait.dart';

/// Base class for assertions on [WidgetTrait].
abstract class TraitAssert {
  /// Creates an instance of [TraitAssert].
  const TraitAssert();
}

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

  /// The width.
  final double? width;

  /// The height.
  final double? height;

  @override
  List<Object?> get props => [width, height];
}

/// Describes the relative position of a widget targeted by [WidgetTrait].
///
/// Contrary to [PositionAssert] the positional information in here is relative
/// to a specific other trait instance identified by [traitId].
///
///__Note__
/// Special rules apply to the sets of fields provided here:
/// - For [left], [top], [right] and [bottom] the related trait must be an
/// ancestor in direct line of this instance. It is important that this instance
/// lies within the bounds of the related trait.
/// - For [leftDistance], [topDistance], [rightDistance] and [bottomDistance]
/// the related trait must _not_ be an ancestor of this instance. It is
/// important that this trait  doesn't intersect or lie within the bounds of
/// the related trait.
class RelativePositionAssert extends PositionAssert {
  /// Creates an instance of [RelativePositionAssert].
  const RelativePositionAssert._({
    required this.traitId,
    this.leftDistance,
    this.topDistance,
    this.rightDistance,
    this.bottomDistance,
    super.left,
    super.top,
    super.right,
    super.bottom,
  });

  /// Creates an instance of [RelativePositionAssert] which describes a position
  /// within another element.
  ///
  /// The targeted element must be an ancestor in direct line of this element.
  /// This means it must be surrounding this element.
  const RelativePositionAssert.within({
    required String traitId,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) : this._(
          traitId: traitId,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );

  /// Creates an instance of [RelativePositionAssert] which describes a position
  /// relative to another element.
  ///
  /// The targeted element must neither be an ancestor in direct line nor an
  /// descendant of this element. This means it can neither be containing this
  /// element nor be contained by this element.
  const RelativePositionAssert.relativeTo({
    required String traitId,
    double? leftDistance,
    double? topDistance,
    double? rightDistance,
    double? bottomDistance,
  }) : this._(
          traitId: traitId,
          leftDistance: leftDistance,
          topDistance: topDistance,
          rightDistance: rightDistance,
          bottomDistance: bottomDistance,
        );

  /// The target trait ID.
  final String traitId;

  /// Distance to an element on the left of this.
  final double? leftDistance;

  /// Distance to an element on the top of this.
  final double? topDistance;

  /// Distance to an element on the right of this.
  final double? rightDistance;

  /// Distance to an element on the bottom of this.
  final double? bottomDistance;

  /// Returns the values for [leftDistance], [topDistance], [rightDistance]
  /// and [bottomDistance] in a list.
  List<double?> getRelativeLTRB() => [
        leftDistance,
        topDistance,
        rightDistance,
        bottomDistance,
      ];

  @override
  List<Object?> get props => [
        traitId,
        leftDistance,
        topDistance,
        rightDistance,
        bottomDistance,
        ...super.props,
      ];
}

/// Describes the relative size of a widget targeted by [WidgetTrait].
///
/// Contrary to [SizeAssert] the dimensional information in here is relative
/// to a specific trait instance identified by [traitId].
class RelativeSizeAssert extends SizeAssert {
  /// Creates an instance of [RelativeSizeAssert].
  const RelativeSizeAssert({
    required this.traitId,
    this.percentageWidth,
    this.percentageHeight,
  });

  /// The target trait ID.
  final String traitId;

  /// The percentual width.
  ///
  /// Is represented as a decimal value where 0% equals 0 and 100% equals 1.
  final double? percentageWidth;

  /// The percentual height.
  ///
  /// Is represented as a decimal value where 0% equals 0 and 100% equals 1.
  final double? percentageHeight;

  @override
  List<Object?> get props => [
        percentageWidth,
        percentageHeight,
        ...super.props,
      ];
}

/// Customizable assert class.
///
/// This class can be used as base for custom trait assert classes.
abstract class CustomTraitAssert extends TraitAssert {
  /// Creates an instance of [CustomTraitAssert].
  const CustomTraitAssert({this.traitId});

  /// The target trait ID.
  final String? traitId;

  /// Returns whether this trait is relative to another trait.
  bool get isRelative => traitId != null;

  /// Implements the assertion logic.
  ///
  /// Must be implmented in concrete sub classes. The widget trait is passed in
  /// as [trait] and its bounds in the global scope as [bounds]. The screen
  /// size, which represents the global scope, is provided as [screenSize]. If
  /// [traitId] is defined, the optional input parameters [compareTrait] and its
  /// corresponding bounds [compareBounds] are provided.
  void test(
    WidgetTrait trait,
    Rect bounds,
    Size screenSize, [
    WidgetTrait? compareTrait,
    Rect? compareBounds,
  ]);
}
