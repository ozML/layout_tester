import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/layout_tester.dart';

void main() {
  group('relative.dart -', () {
    group('RelativePositionAssert -', () {
      testWidgets('evaluate', (tester) async {
        final failedAssert = throwsA(isA<AssertionFailedException>());
        final unknownTrait = throwsA(isA<UnknowWidgetTraitException>());
        const unknownWidget = throwsStateError;

        RelativePositionAssert positionForRef(
          PositionReference refersTo, {
          String traitId = '',
          double? l,
          double? t,
          double? r,
          double? b,
        }) {
          switch (refersTo) {
            case PositionReference.target:
              return RelativePositionAssert.target(
                traitId: traitId,
                left: l,
                top: t,
                right: r,
                bottom: b,
              );
            case PositionReference.parent:
              return RelativePositionAssert.parent(
                traitId: traitId,
                left: l,
                top: t,
                right: r,
                bottom: b,
              );
            case PositionReference.parentBounds:
              return RelativePositionAssert.parentBounds(
                traitId: traitId,
                left: l,
                top: t,
                right: r,
                bottom: b,
              );
            case PositionReference.globalBounds:
              return RelativePositionAssert.globalBounds(
                left: l,
                top: t,
                right: r,
                bottom: b,
              );
          }
        }

        void checkPosition({
          required PositionReference refersTo,
          required String traitId,
          String? refId,
          double? l,
          double? t,
          double? r,
          double? b,
          TargetId targetId = const TargetId(key: Key('#')),
          result = returnsNormally,
        }) {
          final parentTrait = WidgetTrait(
            id: 'refParent',
            targetId: const TargetId(key: Key('refParent')),
            descendants: [
              WidgetTrait(
                targetId: targetId,
                asserts: [
                  positionForRef(
                    refersTo,
                    traitId: traitId,
                    l: l,
                    t: t,
                    r: r,
                    b: b,
                  ),
                ],
              ),
            ],
          );

          final refTrait = WidgetTrait(
            id: refId ?? traitId,
            targetId: TargetId(key: Key(refId ?? traitId)),
          );

          expect(
            () => parentTrait.descendants[0].asserts[0].evaluate(
              tester,
              parentTrait.descendants[0],
              [parentTrait, refTrait],
            ),
            result,
          );
        }

        tester.binding.window.physicalSizeTestValue = const Size(600, 600);
        tester.binding.window.devicePixelRatioTestValue = 1;
        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });

        await tester.pumpWidget(
          MaterialApp(
            home: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refTL'),
                            dimension: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refL'),
                            dimension: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refBL'),
                            dimension: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refT'),
                            dimension: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        key: Key('refParent'),
                        child: Center(
                          child: SizedBox.square(
                            key: Key('#'),
                            dimension: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refB'),
                            dimension: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refTR'),
                            dimension: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refR'),
                            dimension: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SizedBox.square(
                            key: Key('refBR'),
                            dimension: 50,
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

        // Target Valid

        const refTarget = PositionReference.target;

        checkPosition(refersTo: refTarget, traitId: 'refL', l: 150);
        checkPosition(refersTo: refTarget, traitId: 'refTL', l: 150, t: 150);
        checkPosition(refersTo: refTarget, traitId: 'refT', t: 150);
        checkPosition(refersTo: refTarget, traitId: 'refTR', r: 150, t: 150);
        checkPosition(refersTo: refTarget, traitId: 'refR', r: 150);
        checkPosition(refersTo: refTarget, traitId: 'refBR', r: 150, b: 150);
        checkPosition(refersTo: refTarget, traitId: 'refB', b: 150);
        checkPosition(refersTo: refTarget, traitId: 'refBL', l: 150, b: 150);

        // Target Invalid

        checkPosition(
          refersTo: refTarget,
          traitId: 'refL',
          l: 0,
          result: failedAssert,
        );
        checkPosition(
          refersTo: refTarget,
          targetId: const TargetId(key: Key('')),
          traitId: 'refL',
          l: 0,
          result: unknownWidget,
        );
        checkPosition(
          refersTo: refTarget,
          traitId: '',
          refId: 'refL',
          l: 0,
          result: unknownTrait,
        );

        // Parent Valid

        const refParent = PositionReference.parent;

        checkPosition(
          refersTo: refParent,
          traitId: 'refParent',
          refId: 'refL',
          l: 75,
          t: 75,
          r: 125,
          b: 125,
        );

        // Parent Invalid

        checkPosition(
          refersTo: refParent,
          targetId: const TargetId(key: Key('')),
          traitId: 'refL',
          l: 0,
          result: unknownWidget,
        );
        checkPosition(
          refersTo: refParent,
          traitId: 'refL',
          l: 0,
          result: unknownTrait,
        );
        checkPosition(
          refersTo: refParent,
          traitId: '',
          l: 0,
          result: unknownTrait,
        );

        // Parent Bounds Valid

        const refParentBounds = PositionReference.parentBounds;

        checkPosition(
          refersTo: refParentBounds,
          traitId: 'refParent',
          refId: 'refL',
          l: 75,
          t: 75,
          r: 75,
          b: 75,
        );

        // Parent Bounds Invalid

        checkPosition(
          refersTo: refParentBounds,
          targetId: const TargetId(key: Key('')),
          traitId: 'refL',
          l: 0,
          result: unknownWidget,
        );
        checkPosition(
          refersTo: refParentBounds,
          traitId: 'refL',
          l: 0,
          result: unknownTrait,
        );
        checkPosition(
          refersTo: refParentBounds,
          traitId: '',
          l: 0,
          result: unknownTrait,
        );

        // Global Bounds Valid

        const refGlobalBounds = PositionReference.globalBounds;

        checkPosition(
          refersTo: refGlobalBounds,
          // Not used
          traitId: '',
          l: 275,
          t: 275,
          r: 275,
          b: 275,
        );

        // Global Bounds Invalid

        checkPosition(
          refersTo: refGlobalBounds,
          targetId: const TargetId(key: Key('')),
          // Not used
          traitId: '',
          l: 0,
          result: unknownWidget,
        );
      });

      testWidgets('validate isAbsolute', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Stack(
              children: [
                // The both are intersecting on the horizontal axis
                Positioned.fromRect(
                  rect: const Rect.fromLTWH(375, 200, 100, 100),
                  child: const SizedBox.shrink(),
                ),
                Positioned.fromRect(
                  rect: const Rect.fromLTWH(425, 300, 100, 100),
                  child: const SizedBox.shrink(),
                ),

                // Reaches out of parent bounds by half
                Positioned.fromRect(
                  rect: const Rect.fromLTWH(-50, 250, 100, 100),
                  child: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );

        // Target

        testLayout(tester, {
          WidgetTrait(id: '0', targetId: const TargetId.type(Positioned, 0)),
          WidgetTrait(
            targetId: const TargetId.type(Positioned, 1),
            asserts: const [
              RelativePositionAssert.target(traitId: '0', left: 50),
            ],
          ),
        });
        testLayout(tester, {
          WidgetTrait(id: '0', targetId: const TargetId.type(Positioned, 0)),
          WidgetTrait(
            targetId: const TargetId.type(Positioned, 1),
            asserts: const [
              RelativePositionAssert.target(
                traitId: '0',
                left: -50,
                isAbsolute: false,
              ),
            ],
          ),
        });

        // Parent bounds

        testLayout(tester, {
          WidgetTrait(
            id: '#',
            targetId: const TargetId.type(Stack),
            descendants: [
              WidgetTrait(
                targetId: const TargetId.type(Positioned, 2),
                asserts: const [
                  RelativePositionAssert.parentBounds(traitId: '#', left: 50),
                ],
              ),
            ],
          ),
        });
        testLayout(tester, {
          WidgetTrait(
            id: '#',
            targetId: const TargetId.type(Stack),
            descendants: [
              WidgetTrait(
                targetId: const TargetId.type(Positioned, 2),
                asserts: const [
                  RelativePositionAssert.parentBounds(
                    traitId: '#',
                    left: -50,
                    isAbsolute: false,
                  ),
                ],
              ),
            ],
          ),
        });

        // Global bounds

        testLayout(tester, {
          WidgetTrait(
            targetId: const TargetId.type(Positioned, 2),
            asserts: const [RelativePositionAssert.globalBounds(left: 50)],
          ),
        });
        testLayout(tester, {
          WidgetTrait(
            targetId: const TargetId.type(Positioned, 2),
            asserts: const [
              RelativePositionAssert.globalBounds(left: -50, isAbsolute: false),
            ],
          ),
        });
      });
    });

    testWidgets('RelativeSizeAssert - evaluate', (tester) async {
      final failedAssert = throwsA(isA<AssertionFailedException>());
      final unknownTrait = throwsA(isA<UnknowWidgetTraitException>());
      const unknownWidget = throwsStateError;

      void checkSize({
        double? w,
        double? h,
        TargetId targetId = const TargetId(type: SizedBox, elementIndex: 0),
        String traitId = 'ref',
        result = returnsNormally,
      }) {
        final trait = WidgetTrait(
          targetId: targetId,
          asserts: [RelativeSizeAssert(traitId: traitId, width: w, height: h)],
        );
        final refTrait = WidgetTrait(
          id: 'ref',
          targetId: const TargetId(type: SizedBox, elementIndex: 1),
        );

        expect(
          () => trait.asserts[0].evaluate(tester, trait, [trait, refTrait]),
          result,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Row(
            children: const [
              Expanded(
                child: Center(
                  child: SizedBox(width: 50, height: 50),
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(width: 10, height: 10),
                ),
              ),
            ],
          ),
        ),
      );

      // Valid
      checkSize(w: 5, h: 5);

      // Invalid
      checkSize(w: 1, h: 5, result: failedAssert);
      checkSize(w: 1, h: 1, result: failedAssert);
      checkSize(
        w: 5,
        h: 5,
        targetId: const TargetId(type: Container),
        result: unknownWidget,
      );
      checkSize(
        w: 5,
        h: 5,
        traitId: '',
        result: unknownTrait,
      );
    });
  });
}
