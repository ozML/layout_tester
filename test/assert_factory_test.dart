import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/layout_tester.dart';

void main() {
  group('assert_factory.dart -', () {
    group('Relation -', () {
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

    group('Position -', () {
      const input = 50.0;

      void checkPosition(
        PositionAssert assertion, {
        double? left,
        double? top,
        double? right,
        double? bottom,
      }) {
        expect(assertion.left, left);
        expect(assertion.top, top);
        expect(assertion.right, right);
        expect(assertion.bottom, bottom);
      }

      test('hasLeft', () {
        final assertion = hasLeft(input);
        checkPosition(assertion, left: input);
      });

      test('hasTop', () {
        final assertion = hasTop(input);
        checkPosition(assertion, top: input);
      });

      test('hasRight', () {
        final assertion = hasRight(input);
        checkPosition(assertion, right: input);
      });

      test('hasBottom', () {
        final assertion = hasBottom(input);
        checkPosition(assertion, bottom: input);
      });

      test('hasPosition', () {
        final assertion = hasPosition(input, input, input, input);
        checkPosition(
          assertion,
          left: input,
          top: input,
          right: input,
          bottom: input,
        );
      });

      test('hasLocation', () {
        final assertion = hasLocation(input, input);
        checkPosition(assertion, left: input, top: input);
      });

      test('hasOffset', () {
        final assertion = hasOffset(const Offset(input, input));
        checkPosition(assertion, left: input, top: input);
      });

      test('hasBounds', () {
        final assertion =
            hasBounds(const Rect.fromLTRB(input, input, input * 2, input * 2));
        checkPosition(
          assertion,
          left: input,
          top: input,
          right: input * 2,
          bottom: input * 2,
        );
      });
    });

    group('Size -', () {
      const input = 50.0;

      void checkSize(
        SizeAssert assertion, {
        double? width,
        double? height,
      }) {
        expect(assertion.width, width);
        expect(assertion.height, height);
      }

      test('hasSize', () {
        final assertion = hasSize(input, input);
        checkSize(assertion, width: input, height: input);
      });

      test('hasDimension', () {
        final assertion = hasDimension(const Size.square(input));
        checkSize(assertion, width: input, height: input);
      });

      test('hasWidth', () {
        final assertion = hasWidth(input);
        checkSize(assertion, width: input);
      });

      test('hasHeight', () {
        final assertion = hasHeight(input);
        checkSize(assertion, height: input);
      });
    });

    group('Relative position -', () {
      const id = 'TEST';
      const input = 50.0;

      void checkPosition(
        RelativePositionAssert assertion, {
        required String traitId,
        required PositionReference refersTo,
        double? left,
        double? top,
        double? right,
        double? bottom,
      }) {
        expect(assertion.traitId, traitId);
        expect(assertion.refersTo, refersTo);
        expect(assertion.left, left);
        expect(assertion.top, top);
        expect(assertion.right, right);
        expect(assertion.bottom, bottom);
      }

      // Target distance

      test('hasLeftDistanceTo', () {
        final assertion = hasLeftDistanceTo(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          left: input,
        );
      });

      test('hasTopDistanceTo', () {
        final assertion = hasTopDistanceTo(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          top: input,
        );
      });

      test('hasRightDistanceTo', () {
        final assertion = hasRightDistanceTo(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          right: input,
        );
      });

      test('hasBottomDistanceTo', () {
        final assertion = hasBottomDistanceTo(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          bottom: input,
        );
      });

      // Local positioning

      test('hasLocalLeft', () {
        final assertion = hasLocalLeft(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
        );
      });

      test('hasLocalTop', () {
        final assertion = hasLocalTop(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          top: input,
        );
      });

      test('hasLocalRight', () {
        final assertion = hasLocalRight(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          right: input,
        );
      });

      test('hasLocalBottom', () {
        final assertion = hasLocalBottom(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          bottom: input,
        );
      });

      test('hasLocalPosition', () {
        final assertion = hasLocalPosition(input, input, input, input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
          top: input,
          right: input,
          bottom: input,
        );
      });

      test('hasLocalLocation', () {
        final assertion = hasLocalLocation(input, input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
          top: input,
        );
      });

      test('hasLocalOffset', () {
        final assertion = hasLocalOffset(const Offset(input, input), id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
          top: input,
        );
      });

      test('hasLocalBounds', () {
        final assertion = hasLocalBounds(
          const Rect.fromLTRB(input, input, input * 2, input * 2),
          id,
        );
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
          top: input,
          right: input * 2,
          bottom: input * 2,
        );
      });

      // Local distance

      test('hasLocalLeftDistance', () {
        final assertion = hasLocalLeftDistance(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          left: input,
        );
      });

      test('hasLocalTopDistance', () {
        final assertion = hasLocalTopDistance(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          top: input,
        );
      });

      test('hasLocalRightDistance', () {
        final assertion = hasLocalRightDistance(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          right: input,
        );
      });

      test('hasLocalBottomDistance', () {
        final assertion = hasLocalBottomDistance(input, id);
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          bottom: input,
        );
      });

      // Global distance

      test('hasLeftDistance', () {
        final assertion = hasLeftDistance(input);
        checkPosition(
          assertion,
          refersTo: PositionReference.globalBounds,
          traitId: '',
          left: input,
        );
      });

      test('hasTopDistance', () {
        final assertion = hasTopDistance(input);
        checkPosition(
          assertion,
          refersTo: PositionReference.globalBounds,
          traitId: '',
          top: input,
        );
      });

      test('hasRightDistance', () {
        final assertion = hasRightDistance(input);
        checkPosition(
          assertion,
          refersTo: PositionReference.globalBounds,
          traitId: '',
          right: input,
        );
      });

      test('hasBottomDistance', () {
        final assertion = hasBottomDistance(input);
        checkPosition(
          assertion,
          refersTo: PositionReference.globalBounds,
          traitId: '',
          bottom: input,
        );
      });
    });

    group('Relative size -', () {
      const id = 'TEST';
      const input = 50.0;

      void checkSize(
        RelativeSizeAssert assertion, {
        required String traitId,
        double? width,
        double? height,
      }) {
        expect(assertion.width, width);
        expect(assertion.height, height);
      }

      test('hasRelativeSizeOf', () {
        final assertion = hasRelativeSizeOf(input, input, id);

        checkSize(assertion, traitId: id, width: input, height: input);
      });

      test('hasRelativeWidthOf', () {
        final assertion = hasRelativeWidthOf(input, id);

        checkSize(assertion, traitId: id, width: input);
      });

      test('hasRelativeHeightOf', () {
        final assertion = hasRelativeHeightOf(input, id);

        checkSize(assertion, traitId: id, height: input);
      });
    });
  });
}
