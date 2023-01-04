import 'dart:ui';

import 'trait_assert/assert.dart';

// Relation

RelationAssert _widthIs(PropertyRelation relation, double value) =>
    RelationAssert(
      relation: relation,
      value: value,
      action: (targetBounds, value) =>
          relation.evaluate(targetBounds.width, value),
    );

RelationAssert _heightIs(PropertyRelation relation, double value) =>
    RelationAssert(
      relation: relation,
      value: value,
      action: (targetBounds, value) =>
          relation.evaluate(targetBounds.height, value),
    );

RelationAssert _leftIs(PropertyRelation relation, double value) =>
    RelationAssert(
      relation: relation,
      value: value,
      action: (targetBounds, value) =>
          relation.evaluate(targetBounds.left, value),
    );

RelationAssert _topIs(PropertyRelation relation, double value) =>
    RelationAssert(
      relation: relation,
      value: value,
      action: (targetBounds, value) =>
          relation.evaluate(targetBounds.top, value),
    );

RelationAssert _rightIs(PropertyRelation relation, double value) =>
    RelationAssert(
      relation: relation,
      value: value,
      action: (targetBounds, value) =>
          relation.evaluate(targetBounds.right, value),
    );

RelationAssert _bottomIs(PropertyRelation relation, double value) =>
    RelationAssert(
      relation: relation,
      value: value,
      action: (targetBounds, value) =>
          relation.evaluate(targetBounds.bottom, value),
    );

/// Returns a [RelationAssert] which checks whether width is equal [value].
RelationAssert widthIsEqual(double value) =>
    _widthIs(PropertyRelation.equal, value);

/// Returns a [RelationAssert] which checks whether width is unequal [value].
RelationAssert widthIsUnEqual(double value) =>
    _widthIs(PropertyRelation.unEqual, value);

/// Returns a [RelationAssert] which checks whether width is greater than
/// [value].
RelationAssert widthIsGreaterThan(double value) =>
    _widthIs(PropertyRelation.greaterThan, value);

/// Returns a [RelationAssert] which checks whether width is greater than
/// or equal [value].
RelationAssert widthIsGreaterThanEqual(double value) =>
    _widthIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [RelationAssert] which checks whether width is less than
/// [value].
RelationAssert widthIsLessThan(double value) =>
    _widthIs(PropertyRelation.lessThan, value);

/// Returns a [RelationAssert] which checks whether width is less than
/// or equal [value].
RelationAssert widthIsLessThanEqual(double value) =>
    _widthIs(PropertyRelation.lessThanEqual, value);

/// Returns a [RelationAssert] which checks whether height is equal [value].
RelationAssert heightIsEqual(double value) =>
    _heightIs(PropertyRelation.equal, value);

/// Returns a [RelationAssert] which checks whether height is unequal [value].
RelationAssert heightIsUnEqual(double value) =>
    _heightIs(PropertyRelation.unEqual, value);

/// Returns a [RelationAssert] which checks whether height is greater than
/// [value].
RelationAssert heightIsGreaterThan(double value) =>
    _heightIs(PropertyRelation.greaterThan, value);

/// Returns a [RelationAssert] which checks whether height is greater than
/// or equal [value].
RelationAssert heightIsGreaterThanEqual(double value) =>
    _heightIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [RelationAssert] which checks whether height is less than
/// [value].
RelationAssert heightIsLessThan(double value) =>
    _heightIs(PropertyRelation.lessThan, value);

/// Returns a [RelationAssert] which checks whether height is less than
/// or equal [value].
RelationAssert heightIsLessThanEqual(double value) =>
    _heightIs(PropertyRelation.lessThanEqual, value);

/// Returns a [RelationAssert] which checks whether left is equal [value].
RelationAssert leftIsEqual(double value) =>
    _leftIs(PropertyRelation.equal, value);

/// Returns a [RelationAssert] which checks whether left is unequal [value].
RelationAssert leftIsUnEqual(double value) =>
    _leftIs(PropertyRelation.unEqual, value);

/// Returns a [RelationAssert] which checks whether left is greater than
/// [value].
RelationAssert leftIsGreaterThan(double value) =>
    _leftIs(PropertyRelation.greaterThan, value);

/// Returns a [RelationAssert] which checks whether left is greater than
/// or equal [value].
RelationAssert leftIsGreaterThanEqual(double value) =>
    _leftIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [RelationAssert] which checks whether left is less than
/// [value].
RelationAssert leftIsLessThan(double value) =>
    _leftIs(PropertyRelation.lessThan, value);

/// Returns a [RelationAssert] which checks whether left is less than
/// or equal [value].
RelationAssert leftIsLessThanEqual(double value) =>
    _leftIs(PropertyRelation.lessThanEqual, value);

/// Returns a [RelationAssert] which checks whether top is equal [value].
RelationAssert topIsEqual(double value) =>
    _topIs(PropertyRelation.equal, value);

