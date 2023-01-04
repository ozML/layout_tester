import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';
import 'package:layout_tester/layout_tester.dart';
import 'package:layout_tester/assertion_factory.dart';

void main() {
  testWidgets('Test layout', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final layoutTester = LayoutTester(tester);

    layoutTester.testLayout({
      WidgetTrait(
        id: 'appbar',
        targetId: const TargetId(type: AppBar),
        asserts: [hasSize(800, 56)],
        descendants: [
          WidgetTrait(
            id: 'appbar.text',
            targetId: const TargetId(type: Text),
            // Wrong height in test..
            asserts: [hasHeight(20)],
          )
        ],
      ),
      WidgetTrait(
        targetId: const TargetId(type: FloatingActionButton),
        asserts: [hasSize(56, 56), hasLocation(728, 528), hasTopDistance(528)],
      )
    });
  });
}
