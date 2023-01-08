import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:layout_tester/layout_tester.dart';

void main() {
  group('LayoutTester -', () {
    testWidgets('testLayout - check recursion', (tester) async {
      final layoutTester = LayoutTester(tester);

      final processed = {
        '0': 0,
        '0.0': 0,
        '0.1': 0,
        '0.1.0': 0,
      };

      void process(
        WidgetTester tester,
        WidgetTrait trait,
        List<WidgetTrait> rootTraits,
      ) =>
          processed[trait.id] = processed[trait.id]! + 1;

      final trait = WidgetTrait(
        id: '0',
        targetId: const TargetId(key: Key('0')),
        asserts: [TestCustomTraitAssert(process)],
        descendants: [
          WidgetTrait(
            id: '0.0',
            targetId: const TargetId(key: Key('0.0')),
            asserts: [TestCustomTraitAssert(process)],
            descendants: [],
          ),
          WidgetTrait(
            id: '0.1',
            targetId: const TargetId(key: Key('0.1')),
            asserts: [TestCustomTraitAssert(process)],
            descendants: [
              WidgetTrait(
                id: '0.1.0',
                targetId: const TargetId(key: Key('0.1.0')),
                asserts: [TestCustomTraitAssert(process)],
              )
            ],
          )
        ],
      );

      layoutTester.testLayout({trait});

      expect(processed, {
        '0': 1,
        '0.0': 1,
        '0.1': 1,
        '0.1.0': 1,
      });
    });
  });
}

class TestCustomTraitAssert extends CustomTraitAssert {
  TestCustomTraitAssert(this.testAction);

  final void Function(
    WidgetTester tester,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) testAction;

  @override
  void evaluate(
    WidgetTester tester,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) =>
      testAction(tester, trait, rootTraits);
}