/// Returns a [RelationAssert] which checks whether top is unequal [value].
RelationAssert topIsUnEqual(double value) =>
    _topIs(PropertyRelation.unEqual, value);

/// Returns a [RelationAssert] which checks whether top is greater than
/// [value].
RelationAssert topIsGreaterThan(double value) =>
    _topIs(PropertyRelation.greaterThan, value);

/// Returns a [RelationAssert] which checks whether top is greater than
/// or equal [value].
RelationAssert topIsGreaterThanEqual(double value) =>
    _topIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [RelationAssert] which checks whether top is less than
/// [value].
RelationAssert topIsLessThan(double value) =>
    _topIs(PropertyRelation.lessThan, value);

/// Returns a [RelationAssert] which checks whether top is less than
/// or equal [value].
RelationAssert topIsLessThanEqual(double value) =>
    _topIs(PropertyRelation.lessThanEqual, value);

/// Returns a [RelationAssert] which checks whether right is equal [value].
RelationAssert rightIsEqual(double value) =>
    _rightIs(PropertyRelation.equal, value);

/// Returns a [RelationAssert] which checks whether right is unequal [value].
RelationAssert rightIsUnEqual(double value) =>
    _rightIs(PropertyRelation.unEqual, value);

/// Returns a [RelationAssert] which checks whether right is greater than
/// [value].
RelationAssert rightIsGreaterThan(double value) =>
    _rightIs(PropertyRelation.greaterThan, value);

/// Returns a [RelationAssert] which checks whether right is greater than
/// or equal [value].
RelationAssert rightIsGreaterThanEqual(double value) =>
    _rightIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [RelationAssert] which checks whether right is less than
/// [value].
RelationAssert rightIsLessThan(double value) =>
    _rightIs(PropertyRelation.lessThan, value);

/// Returns a [RelationAssert] which checks whether right is less than
/// or equal [value].
RelationAssert rightIsLessThanEqual(double value) =>
    _rightIs(PropertyRelation.lessThanEqual, value);

/// Returns a [RelationAssert] which checks whether bottom is equal [value].
RelationAssert bottomIsEqual(double value) =>
    _bottomIs(PropertyRelation.equal, value);

/// Returns a [RelationAssert] which checks whether bottom is unequal [value].
RelationAssert bottomIsUnEqual(double value) =>
    _bottomIs(PropertyRelation.unEqual, value);

/// Returns a [RelationAssert] which checks whether bottom is greater than
/// [value].
RelationAssert bottomIsGreaterThan(double value) =>
    _bottomIs(PropertyRelation.greaterThan, value);

/// Returns a [RelationAssert] which checks whether bottom is greater than
/// or equal [value].
RelationAssert bottomIsGreaterThanEqual(double value) =>
    _bottomIs(PropertyRelation.greaterThanEqual, value);

/// Returns a [RelationAssert] which checks whether bottom is less than
/// [value].
RelationAssert bottomIsLessThan(double value) =>
    _bottomIs(PropertyRelation.lessThan, value);

/// Returns a [RelationAssert] which checks whether bottom is less than
/// or equal [value].
RelationAssert bottomIsLessThanEqual(double value) =>
    _bottomIs(PropertyRelation.lessThanEqual, value);

// Position

/// Returns a [PositionAssert] with the given left value.
PositionAssert hasLeft(double left) => PositionAssert(left: left);

/// Returns a [PositionAssert] with the given top value.
PositionAssert hasTop(double top) => PositionAssert(top: top);

/// Returns a [PositionAssert] with the given right value.
PositionAssert hasRight(double right) => PositionAssert(right: right);

/// Returns a [PositionAssert] with the given bottom value.
PositionAssert hasBottom(double bottom) => PositionAssert(bottom: bottom);

/// Returns a [PositionAssert] with the given position infos.
PositionAssert hasPosition(
  double left,
  double top,
  double right,
  double bottom,
) =>
    PositionAssert.LTRB(left, top, right, bottom);

/// Returns a [PositionAssert] with the given location.
PositionAssert hasLocation(double x, double y) => PositionAssert.location(x, y);

/// Returns a [PositionAssert] with the given offset.
PositionAssert hasOffset(Offset offset) => PositionAssert.offset(offset);

/// Returns a [PositionAssert with the given bounds.
PositionAssert hasBounds(Rect rect) => PositionAssert.bounds(rect);

// Size

/// Returns a [SizeAssert] with the given size infos.
SizeAssert hasSize(double width, double height) =>
    SizeAssert(width: width, height: height);

/// Returns a [SizeAssert] with the given dimension.
SizeAssert hasDimension(Size size) => SizeAssert.dimension(size);

/// Returns a [SizeAssert] with the given width.
SizeAssert hasWidth(double width) => SizeAssert(width: width);

/// Returns a [SizeAssert] with the given height.
SizeAssert hasHeight(double height) => SizeAssert(height: height);

