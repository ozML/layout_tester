import 'dart:ui';

import 'trait_assert/assert.dart';

// Relation

/// Returns a [TraitAssert] which checks whether width is equal to [value].
TraitAssert widthIsEqual(double value) =>
    RelationAssert.widthIs(PropertyRelation.equal, value);

/// Returns a [TraitAssert] which checks whether width is unequal to [value].
TraitAssert widthIsUnequal(double value) =>
    RelationAssert.widthIs(PropertyRelation.unequal, value);

/// Returns a [TraitAssert] which checks whether width is greater than [value].
TraitAssert widthIsGreaterThan(double value) =>
    RelationAssert.widthIs(PropertyRelation.greaterThan, value);

/// Returns a [TraitAssert] which checks whether width is greater than or equal
/// to [value].
TraitAssert widthIsGreaterThanEqual(double value) =>
    RelationAssert.widthIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [TraitAssert] which checks whether width is less than [value].
TraitAssert widthIsLessThan(double value) =>
    RelationAssert.widthIs(PropertyRelation.lessThan, value);

/// Returns a [TraitAssert] which checks whether width is less than or equal
/// to [value].
TraitAssert widthIsLessThanEqual(double value) =>
    RelationAssert.widthIs(PropertyRelation.lessThanEqual, value);

/// Returns a [TraitAssert] which checks whether height is equal to [value].
TraitAssert heightIsEqual(double value) =>
    RelationAssert.heightIs(PropertyRelation.equal, value);

/// Returns a [TraitAssert] which checks whether height is unequal to [value].
TraitAssert heightIsUnequal(double value) =>
    RelationAssert.heightIs(PropertyRelation.unequal, value);

/// Returns a [TraitAssert] which checks whether height is greater than [value].
TraitAssert heightIsGreaterThan(double value) =>
    RelationAssert.heightIs(PropertyRelation.greaterThan, value);

/// Returns a [TraitAssert] which checks whether height is greater than or equal
/// to [value].
TraitAssert heightIsGreaterThanEqual(double value) =>
    RelationAssert.heightIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [TraitAssert] which checks whether height is less than [value].
TraitAssert heightIsLessThan(double value) =>
    RelationAssert.heightIs(PropertyRelation.lessThan, value);

/// Returns a [TraitAssert] which checks whether height is less than or equal
/// to [value].
TraitAssert heightIsLessThanEqual(double value) =>
    RelationAssert.heightIs(PropertyRelation.lessThanEqual, value);

/// Returns a [TraitAssert] which checks whether the left bound is equal
/// to [value].
TraitAssert leftIsEqual(double value) =>
    RelationAssert.leftIs(PropertyRelation.equal, value);

/// Returns a [TraitAssert] which checks whether the left bound is unequal to
/// [value].
TraitAssert leftIsUnequal(double value) =>
    RelationAssert.leftIs(PropertyRelation.unequal, value);

/// Returns a [TraitAssert] which checks whether the left bound is greater than
/// [value].
TraitAssert leftIsGreaterThan(double value) =>
    RelationAssert.leftIs(PropertyRelation.greaterThan, value);

/// Returns a [TraitAssert] which checks whether the left bound is greater than
/// or equal to [value].
TraitAssert leftIsGreaterThanEqual(double value) =>
    RelationAssert.leftIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [TraitAssert] which checks whether the left bound is less than
/// [value].
TraitAssert leftIsLessThan(double value) =>
    RelationAssert.leftIs(PropertyRelation.lessThan, value);

/// Returns a [TraitAssert] which checks whether the left bound is less than or
/// equal to [value].
TraitAssert leftIsLessThanEqual(double value) =>
    RelationAssert.leftIs(PropertyRelation.lessThanEqual, value);

/// Returns a [TraitAssert] which checks whether the top bound is equal to
/// [value].
TraitAssert topIsEqual(double value) =>
    RelationAssert.topIs(PropertyRelation.equal, value);

/// Returns a [TraitAssert] which checks whether the top bound is unequal to
/// [value].
TraitAssert topIsUnequal(double value) =>
    RelationAssert.topIs(PropertyRelation.unequal, value);

