import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/layout_tester.dart';

void main() {
  group('assert_factory.dart -', () {
    const compareValue = 50.0;

    // Width

    test('widthIsEqual', () {
      final assertion = widthIsEqual(compareValue);

      expect(assertion.relation, PropertyRelation.equal);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(10)), false);
    });

    test('widthIsUnEqual', () {
      final assertion = widthIsUnEqual(compareValue);

      expect(assertion.relation, PropertyRelation.unEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(10)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), false);
    });

    test('widthIsGreaterThan', () {
      final assertion = widthIsGreaterThan(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(100)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), false);
    });

    test('widthIsGreaterThanEqual', () {
      final assertion = widthIsGreaterThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(40)), false);
    });

    test('widthIsLessThan', () {
      final assertion = widthIsLessThan(compareValue);

      expect(assertion.relation, PropertyRelation.lessThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(40)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), false);
    });

    test('widthIsLessThanEqual', () {
      final assertion = widthIsLessThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.lessThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(60)), false);
    });

    // Height

    test('heightIsEqual', () {
      final assertion = heightIsEqual(compareValue);

      expect(assertion.relation, PropertyRelation.equal);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(10)), false);
    });

    test('heightIsUnEqual', () {
      final assertion = heightIsUnEqual(compareValue);

      expect(assertion.relation, PropertyRelation.unEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(10)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), false);
    });

    test('heightIsGreaterThan', () {
      final assertion = heightIsGreaterThan(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(100)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), false);
    });

    test('heightIsGreaterThanEqual', () {
      final assertion = heightIsGreaterThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(40)), false);
    });

    test('heightIsLessThan', () {
      final assertion = heightIsLessThan(compareValue);

      expect(assertion.relation, PropertyRelation.lessThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(40)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), false);
    });

    test('heightIsLessThanEqual', () {
      final assertion = heightIsLessThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.lessThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(Offset.zero & const Size.square(50)), true);
      expect(assertion.evaluate(Offset.zero & const Size.square(60)), false);
    });

    // Left

    test('leftIsEqual', () {
      final assertion = leftIsEqual(compareValue);

      expect(assertion.relation, PropertyRelation.equal);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), false);
    });

    test('leftIsUnEqual', () {
      final assertion = leftIsUnEqual(compareValue);

      expect(assertion.relation, PropertyRelation.unEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), false);
    });

    test('leftIsGreaterThan', () {
      final assertion = leftIsGreaterThan(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), false);
    });

    test('leftIsGreaterThanEqual', () {
      final assertion = leftIsGreaterThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(40, 40, 10, 10)), false);
    });

    test('leftIsLessThan', () {
      final assertion = leftIsLessThan(compareValue);

      expect(assertion.relation, PropertyRelation.lessThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(40, 40, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), false);
    });

    test('leftIsLessThanEqual', () {
      final assertion = leftIsLessThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.lessThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), false);
    });

    // Top

    test('topIsEqual', () {
      final assertion = topIsEqual(compareValue);

      expect(assertion.relation, PropertyRelation.equal);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), false);
    });

    test('topIsUnEqual', () {
      final assertion = topIsUnEqual(compareValue);

      expect(assertion.relation, PropertyRelation.unEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), false);
    });

    test('topIsGreaterThan', () {
      final assertion = topIsGreaterThan(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), false);
    });

    test('topIsGreaterThanEqual', () {
      final assertion = topIsGreaterThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(40, 40, 10, 10)), false);
    });

    test('topIsLessThan', () {
      final assertion = topIsLessThan(compareValue);

      expect(assertion.relation, PropertyRelation.lessThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(40, 40, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), false);
    });

    test('topIsLessThanEqual', () {
      final assertion = topIsLessThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.lessThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(50, 50, 10, 10)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(60, 60, 10, 10)), false);
    });

    // Right

    test('rightIsEqual', () {
      final assertion = rightIsEqual(compareValue);

      expect(assertion.relation, PropertyRelation.equal);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), false);
    });

    test('rightIsUnEqual', () {
      final assertion = rightIsUnEqual(compareValue);

      expect(assertion.relation, PropertyRelation.unEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), false);
    });

    test('rightIsGreaterThan', () {
      final assertion = rightIsGreaterThan(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), false);
    });

    test('rightIsGreaterThanEqual', () {
      final assertion = rightIsGreaterThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 40, 40)), false);
    });

    test('rightIsLessThan', () {
      final assertion = rightIsLessThan(compareValue);

      expect(assertion.relation, PropertyRelation.lessThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 40, 40)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), false);
    });

    test('rightIsLessThanEqual', () {
      final assertion = rightIsLessThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.lessThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), false);
    });

    // Bottom

    test('bottomIsEqual', () {
      final assertion = bottomIsEqual(compareValue);

      expect(assertion.relation, PropertyRelation.equal);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), false);
    });

    test('bottomIsUnEqual', () {
      final assertion = bottomIsUnEqual(compareValue);

      expect(assertion.relation, PropertyRelation.unEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), false);
    });

    test('bottomIsGreaterThan', () {
      final assertion = bottomIsGreaterThan(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), false);
    });

    test('bottomIsGreaterThanEqual', () {
      final assertion = bottomIsGreaterThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.greaterThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 40, 40)), false);
    });

    test('bottomIsLessThan', () {
      final assertion = bottomIsLessThan(compareValue);

      expect(assertion.relation, PropertyRelation.lessThan);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 40, 40)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), false);
    });

    test('bottomIsLessThanEqual', () {
      final assertion = bottomIsLessThanEqual(compareValue);

      expect(assertion.relation, PropertyRelation.lessThanEqual);
      expect(assertion.value, compareValue);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 50, 50)), true);
      expect(assertion.evaluate(const Rect.fromLTWH(0, 0, 60, 60)), false);
    });
  });
}
