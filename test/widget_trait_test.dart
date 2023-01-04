import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/layout_tester.dart';

void main() {
  group('WidgetTrait -', () {
    test('Check parent linkage', () {
      final trait = WidgetTrait(
        id: '0',
        targetId: const TargetId(type: Widget),
        descendants: [
          WidgetTrait(
            id: '0.0',
            targetId: const TargetId(type: Widget),
            descendants: [
              WidgetTrait(
                id: '0.0.0',
                targetId: const TargetId(type: Widget),
              )
            ],
          )
        ],
      );

      expect(trait.descendants[0].descendants[0].parent, trait.descendants[0]);
      expect(trait.descendants[0].parent, trait);
    });

    test('withParents', () {
      final root = WidgetTrait.withParents(
        const [
          ComposeTargetId(key: Key('2')),
          ComposeTargetId(key: Key('1')),
          ComposeTargetId(key: Key('0')),
        ],
        targetId: const TargetId(key: Key('3')),
      );

      expect(
        root.targetId,
        const TargetId(key: Key('0')),
      );
      expect(
        root.descendants.first.targetId,
        const TargetId(key: Key('1')),
      );
      expect(
        root.descendants.first.descendants.first.targetId,
        const TargetId(key: Key('2')),
      );
      expect(
        root.descendants.first.descendants.first.descendants.first.targetId,
        const TargetId(key: Key('3')),
      );
    });
  });
}