/// Returns a [TraitAssert] which checks whether the top bound is greater than
/// [value].
TraitAssert topIsGreaterThan(double value) =>
    RelationAssert.topIs(PropertyRelation.greaterThan, value);

/// Returns a [TraitAssert] which checks whether the top bound is greater than
/// or equal to [value].
TraitAssert topIsGreaterThanEqual(double value) =>
    RelationAssert.topIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [TraitAssert] which checks whether the top bound is less than
/// [value].
TraitAssert topIsLessThan(double value) =>
    RelationAssert.topIs(PropertyRelation.lessThan, value);

/// Returns a [TraitAssert] which checks whether the top bound is less than or
/// equal to [value].
TraitAssert topIsLessThanEqual(double value) =>
    RelationAssert.topIs(PropertyRelation.lessThanEqual, value);

/// Returns a [TraitAssert] which checks whether the right bound is equal to
/// [value].
TraitAssert rightIsEqual(double value) =>
    RelationAssert.rightIs(PropertyRelation.equal, value);

/// Returns a [TraitAssert] which checks whether the right bound is unequal to
/// [value].
TraitAssert rightIsUnequal(double value) =>
    RelationAssert.rightIs(PropertyRelation.unequal, value);

/// Returns a [TraitAssert] which checks whether the right bound is greater than
/// [value].
TraitAssert rightIsGreaterThan(double value) =>
    RelationAssert.rightIs(PropertyRelation.greaterThan, value);

/// Returns a [TraitAssert] which checks whether the right bound is greater than
/// or equal to [value].
TraitAssert rightIsGreaterThanEqual(double value) =>
    RelationAssert.rightIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [TraitAssert] which checks whether the right bound is less than
/// [value].
TraitAssert rightIsLessThan(double value) =>
    RelationAssert.rightIs(PropertyRelation.lessThan, value);

/// Returns a [TraitAssert] which checks whether the right bound is less than or
/// equal to [value].
TraitAssert rightIsLessThanEqual(double value) =>
    RelationAssert.rightIs(PropertyRelation.lessThanEqual, value);

/// Returns a [TraitAssert] which checks whether the bottom bound is equal to
/// [value].
TraitAssert bottomIsEqual(double value) =>
    RelationAssert.bottomIs(PropertyRelation.equal, value);

/// Returns a [TraitAssert] which checks whether the bottom bound is unequal to
/// [value].
TraitAssert bottomIsUnequal(double value) =>
    RelationAssert.bottomIs(PropertyRelation.unequal, value);

/// Returns a [TraitAssert] which checks whether the bottom bound is greater
/// than [value].
TraitAssert bottomIsGreaterThan(double value) =>
    RelationAssert.bottomIs(PropertyRelation.greaterThan, value);

/// Returns a [TraitAssert] which checks whether the bottom bound is greater
/// than or equal [value].
TraitAssert bottomIsGreaterThanEqual(double value) =>
    RelationAssert.bottomIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [TraitAssert] which checks whether the bottom bound is less than
/// [value].
TraitAssert bottomIsLessThan(double value) =>
    RelationAssert.bottomIs(PropertyRelation.lessThan, value);

/// Returns a [TraitAssert] which checks whether the bottom bound is less than
/// or equal to [value].
TraitAssert bottomIsLessThanEqual(double value) =>
    RelationAssert.bottomIs(PropertyRelation.lessThanEqual, value);

// Position

/// Returns a [TraitAssert] which checks the left bound.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasLeft(double left, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parent(traitId: parentTraitId, left: left)
        : PositionAssert(left: left);

/// Returns a [TraitAssert] which checks the top bound.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasTop(double top, {String? parentTraitId}) => parentTraitId != null
    ? RelativePositionAssert.parent(traitId: parentTraitId, top: top)
    : PositionAssert(top: top);

/// Returns a [TraitAssert] which checks the right bound.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasRight(double right, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parent(traitId: parentTraitId, right: right)
        : PositionAssert(right: right);

