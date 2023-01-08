import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/assertion_factory.dart';
import 'package:layout_tester/layout_tester.dart';

void main() {
  group('general.dart -', () {
    testWidgets('PositionAssert - evaluate', (tester) async {
      final failedAssert = throwsA(isA<AssertionFailedException>());
      const unknownWidget = throwsStateError;

      void checkPosition({
        double? l,
        double? t,
        double? r,
        double? b,
        TargetId targetId = const TargetId(type: Positioned),
        result = returnsNormally,
      }) {
        final trait = WidgetTrait(
          targetId: targetId,
          asserts: [
            PositionAssert(left: l, top: t, right: r, bottom: b),
          ],
        );

        expect(
          () => trait.asserts[0].evaluate(tester, trait, [trait]),
          result,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Stack(
            children: [
              Positioned.fromRect(
                rect: const Rect.fromLTRB(10, 10, 20, 20),
                child: Container(),
              )
            ],
          ),
        ),
      );

      // Valid
      checkPosition(l: 10, t: 10, r: 20, b: 20);

      // Invalid position
      checkPosition(l: 0, t: 10, r: 20, b: 20, result: failedAssert);
      checkPosition(l: 10, t: 0, r: 20, b: 20, result: failedAssert);
      checkPosition(l: 10, t: 10, r: 0, b: 20, result: failedAssert);
      checkPosition(l: 10, t: 10, r: 20, b: 0, result: failedAssert);

      // Unknown widget
      checkPosition(
        l: 10,
        t: 10,
        r: 20,
        b: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );
    });

    testWidgets('SizeAssert - evaluate', (tester) async {
      final failedAssert = throwsA(isA<AssertionFailedException>());
      const unknownWidget = throwsStateError;

      void checkSize({
        double? w,
        double? h,
        TargetId targetId = const TargetId(type: SizedBox),
        result = returnsNormally,
      }) {
        final trait = WidgetTrait(
          targetId: targetId,
          asserts: [SizeAssert(width: w, height: h)],
        );

        expect(
          () => trait.asserts[0].evaluate(tester, trait, [trait]),
          result,
        );
      }

      await tester.pumpWidget(
        const MaterialApp(home: Center(child: SizedBox(width: 40, height: 50))),
      );

      // Valid
      checkSize(w: 40, h: 50);

      // Invalid position
      checkSize(w: 0, h: 50, result: failedAssert);
      checkSize(w: 40, h: 0, result: failedAssert);

      // Unknown widget
      checkSize(
        w: 40,
        h: 50,
        targetId: const TargetId(type: Container),
        result: unknownWidget,
      );
    });

    testWidgets('RelationAssert - evaluate', (tester) async {
      final failedAssert = throwsA(isA<AssertionFailedException>());
      const unknownWidget = throwsStateError;

      void checkRelation(
        RelationAssert Function(double value) factory, {
        double value = 0,
        TargetId targetId = const TargetId(type: Positioned),
        result = returnsNormally,
      }) {
        final trait = WidgetTrait(
          targetId: targetId,
          asserts: [factory(value)],
        );

        expect(
          () => trait.asserts[0].evaluate(tester, trait, [trait]),
          result,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Stack(
            children: [
              Positioned.fromRect(
                rect: const Rect.fromLTRB(10, 10, 20, 20),
                child: Container(),
              )
            ],
          ),
        ),
      );

      // Width

      checkRelation(widthIsEqual, value: 10);
      checkRelation(widthIsEqual, result: failedAssert);
      checkRelation(
        widthIsEqual,
        value: 10,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(widthIsUnequal);
      checkRelation(widthIsUnequal, value: 10, result: failedAssert);
      checkRelation(
        widthIsUnequal,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(widthIsGreaterThan);
      checkRelation(widthIsGreaterThan, value: 10, result: failedAssert);
      checkRelation(
        widthIsGreaterThan,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(widthIsGreaterThanEqual);
      checkRelation(widthIsGreaterThanEqual, value: 10);
      checkRelation(widthIsGreaterThanEqual, value: 20, result: failedAssert);
      checkRelation(
        widthIsGreaterThanEqual,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(widthIsLessThan, value: 20);
      checkRelation(widthIsLessThan, result: failedAssert);
      checkRelation(
        widthIsLessThan,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(widthIsLessThanEqual, value: 20);
      checkRelation(widthIsLessThanEqual, value: 10);
      checkRelation(widthIsLessThanEqual, result: failedAssert);
      checkRelation(
        widthIsLessThanEqual,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      // Height

      checkRelation(heightIsEqual, value: 10);
      checkRelation(heightIsEqual, result: failedAssert);
      checkRelation(
        heightIsEqual,
        value: 10,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(heightIsUnequal);
      checkRelation(heightIsUnequal, value: 10, result: failedAssert);
      checkRelation(
        heightIsUnequal,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(heightIsGreaterThan);
      checkRelation(heightIsGreaterThan, value: 10, result: failedAssert);
      checkRelation(
        heightIsGreaterThan,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(heightIsGreaterThanEqual);
      checkRelation(heightIsGreaterThanEqual, value: 10);
      checkRelation(heightIsGreaterThanEqual, value: 20, result: failedAssert);
      checkRelation(
        heightIsGreaterThanEqual,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(heightIsLessThan, value: 20);
      checkRelation(heightIsLessThan, result: failedAssert);
      checkRelation(
        heightIsLessThan,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(heightIsLessThanEqual, value: 20);
      checkRelation(heightIsLessThanEqual, value: 10);
      checkRelation(heightIsLessThanEqual, result: failedAssert);
      checkRelation(
        heightIsLessThanEqual,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      // Left

      checkRelation(leftIsEqual, value: 10);
      checkRelation(leftIsEqual, result: failedAssert);
      checkRelation(
        leftIsEqual,
        value: 10,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(leftIsUnequal);
      checkRelation(leftIsUnequal, value: 10, result: failedAssert);
      checkRelation(
        leftIsUnequal,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(leftIsGreaterThan);
      checkRelation(leftIsGreaterThan, value: 10, result: failedAssert);
      checkRelation(
        leftIsGreaterThan,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(leftIsGreaterThanEqual);
      checkRelation(leftIsGreaterThanEqual, value: 10);
      checkRelation(leftIsGreaterThanEqual, value: 20, result: failedAssert);
      checkRelation(
        leftIsGreaterThanEqual,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(leftIsLessThan, value: 20);
      checkRelation(leftIsLessThan, result: failedAssert);
      checkRelation(
        leftIsLessThan,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(leftIsLessThanEqual, value: 20);
      checkRelation(leftIsLessThanEqual, value: 10);
      checkRelation(leftIsLessThanEqual, result: failedAssert);
      checkRelation(
        leftIsLessThanEqual,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      // Top

      checkRelation(topIsEqual, value: 10);
      checkRelation(topIsEqual, result: failedAssert);
      checkRelation(
        topIsEqual,
        value: 10,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(topIsUnequal);
      checkRelation(topIsUnequal, value: 10, result: failedAssert);
      checkRelation(
        topIsUnequal,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(topIsGreaterThan);
      checkRelation(topIsGreaterThan, value: 10, result: failedAssert);
      checkRelation(
        topIsGreaterThan,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(topIsGreaterThanEqual);
      checkRelation(topIsGreaterThanEqual, value: 10);
      checkRelation(topIsGreaterThanEqual, value: 20, result: failedAssert);
      checkRelation(
        topIsGreaterThanEqual,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(topIsLessThan, value: 20);
      checkRelation(topIsLessThan, result: failedAssert);
      checkRelation(
        topIsLessThan,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(topIsLessThanEqual, value: 20);
      checkRelation(topIsLessThanEqual, value: 10);
      checkRelation(topIsLessThanEqual, result: failedAssert);
      checkRelation(
        topIsLessThanEqual,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      // Right

      checkRelation(rightIsEqual, value: 20);
      checkRelation(rightIsEqual, result: failedAssert);
      checkRelation(
        rightIsEqual,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(rightIsUnequal);
      checkRelation(rightIsUnequal, value: 20, result: failedAssert);
      checkRelation(
        rightIsUnequal,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(rightIsGreaterThan);
      checkRelation(rightIsGreaterThan, value: 20, result: failedAssert);
      checkRelation(
        rightIsGreaterThan,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(rightIsGreaterThanEqual);
      checkRelation(rightIsGreaterThanEqual, value: 20);
      checkRelation(rightIsGreaterThanEqual, value: 30, result: failedAssert);
      checkRelation(
        rightIsGreaterThanEqual,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(rightIsLessThan, value: 30);
      checkRelation(rightIsLessThan, result: failedAssert);
      checkRelation(
        rightIsLessThan,
        value: 30,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(rightIsLessThanEqual, value: 30);
      checkRelation(rightIsLessThanEqual, value: 20);
      checkRelation(rightIsLessThanEqual, result: failedAssert);
      checkRelation(
        rightIsLessThanEqual,
        value: 30,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      // Bottom

      checkRelation(bottomIsEqual, value: 20);
      checkRelation(bottomIsEqual, result: failedAssert);
      checkRelation(
        bottomIsEqual,
        value: 20,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(bottomIsUnequal);
      checkRelation(bottomIsUnequal, value: 20, result: failedAssert);
      checkRelation(
        bottomIsUnequal,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(bottomIsGreaterThan);
      checkRelation(bottomIsGreaterThan, value: 20, result: failedAssert);
      checkRelation(
        bottomIsGreaterThan,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(bottomIsGreaterThanEqual);
      checkRelation(bottomIsGreaterThanEqual, value: 20);
      checkRelation(bottomIsGreaterThanEqual, value: 30, result: failedAssert);
      checkRelation(
        bottomIsGreaterThanEqual,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(bottomIsLessThan, value: 30);
      checkRelation(bottomIsLessThan, result: failedAssert);
      checkRelation(
        bottomIsLessThan,
        value: 30,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );

      checkRelation(bottomIsLessThanEqual, value: 30);
      checkRelation(bottomIsLessThanEqual, value: 20);
      checkRelation(bottomIsLessThanEqual, result: failedAssert);
      checkRelation(
        bottomIsLessThanEqual,
        value: 30,
        targetId: const TargetId(type: SizedBox),
        result: unknownWidget,
      );
    });
  });
}
