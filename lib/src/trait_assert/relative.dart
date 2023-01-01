import 'package:equatable/equatable.dart';
import 'package:layout_tester/src/widget_trait.dart';

import 'base.dart';
import 'global.dart';

/// Defines possible references for [RelativePositionAssert].
enum PositionReference {
  /// Refers to a specified target trait.
  ///
  /// The target bounds must not intersect with the own. The positional fields
  ///  signify the distance to the respective facing bound of the target.
  target,

  /// Refers to a specified parent trait.
  ///
  /// The own bounds must lie within the parents. The positional fields signify
  /// the location in the coordinate system of the parent.
  parent,

  /// Refers to a specified parent traits bounds.
  ///
  /// The own bounds must lie within the parents. The positional fields signify
  /// the distance to the respective facing bound of the parent.
  parentBounds,

  /// Refers to the global bounds.
  ///
  /// The positional fields signify the distance to the respective facing bound
  /// of the global scope.
  globalBounds,
}

/// Describes the relative position of a widget targeted by [WidgetTrait].
///
/// Contrary to [PositionAssert] the positional information in here is relative
/// to a specific subject defined with [refersTo]. Depending on the value of the
/// field, the positional fields [left], [top], [right] and [bottom] are
/// interpreted differently. Corresponding constructors are available for the
/// different possibilities.
///
///- See [PositionReference].
class RelativePositionAssert extends RelativeTraitAssert with EquatableMixin {
  /// Creates an instance of [RelativePositionAssert].
  const RelativePositionAssert._({
    required this.refersTo,
    required super.traitId,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  /// Creates an instance of [RelativePositionAssert] which refers to the
  /// specified target trait [traitId].
  ///
  /// The values for [left], [top], [right] and [bottom] describe the distance
  /// of the corresponding bounds to the facing bounds of the target trait.
  ///
  /// Therefore the following applies:
  /// - [left] = Distance from left bound to right of target trait.
  /// - [top] = Distance from top bound to bottom of target trait.
  /// - [right] = Distance from right bound to left of target trait.
  /// - [bottom] = Distance from bottom bound to top of target trait.
  const RelativePositionAssert.target({
    required String traitId,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) : this._(
          traitId: traitId,
          refersTo: PositionReference.target,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );

  /// Creates an instance of [RelativePositionAssert] which refers to the
  /// location within the specified parent trait.
  ///
  /// The location is described in local coordinates within the bounds of the
  /// parent trait.
  const RelativePositionAssert.parent({
    required String traitId,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) : this._(
          traitId: traitId,
          refersTo: PositionReference.parent,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );

  /// Creates an instance of [RelativePositionAssert] which refers to the
  /// distance to the bounds of the parent trait.
  ///
  /// The values for [left], [top], [right] and [bottom] describe the distance
  /// of the corresponding bound to the facing bound of the parent. Therefore
  /// [left] relates to the left bound, [top] to the top bound, [right] to the
  /// right bound and [bottom] to the bottom bound.
  const RelativePositionAssert.parentBounds({
    required String traitId,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) : this._(
          traitId: traitId,
          refersTo: PositionReference.parentBounds,
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        );

  /// Creates an instance of [RelativePositionAssert] which refers to the
  /// distance to the bounds of the global scope.
  ///
  /// The values for [left], [top], [right] and [bottom] describe the distance
  /// of the corresponding bound to the facing global bound. Therefore [left]
  /// relates to the left bound, [top] to the top bound, [right] to the right
  /// bound and [bottom] to the bottom bound.
  ///
  /// The [traitId] is empty in this case.
  const RelativePositionAssert.globalBounds({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) : this._(
          traitId: '',
          refersTo: PositionReference.globalBounds,
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
  @Deprecated('Use `target` instead.')
  const factory RelativePositionAssert.relativeTo({
    required String traitId,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) = RelativePositionAssert.target;

  /// Creates an instance of [RelativePositionAssert] which describes a position
  /// within another element.
  ///
  /// The targeted element must be an ancestor in direct line of this element.
  /// This means it must be surrounding this element.
  @Deprecated('Use `parent` instead.')
  const factory RelativePositionAssert.within({
    required String traitId,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) = RelativePositionAssert.parent;

  /// Determines the reference of the position infos.
  final PositionReference refersTo;

  /// Offset to the left border of the scope.
  final double? left;

  /// Offset to the top border of the scope.
  final double? top;

  /// Offset to the right border of the scope.
  final double? right;

  /// Offset to the bottom border of the scope.
  final double? bottom;

  /// Returns the values for [left], [top], [right]
  /// and [bottom] in a list.
  List<double?> getLTRB() => [left, top, right, bottom];

  @override
  List<Object?> get props => [traitId, ...getLTRB()];
}

/// Describes the relative size of a widget targeted by [WidgetTrait].
///
/// Contrary to [SizeAssert] the dimensional information in here is relative
/// to a specific trait instance identified by [traitId].
class RelativeSizeAssert extends RelativeTraitAssert with EquatableMixin {
  /// Creates an instance of [RelativeSizeAssert].
  const RelativeSizeAssert({
    required super.traitId,
    this.width,
    this.height,
  });

  /// Creates an instance of [RelativeSizeAssert] with all values set to
  /// [value].
  const RelativeSizeAssert.symmetric(double value, {required String traitId})
      : this(traitId: traitId, width: value, height: value);

  /// The percentual width.
  ///
  /// Is represented as a decimal value where 0% equals 0 and 100% equals 1.
  final double? width;

  /// The percentual height.
  ///
  /// Is represented as a decimal value where 0% equals 0 and 100% equals 1.
  final double? height;

  @override
  List<Object?> get props => [traitId, width, height];
}