/// Returns a [TraitAssert] which checks the bottom bound.
///
/// Specify [parentTrait] to use the parents local coordinate system..
TraitAssert hasBottom(double bottom, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parent(traitId: parentTraitId, bottom: bottom)
        : PositionAssert(bottom: bottom);

/// Returns a [TraitAssert] which checks the bound locations.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasPosition(
  double left,
  double top,
  double right,
  double bottom, {
  String? parentTraitId,
}) =>
    parentTraitId != null
        ? RelativePositionAssert.parent(
            traitId: parentTraitId,
            left: left,
            top: top,
            right: right,
            bottom: bottom,
          )
        : PositionAssert.LTRB(left, top, right, bottom);

/// Returns a [TraitAssert] which checks the location.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasLocation(double x, double y, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parent(
            traitId: parentTraitId,
            left: x,
            top: y,
          )
        : PositionAssert.location(x, y);

/// Returns a [TraitAssert] which checks the offset.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasOffset(Offset offset, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parent(
            traitId: parentTraitId,
            left: offset.dx,
            top: offset.dy,
          )
        : PositionAssert.offset(offset);

/// Returns a [PositionAssert which checks the given bounds.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasBounds(Rect rect, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parent(
            traitId: parentTraitId,
            left: rect.left,
            top: rect.top,
            right: rect.right,
            bottom: rect.bottom,
          )
        : PositionAssert.bounds(rect);

// Size

/// Returns a [TraitAssert] which checks the size.
///
/// Specify [compareTraitId] to check the ratio of the values instead.
TraitAssert hasSize(double width, double height, {String? compareTraitId}) =>
    compareTraitId != null
        ? RelativeSizeAssert(
            traitId: compareTraitId,
            width: width,
            height: height,
          )
        : SizeAssert(width: width, height: height);

/// Returns a [TraitAssert] which checks the dimension.
TraitAssert hasDimension(Size size) => SizeAssert.dimension(size);

/// Returns a [TraitAssert] which checks given width.
///
/// Specify [compareTraitId] to check the ratio instead.
TraitAssert hasWidth(double width, {String? compareTraitId}) =>
    compareTraitId != null
        ? RelativeSizeAssert(traitId: compareTraitId, width: width)
        : SizeAssert(width: width);

/// Returns a [TraitAssert] which checks the height.
///
/// Specify [compareTraitId] to check the ratio instead.
TraitAssert hasHeight(double height, {String? compareTraitId}) =>
    compareTraitId != null
        ? RelativeSizeAssert(traitId: compareTraitId, height: height)
        : SizeAssert(height: height);

// Relative Position

/// Returns a [TraitAssert] with the distance to a left target.
TraitAssert hasLeftDistanceTo(double left, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, left: left);

/// Returns a [TraitAssert] with the distance to a top target.
TraitAssert hasTopDistanceTo(double top, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, top: top);

/// Returns a [TraitAssert] with the distance to a right target.
TraitAssert hasRightDistanceTo(double right, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, right: right);

/// Returns a [TraitAssert] with the distance to a bottom target.
TraitAssert hasBottomDistanceTo(double bottom, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, bottom: bottom);

/// Returns a [TraitAssert] with the given left value within the parents bounds.
@Deprecated('Use `hasLeft` instead.')
TraitAssert hasLocalLeft(double left, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, left: left);

/// Returns a [TraitAssert] with the given top value within the parents bounds.
@Deprecated('Use `hasTop` instead.')
TraitAssert hasLocalTop(double top, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, top: top);

/// Returns a [TraitAssert] with the given right value within the parents
/// bounds.
@Deprecated('Use `hasRight` instead.')
TraitAssert hasLocalRight(double right, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, right: right);

/// Returns a [TraitAssert] with the given bottom value within the parents
/// bounds.
@Deprecated('Use `hasBottom` instead.')
TraitAssert hasLocalBottom(double bottom, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, bottom: bottom);

/// Returns a [TraitAssert] with the given position infos within the parents
/// bounds.
@Deprecated('Use `hasPosition` instead.')
TraitAssert hasLocalPosition(
  double left,
  double top,
  double right,
  double bottom,
  String parentTraitId,
) =>
    RelativePositionAssert.parent(
      traitId: parentTraitId,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );

