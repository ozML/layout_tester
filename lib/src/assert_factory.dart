import 'trait_assert/assert.dart';

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
