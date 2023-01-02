import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/layout_tester.dart';

void main() {
  const traitId = 'TEST';
  const targetId = TargetId(type: Container);
  const bounds = Rect.fromLTWH(10, 10, 10, 10);
  final tester = LayoutTester(MockWidgetTester());

  group('LayoutTester -', () {
    testWidgets('testLayout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Row(
            children: [
              const Expanded(
                child: Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

      final layoutTester = LayoutTester(tester);

      layoutTester.testLayout({
        WidgetTrait(
          targetId: const TargetId(type: Expanded, elementIndex: 0),
          asserts: const [
            SizeAssert.WH(400, 600),
            PositionAssert.LTRB(0, 0, 400, 600),
          ],
          descendants: [
            WidgetTrait(
              id: 'leftBox',
              targetId: const TargetId(type: SizedBox),
              asserts: const [
                SizeAssert.WH(100, 100),
                PositionAssert.LTRB(150, 250, 250, 350),
                RelativeSizeAssert(traitId: 'rightBox', width: 2, height: 2),
              ],
            )
          ],
        ),
        WidgetTrait(
          id: 'rightExpanded',
          targetId: const TargetId(type: Expanded, elementIndex: 1),
          asserts: const [
            SizeAssert.WH(400, 600),
            PositionAssert.LTRB(400, 0, 800, 600),
          ],
          descendants: [
            WidgetTrait(
              id: 'rightBox',
              targetId: const TargetId(type: SizedBox),
              asserts: const [
                SizeAssert.WH(50, 50),
                PositionAssert.LTRB(400, 425, 450, 475),
                RelativeSizeAssert(traitId: 'leftBox', width: 0.5, height: 0.5),
                RelativePositionAssert.parent(
                  traitId: 'rightExpanded',
                  left: 0,
                  top: 425,
                  right: 50,
                  bottom: 475,
                ),
                RelativePositionAssert.target(traitId: 'leftBox', left: 150),
              ],
            ),
            WidgetTrait(
              targetId: TargetId.custom((widget) => widget is Container),
              asserts: const [
                SizeAssert.WH(400, 300),
                PositionAssert.LTRB(400, 0, 800, 300),
              ],
            )
          ],
        ),
      });
    });

    test('testPosition', () {
      /// Valid
      expect(
        () => tester.testPosition(
          targetId,
          bounds,
          const PositionAssert(left: 10, top: 10, right: 20, bottom: 20),
        ),
        returnsNormally,
      );

      // Invalid
      expect(
        () => tester.testPosition(
          targetId,
          bounds,
          const PositionAssert(left: 0, top: 10, right: 20, bottom: 20),
        ),
        throwsException,
      );
      expect(
        () => tester.testPosition(
          targetId,
          bounds,
          const PositionAssert(left: 10, top: 0, right: 20, bottom: 20),
        ),
        throwsException,
      );
      expect(
        () => tester.testPosition(
          targetId,
          bounds,
          const PositionAssert(left: 10, top: 10, right: 0, bottom: 20),
        ),
        throwsException,
      );
      expect(
        () => tester.testPosition(
          targetId,
          bounds,
          const PositionAssert(left: 10, top: 10, right: 20, bottom: 0),
        ),
        throwsException,
      );
    });

    test('testSize', () {
      /// Valid
      expect(
        () => tester.testSize(
          targetId,
          bounds.size,
          const SizeAssert(width: 10, height: 10),
        ),
        returnsNormally,
      );

      /// Valid
      expect(
        () => tester.testSize(
          targetId,
          bounds.size,
          const SizeAssert(width: 0, height: 10),
        ),
        throwsException,
      );
      expect(
        () => tester.testSize(
          targetId,
          bounds.size,
          const SizeAssert(width: 10, height: 0),
        ),
        throwsException,
      );
    });

    group('testRelativePosition -', () {
      group('${PositionReference.target} -', () {
        const translate = 40.0;

        // Valid
        for (int dx = -1; dx <= 1; dx++) {
          for (int dy = -1; dy <= 1; dy++) {
            test(' pos ($dx, $dy)', () {
              final ref = bounds.translate(dx * translate, dy * translate);

              double? leftFrom;
              double? rightFrom;
              if (dx != 0) {
                if (dx > 0) {
                  leftFrom = ref.left - bounds.right;
                } else {
                  rightFrom = bounds.left - ref.right;
                }
              }

              double? topFrom;
              double? bottomFrom;
              if (dy != 0) {
                if (dy > 0) {
                  topFrom = ref.top - bounds.bottom;
                } else {
                  bottomFrom = bounds.top - ref.bottom;
                }
              }

              // valid
              expect(
                () => tester.testRelativePosition(
                  targetId,
                  bounds,
                  ref,
                  RelativePositionAssert.target(
                    traitId: traitId,
                    right: leftFrom,
                    bottom: topFrom,
                    left: rightFrom,
                    top: bottomFrom,
                  ),
                ),
                returnsNormally,
              );
            });
          }
        }

        // Invalid
        test('Invalid', () {
          expect(
            () => tester.testRelativePosition(
              targetId,
              bounds,
              bounds,
              const RelativePositionAssert.target(traitId: traitId, right: 10),
            ),
            throwsException,
          );
          expect(
            () => tester.testRelativePosition(
              targetId,
              bounds,
              bounds,
              const RelativePositionAssert.target(traitId: traitId, bottom: 10),
            ),
            throwsException,
          );
          expect(
            () => tester.testRelativePosition(
              targetId,
              bounds,
              bounds,
              const RelativePositionAssert.target(traitId: traitId, left: 10),
            ),
            throwsException,
          );
          expect(
            () => tester.testRelativePosition(
              targetId,
              bounds,
              bounds,
              const RelativePositionAssert.target(traitId: traitId, top: 10),
            ),
            throwsException,
          );
        });
      });

      test('${PositionReference.parent}', () {
        const parentBounds = Rect.fromLTWH(100, 200, 100, 100);

        /// Valid
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parent(
              traitId: traitId,
              left: 10,
              top: 10,
              right: 20,
              bottom: 20,
            ),
          ),
          returnsNormally,
        );

        // Invalid
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parent(
              traitId: traitId,
              left: 0,
              top: 10,
              right: 20,
              bottom: 20,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parent(
              traitId: traitId,
              left: 10,
              top: 0,
              right: 20,
              bottom: 20,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parent(
              traitId: traitId,
              left: 10,
              top: 10,
              right: 0,
              bottom: 20,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parent(
              traitId: traitId,
              left: 10,
              top: 10,
              right: 20,
              bottom: 0,
            ),
          ),
          throwsException,
        );
      });

      test('${PositionReference.parentBounds}', () {
        const parentBounds = Rect.fromLTWH(100, 200, 100, 100);

        /// Valid
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parentBounds(
              traitId: traitId,
              left: 10,
              top: 10,
              right: 80,
              bottom: 80,
            ),
          ),
          returnsNormally,
        );

        // Invalid
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parentBounds(
              traitId: traitId,
              left: 0,
              top: 10,
              right: 80,
              bottom: 80,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parentBounds(
              traitId: traitId,
              left: 10,
              top: 0,
              right: 80,
              bottom: 80,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parentBounds(
              traitId: traitId,
              left: 10,
              top: 10,
              right: 0,
              bottom: 80,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            parentBounds,
            const RelativePositionAssert.parentBounds(
              traitId: traitId,
              left: 10,
              top: 10,
              right: 80,
              bottom: 0,
            ),
          ),
          throwsException,
        );
      });

      test('${PositionReference.globalBounds}', () {
        /// Valid
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            Offset.zero & const Size(800, 600),
            const RelativePositionAssert.globalBounds(
              left: 10,
              top: 10,
              right: 780,
              bottom: 580,
            ),
          ),
          returnsNormally,
        );

        // Invalid
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            Offset.zero & const Size(800, 600),
            const RelativePositionAssert.globalBounds(
              left: 0,
              top: 10,
              right: 780,
              bottom: 580,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            Offset.zero & const Size(800, 600),
            const RelativePositionAssert.globalBounds(
              left: 10,
              top: 0,
              right: 780,
              bottom: 580,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            Offset.zero & const Size(800, 600),
            const RelativePositionAssert.globalBounds(
              left: 10,
              top: 10,
              right: 0,
              bottom: 580,
            ),
          ),
          throwsException,
        );
        expect(
          () => tester.testRelativePosition(
            targetId,
            bounds,
            Offset.zero & const Size(800, 600),
            const RelativePositionAssert.globalBounds(
              left: 10,
              top: 10,
              right: 780,
              bottom: 0,
            ),
          ),
          throwsException,
        );
      });
    });

    test('testRelativeSize', () {
      // Valid
      expect(
        () => tester.testRelativeSize(
          targetId,
          const Size(50, 50),
          const Size(25, 100),
          const RelativeSizeAssert(traitId: traitId, width: 2, height: 0.5),
        ),
        returnsNormally,
      );

      // Invalid
      expect(
        () => tester.testRelativeSize(
          targetId,
          const Size(50, 50),
          const Size(25, 100),
          const RelativeSizeAssert(traitId: traitId, width: 1),
        ),
        throwsException,
      );
      expect(
        () => tester.testRelativeSize(
          targetId,
          const Size(50, 50),
          const Size(25, 100),
          const RelativeSizeAssert(traitId: traitId, height: 1),
        ),
        throwsException,
      );
    });

    test('testRelation', () {
      // Valid
      expect(
        () => tester.testRelation(
          targetId,
          const Rect.fromLTWH(10, 10, 50, 50),
          widthIsEqual(50),
        ),
        returnsNormally,
      );

      // Invalid
      expect(
        () => tester.testRelation(
          targetId,
          const Rect.fromLTWH(10, 10, 50, 50),
          widthIsEqual(100),
        ),
        throwsException,
      );
    });
  });
}

class MockWidgetTester implements WidgetTester {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class TestCustomTraitAssert extends CustomTraitAssert {
  TestCustomTraitAssert(this.testAction);

  final void Function(
    WidgetTrait trait,
    Rect bounds,
    Size screenSize,
    WidgetTrait? compareTrait,
    Rect? compareBounds,
  ) testAction;

  @override
  void test(
    WidgetTrait trait,
    Rect bounds,
    Size screenSize, [
    WidgetTrait? compareTrait,
    Rect? compareBounds,
  ]) =>
      testAction(trait, bounds, screenSize, compareTrait, compareBounds);
}
