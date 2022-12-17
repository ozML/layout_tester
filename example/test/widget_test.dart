import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';
import 'package:layout_tester/layout_tester.dart';

void main() {
  testWidgets('Test layout', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final layoutTester = LayoutTester(tester);

    layoutTester.testLayout({
      WidgetTrait(
        id: 'appbar',
        targetId: const TargetId(type: AppBar),
        asserts: const [SizeAssert.WH(800, 56)],
        descendants: [
          WidgetTrait(
            id: 'appbar.text',
            targetId: const TargetId(type: Text),
            // Wrong height in test..
            asserts: const [SizeAssert(height: 20)],
          )
        ],
      ),
      WidgetTrait(
        targetId: const TargetId(type: FloatingActionButton),
        asserts: const [
          SizeAssert.WH(56, 56),
          PositionAssert(left: 728, top: 528),
          RelativePositionAssert.relativeTo(
            traitId: 'appbar',
            topDistance: 472,
          ),
        ],
      )
    });
  });
}