// Relative Position

/// Returns a [RelativePositionAssert] with the distance to a left target.
RelativePositionAssert hasLeftDistanceTo(double left, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, left: left);

/// Returns a [RelativePositionAssert] with the distance to a top target.
RelativePositionAssert hasTopDistanceTo(double top, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, top: top);

/// Returns a [RelativePositionAssert] with the distance to a right target.
RelativePositionAssert hasRightDistanceTo(double right, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, right: right);

/// Returns a [RelativePositionAssert] with the distance to a bottom target.
RelativePositionAssert hasBottomDistanceTo(double bottom, String traitId) =>
    RelativePositionAssert.target(traitId: traitId, bottom: bottom);

/// Returns a [RelativePositionAssert] with the given left value within the
/// parents bounds.
RelativePositionAssert hasLocalLeft(double left, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, left: left);

/// Returns a [RelativePositionAssert] with the given top value within the
/// parents bounds.
RelativePositionAssert hasLocalTop(double top, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, top: top);

/// Returns a [RelativePositionAssert] with the given right value within the
/// parents bounds.
RelativePositionAssert hasLocalRight(double right, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, right: right);

/// Returns a [RelativePositionAssert] with the given bottom value within the
/// parents bounds.
RelativePositionAssert hasLocalBottom(double bottom, String parentTraitId) =>
    RelativePositionAssert.parent(traitId: parentTraitId, bottom: bottom);

/// Returns a [RelativePositionAssert] with the given position infos within the
/// parents bounds.
RelativePositionAssert hasLocalPosition(
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

/// Returns a [RelativePositionAssert] with the given location within the
/// parents bounds.
RelativePositionAssert hasLocalLocation(
  double x,
  double y,
  String parentTraitId,
) =>
    RelativePositionAssert.parent(traitId: parentTraitId, left: x, top: y);

/// Returns a [RelativePositionAssert] with the given offset within the
/// parents bounds.
RelativePositionAssert hasLocalOffset(Offset offset, String parentTraitId) =>
    RelativePositionAssert.parent(
      traitId: parentTraitId,
      left: offset.dx,
      top: offset.dy,
    );

/// Returns a [RelativePositionAssert with the given bounds within the
/// parents bounds.
RelativePositionAssert hasLocalBounds(Rect rect, String parentTraitId) =>
    RelativePositionAssert.parent(
      traitId: parentTraitId,
      left: rect.left,
      top: rect.top,
      right: rect.right,
      bottom: rect.bottom,
    );

/// Returns a [RelativePositionAssert] with the distance to the parents left
/// bound.
RelativePositionAssert hasLocalLeftDistance(
  double left,
  String parentTraitId,
) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, left: left);

/// Returns a [RelativePositionAssert] with the distance to the parents top
/// bound.
RelativePositionAssert hasLocalTopDistance(double top, String parentTraitId) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, top: top);

/// Returns a [RelativePositionAssert] with the distance to the parents right
/// bound.
RelativePositionAssert hasLocalRightDistance(
  double right,
  String parentTraitId,
) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, right: right);

/// Returns a [RelativePositionAssert] with the distance to the parents bottom
/// bound.
RelativePositionAssert hasLocalBottomDistance(
  double bottom,
  String parentTraitId,
) =>
    RelativePositionAssert.parentBounds(traitId: parentTraitId, bottom: bottom);

/// Returns a [RelativePositionAssert] with the distance to the global left
/// bound.
RelativePositionAssert hasLeftDistance(double left) =>
    RelativePositionAssert.globalBounds(left: left);

/// Returns a [RelativePositionAssert] with the distance to the global top
/// bound.
RelativePositionAssert hasTopDistance(double top) =>
    RelativePositionAssert.globalBounds(top: top);

/// Returns a [RelativePositionAssert] with the distance to the global right
/// bound.
RelativePositionAssert hasRightDistance(double right) =>
    RelativePositionAssert.globalBounds(right: right);

/// Returns a [RelativePositionAssert] with the distance to the global bottom
/// bound.
RelativePositionAssert hasBottomDistance(double bottom) =>
    RelativePositionAssert.globalBounds(bottom: bottom);

// Relative Size

/// Returns a [RelativeSizeAssert] with the given relative size info.
RelativeSizeAssert hasRelativeSizeOf(
  double width,
  double height,
  String traitId,
) =>
    RelativeSizeAssert(traitId: traitId, width: width, height: height);

/// Returns a [RelativeSizeAssert] with the given relative width.
RelativeSizeAssert hasRelativeWidthOf(double width, String traitId) =>
    RelativeSizeAssert(traitId: traitId, width: width);

/// Returns a [RelativeSizeAssert] with the given relative height.
RelativeSizeAssert hasRelativeHeightOf(double height, String traitId) =>
    RelativeSizeAssert(traitId: traitId, height: height);
