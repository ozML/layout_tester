import 'package:flutter_test/flutter_test.dart' as ft;

import 'widget_trait.dart';

/// Runs the layout test logic without the need to create a [LayoutTester]
/// manually.
void testLayout(ft.WidgetTester tester, Set<WidgetTrait> traits) =>
    LayoutTester(tester).testLayout(traits);

class LayoutTester {
  /// Creates an instance of [LayoutTester].
  const LayoutTester(this.tester);

  /// Widget tester used with this instance.
  final ft.WidgetTester tester;

  /// Runs the layout test logic.
  void testLayout(Set<WidgetTrait> traits) =>
      _traverseAndTest(rootTraits: traits.toList());

  void _traverseAndTest({
    required List<WidgetTrait> rootTraits,
    List<WidgetTrait>? currentTraits,
  }) {
    final traits = currentTraits ?? rootTraits;
    for (final trait in traits) {
      for (final tAssert in trait.asserts) {
        tAssert.evaluate(tester, trait, rootTraits);
      }

      _traverseAndTest(
        rootTraits: rootTraits,
        currentTraits: trait.descendants,
      );
    }
  }
}
