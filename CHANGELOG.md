## 0.1.0
* __Breaking__: Renamed `FailedAssertionInfo` field `fieldName` to `subject`
* __Breaking__: Removed `target` parameter from assert specific test methods in `LayoutTester`
* Added `RelationAssert` class for widget property comparison with value
* Added `testRelation` method to `LayoutTester`
* Added `RelativeTraitAssert` base class
* __Breaking__: Changed base class of `RelativePositionAssert`/`RelativeSizeAssert` from `TraitAssert` to `RelativeTraitAssert`
* __Breaking__: Removed `RelativePositionAssert` fields `leftDistance`, `topDistance`, `rightDistance` and `bottomDistance`
* Added `refersTo` field to `RelativePositionAssert` to describe different modes
* __Breaking__: Renamed `RelativeSizeAssert` fields `percentageWidht`/`percentageHeight` to `width`/`height`
* Provided short hand generators for `TraitAssert` classes via _assertion_factory_ lib
* Added multiple constructors for existing assertion classes

## 0.0.1+1

* Fixed bug in trait resolution

## 0.0.1

* Implemented base functionality
