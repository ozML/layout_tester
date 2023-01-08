import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';

import 'package:layout_tester/layout_tester.dart';
import 'package:layout_tester/assertion_factory.dart';

void main() {
  group('assert_factory.dart -', () {
    group('Relation -', () {
      const compareValue = 50.0;
      // Width

      test('widthIsEqual', () {
        final assertion = widthIsEqual(compareValue);

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('widthIsUnequal', () {
        final assertion = widthIsUnequal(compareValue);

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('widthIsGreaterThan', () {
        final assertion = widthIsGreaterThan(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('widthIsGreaterThanEqual', () {
        final assertion = widthIsGreaterThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('widthIsLessThan', () {
        final assertion = widthIsLessThan(compareValue);

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('widthIsLessThanEqual', () {
        final assertion = widthIsLessThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Height

      test('heightIsEqual', () {
        final assertion = heightIsEqual(compareValue);

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('heightIsUnequal', () {
        final assertion = heightIsUnequal(compareValue);

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('heightIsGreaterThan', () {
        final assertion = heightIsGreaterThan(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('heightIsGreaterThanEqual', () {
        final assertion = heightIsGreaterThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('heightIsLessThan', () {
        final assertion = heightIsLessThan(compareValue);

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('heightIsLessThanEqual', () {
        final assertion = heightIsLessThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Left

      test('leftIsEqual', () {
        final assertion = leftIsEqual(compareValue);

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('leftIsUnequal', () {
        final assertion = leftIsUnequal(compareValue);

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('leftIsGreaterThan', () {
        final assertion = leftIsGreaterThan(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('leftIsGreaterThanEqual', () {
        final assertion = leftIsGreaterThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('leftIsLessThan', () {
        final assertion = leftIsLessThan(compareValue);

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('leftIsLessThanEqual', () {
        final assertion = leftIsLessThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Top

      test('topIsEqual', () {
        final assertion = topIsEqual(compareValue);

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('topIsUnequal', () {
        final assertion = topIsUnequal(compareValue);

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('topIsGreaterThan', () {
        final assertion = topIsGreaterThan(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('topIsGreaterThanEqual', () {
        final assertion = topIsGreaterThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('topIsLessThan', () {
        final assertion = topIsLessThan(compareValue);

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('topIsLessThanEqual', () {
        final assertion = topIsLessThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Right

      test('rightIsEqual', () {
        final assertion = rightIsEqual(compareValue);

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('rightIsUnequal', () {
        final assertion = rightIsUnequal(compareValue);

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('rightIsGreaterThan', () {
        final assertion = rightIsGreaterThan(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('rightIsGreaterThanEqual', () {
        final assertion = rightIsGreaterThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('rightIsLessThan', () {
        final assertion = rightIsLessThan(compareValue);

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('rightIsLessThanEqual', () {
        final assertion = rightIsLessThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Bottom

      test('bottomIsEqual', () {
        final assertion = bottomIsEqual(compareValue);

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('bottomIsUnequal', () {
        final assertion = bottomIsUnequal(compareValue);

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('bottomIsGreaterThan', () {
        final assertion = bottomIsGreaterThan(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('bottomIsGreaterThanEqual', () {
        final assertion = bottomIsGreaterThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('bottomIsLessThan', () {
        final assertion = bottomIsLessThan(compareValue);

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('bottomIsLessThanEqual', () {
        final assertion = bottomIsLessThanEqual(compareValue);

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
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