/// Returns a [TraitAssert] with the given location within the parents bounds.
@Deprecated('Use `hasLocation` instead.')
TraitAssert hasLocalLocation(
  double x,
  double y,
  String parentTraitId,
) =>
    RelativePositionAssert.parent(traitId: parentTraitId, left: x, top: y);

/// Returns a [TraitAssert] with the given offset within the parents bounds.
@Deprecated('Use `hasOffset` instead.')
TraitAssert hasLocalOffset(Offset offset, String parentTraitId) =>
    RelativePositionAssert.parent(
      traitId: parentTraitId,
      left: offset.dx,
      top: offset.dy,
    );

/// Returns a [RelativePositionAssert with the given bounds within the parents
/// bounds.
@Deprecated('Use `hasBounds` instead.')
TraitAssert hasLocalBounds(Rect rect, String parentTraitId) =>
    RelativePositionAssert.parent(
      traitId: parentTraitId,
      left: rect.left,
      top: rect.top,
      right: rect.right,
      bottom: rect.bottom,
    );

/// Returns a [TraitAssert] with the distance to the parents left bound.
@Deprecated('Use `hasLeftDistance` instead.')
TraitAssert hasLocalLeftDistance(
  double left,
  String parentTraitId,
) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, left: left);

/// Returns a [TraitAssert] with the distance to the parents top bound.
@Deprecated('Use `hasTopDistance` instead.')
TraitAssert hasLocalTopDistance(double top, String parentTraitId) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, top: top);

/// Returns a [TraitAssert] with the distance to the parents right bound.
@Deprecated('Use `hasRightDistance` instead.')
TraitAssert hasLocalRightDistance(
  double right,
  String parentTraitId,
) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, right: right);

/// Returns a [TraitAssert] with the distance to the parents bottom bound.
@Deprecated('Use `hasBottomDistance` instead.')
TraitAssert hasLocalBottomDistance(
  double bottom,
  String parentTraitId,
) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, bottom: bottom);

/// Returns a [TraitAssert] with the distance to the global left bound.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasLeftDistance(double left, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parentBounds(
            traitId: parentTraitId,
            left: left,
          )
        : RelativePositionAssert.globalBounds(left: left);

/// Returns a [TraitAssert] with the distance to the global top bound.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasTopDistance(double top, {String? parentTraitId}) =>
    parentTraitId != null
        ? RelativePositionAssert.parentBounds(traitId: parentTraitId, top: top)
        : RelativePositionAssert.globalBounds(top: top);

/// Returns a [TraitAssert] with the distance to the global right bound.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasRightDistance(
  double right, {
  String? parentTraitId,
}) =>
    parentTraitId != null
        ? RelativePositionAssert.parentBounds(
            traitId: parentTraitId,
            right: right,
          )
        : RelativePositionAssert.globalBounds(right: right);

/// Returns a [TraitAssert] with the distance to the global bottom bound.
///
/// Specify [parentTrait] to use the parents local coordinate system.
TraitAssert hasBottomDistance(
  double bottom, {
  String? parentTraitId,
}) =>
    parentTraitId != null
        ? RelativePositionAssert.parentBounds(
            traitId: parentTraitId,
            bottom: bottom,
          )
        : RelativePositionAssert.globalBounds(bottom: bottom);

// Relative Size

/// Returns a [TraitAssert] with the given relative size info.
@Deprecated('Use `hasSize` instead.')
TraitAssert hasRelativeSizeOf(
  double width,
  double height,
  String traitId,
) =>
    RelativeSizeAssert(traitId: traitId, width: width, height: height);

/// Returns a [TraitAssert] with the given relative width.
@Deprecated('Use `hasWidth` instead.')
TraitAssert hasRelativeWidthOf(double width, String traitId) =>
    RelativeSizeAssert(traitId: traitId, width: width);

/// Returns a [TraitAssert] with the given relative height.
@Deprecated('Use `hasHeight` instead.')
TraitAssert hasRelativeHeightOf(double height, String traitId) =>
    RelativeSizeAssert(traitId: traitId, height: height);
