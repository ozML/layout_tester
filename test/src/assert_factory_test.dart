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
        final assertion = widthIsEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('widthIsUnequal', () {
        final assertion = widthIsUnequal(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('widthIsGreaterThan', () {
        final assertion = widthIsGreaterThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('widthIsGreaterThanEqual', () {
        final assertion =
            widthIsGreaterThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('widthIsLessThan', () {
        final assertion = widthIsLessThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('widthIsLessThanEqual', () {
        final assertion = widthIsLessThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Height

      test('heightIsEqual', () {
        final assertion = heightIsEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('heightIsUnequal', () {
        final assertion = heightIsUnequal(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('heightIsGreaterThan', () {
        final assertion = heightIsGreaterThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('heightIsGreaterThanEqual', () {
        final assertion =
            heightIsGreaterThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('heightIsLessThan', () {
        final assertion = heightIsLessThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('heightIsLessThanEqual', () {
        final assertion = heightIsLessThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Left

      test('leftIsEqual', () {
        final assertion = leftIsEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('leftIsUnequal', () {
        final assertion = leftIsUnequal(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('leftIsGreaterThan', () {
        final assertion = leftIsGreaterThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('leftIsGreaterThanEqual', () {
        final assertion =
            leftIsGreaterThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('leftIsLessThan', () {
        final assertion = leftIsLessThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('leftIsLessThanEqual', () {
        final assertion = leftIsLessThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Top

      test('topIsEqual', () {
        final assertion = topIsEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('topIsUnequal', () {
        final assertion = topIsUnequal(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('topIsGreaterThan', () {
        final assertion = topIsGreaterThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('topIsGreaterThanEqual', () {
        final assertion = topIsGreaterThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('topIsLessThan', () {
        final assertion = topIsLessThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('topIsLessThanEqual', () {
        final assertion = topIsLessThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Right

      test('rightIsEqual', () {
        final assertion = rightIsEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('rightIsUnequal', () {
        final assertion = rightIsUnequal(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('rightIsGreaterThan', () {
        final assertion = rightIsGreaterThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('rightIsGreaterThanEqual', () {
        final assertion =
            rightIsGreaterThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('rightIsLessThan', () {
        final assertion = rightIsLessThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('rightIsLessThanEqual', () {
        final assertion = rightIsLessThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThanEqual);
        expect(assertion.value, compareValue);
      });

      // Bottom

      test('bottomIsEqual', () {
        final assertion = bottomIsEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.equal);
        expect(assertion.value, compareValue);
      });

      test('bottomIsUnequal', () {
        final assertion = bottomIsUnequal(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.unequal);
        expect(assertion.value, compareValue);
      });

      test('bottomIsGreaterThan', () {
        final assertion = bottomIsGreaterThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThan);
        expect(assertion.value, compareValue);
      });

      test('bottomIsGreaterThanEqual', () {
        final assertion =
            bottomIsGreaterThanEqual(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.greaterThanEqual);
        expect(assertion.value, compareValue);
      });

      test('bottomIsLessThan', () {
        final assertion = bottomIsLessThan(compareValue) as RelationAssert;

        expect(assertion.relation, PropertyRelation.lessThan);
        expect(assertion.value, compareValue);
      });

      test('bottomIsLessThanEqual', () {
        final assertion = bottomIsLessThanEqual(compareValue) as RelationAssert;

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
        final assertion = hasLeft(input) as PositionAssert;
        checkPosition(assertion, left: input);
      });

      test('hasTop', () {
        final assertion = hasTop(input) as PositionAssert;
        checkPosition(assertion, top: input);
      });

      test('hasRight', () {
        final assertion = hasRight(input) as PositionAssert;
        checkPosition(assertion, right: input);
      });

      test('hasBottom', () {
        final assertion = hasBottom(input) as PositionAssert;
        checkPosition(assertion, bottom: input);
      });

      test('hasPosition', () {
        final assertion =
            hasPosition(input, input, input, input) as PositionAssert;
        checkPosition(
          assertion,
          left: input,
          top: input,
          right: input,
          bottom: input,
        );
      });

      test('hasLocation', () {
        final assertion = hasLocation(input, input) as PositionAssert;
        checkPosition(assertion, left: input, top: input);
      });

      test('hasOffset', () {
        final assertion =
            hasOffset(const Offset(input, input)) as PositionAssert;
        checkPosition(assertion, left: input, top: input);
      });

      test('hasBounds', () {
        final assertion =
            hasBounds(const Rect.fromLTRB(input, input, input * 2, input * 2))
                as PositionAssert;
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
        final assertion = hasSize(input, input) as SizeAssert;
        checkSize(assertion, width: input, height: input);
      });

      test('hasDimension', () {
        final assertion = hasDimension(const Size.square(input)) as SizeAssert;
        checkSize(assertion, width: input, height: input);
      });

      test('hasWidth', () {
        final assertion = hasWidth(input) as SizeAssert;
        checkSize(assertion, width: input);
      });

      test('hasHeight', () {
        final assertion = hasHeight(input) as SizeAssert;
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
        final assertion =
            hasLeftDistanceTo(input, id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          left: input,
        );
      });

      test('hasTopDistanceTo', () {
        final assertion = hasTopDistanceTo(input, id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          top: input,
        );
      });

      test('hasRightDistanceTo', () {
        final assertion =
            hasRightDistanceTo(input, id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          right: input,
        );
      });

      test('hasBottomDistanceTo', () {
        final assertion =
            hasBottomDistanceTo(input, id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.target,
          traitId: id,
          bottom: input,
        );
      });

      // Local positioning

      test('hasLeft', () {
        final assertion =
            hasLeft(input, parentTraitId: id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
        );
      });

      test('hasTop', () {
        final assertion =
            hasTop(input, parentTraitId: id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          top: input,
        );
      });

      test('hasRight', () {
        final assertion =
            hasRight(input, parentTraitId: id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          right: input,
        );
      });

      test('hasBottom', () {
        final assertion =
            hasBottom(input, parentTraitId: id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          bottom: input,
        );
      });

      test('hasPosition', () {
        final assertion =
            hasPosition(input, input, input, input, parentTraitId: id)
                as RelativePositionAssert;
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

      test('hasLocation', () {
        final assertion = hasLocation(input, input, parentTraitId: id)
            as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
          top: input,
        );
      });

      test('hasOffset', () {
        final assertion =
            hasOffset(const Offset(input, input), parentTraitId: id)
                as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parent,
          traitId: id,
          left: input,
          top: input,
        );
      });

      test('hasBounds', () {
        final assertion = hasBounds(
          const Rect.fromLTRB(input, input, input * 2, input * 2),
          parentTraitId: id,
        ) as RelativePositionAssert;
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

      test('hasLeftDistance', () {
        final assertion =
            hasLeftDistance(input, parentTraitId: id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          left: input,
        );
      });

      test('hasTopDistance', () {
        final assertion =
            hasTopDistance(input, parentTraitId: id) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          top: input,
        );
      });

      test('hasRightDistance', () {
        final assertion = hasRightDistance(input, parentTraitId: id)
            as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          right: input,
        );
      });

      test('hasBottomDistance', () {
        final assertion = hasBottomDistance(input, parentTraitId: id)
            as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.parentBounds,
          traitId: id,
          bottom: input,
        );
      });

      // Global distance

      test('hasLeftDistance', () {
        final assertion = hasLeftDistance(input) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.globalBounds,
          traitId: '',
          left: input,
        );
      });

      test('hasTopDistance', () {
        final assertion = hasTopDistance(input) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.globalBounds,
          traitId: '',
          top: input,
        );
      });

      test('hasRightDistance', () {
        final assertion = hasRightDistance(input) as RelativePositionAssert;
        checkPosition(
          assertion,
          refersTo: PositionReference.globalBounds,
          traitId: '',
          right: input,
        );
      });

      test('hasBottomDistance', () {
        final assertion = hasBottomDistance(input) as RelativePositionAssert;
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

      test('hasSize', () {
        final assertion =
            hasSize(input, input, compareTraitId: id) as RelativeSizeAssert;

        checkSize(assertion, traitId: id, width: input, height: input);
      });

      test('hasWidth', () {
        final assertion =
            hasWidth(input, compareTraitId: id) as RelativeSizeAssert;

        checkSize(assertion, traitId: id, width: input);
      });

      test('hasHeight', () {
        final assertion =
            hasHeight(input, compareTraitId: id) as RelativeSizeAssert;

        checkSize(assertion, traitId: id, height: input);
      });
    });
  });
}
