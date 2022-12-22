import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/layout_tester.dart';
import 'package:layout_tester/src/trait_helper.dart';

void main() {
  final rootTraits = [
    WidgetTrait(
      id: '0',
      targetId: const TargetId(type: Widget),
    ),
    WidgetTrait(
      id: '1',
      targetId: const TargetId(type: Widget),
      descendants: [
        WidgetTrait(
            id: '1.0',
            targetId: const TargetId(type: Widget),
            descendants: [
              WidgetTrait(
                id: '1.0.0',
                targetId: const TargetId(type: Widget),
              ),
            ]),
        WidgetTrait(
            id: '1.1',
            targetId: const TargetId(type: Widget),
            descendants: [
              WidgetTrait(
                  id: '1.1.0',
                  targetId: const TargetId(type: Widget),
                  descendants: [
                    WidgetTrait(
                      id: '1.1.0.0',
                      targetId: const TargetId(type: Widget),
                    ),
                  ]),
            ]),
        WidgetTrait(
          id: '1.2',
          targetId: const TargetId(type: Widget),
        ),
      ],
    ),
    WidgetTrait(
      id: '2',
      targetId: const TargetId(type: Widget),
      descendants: [
        WidgetTrait(
          id: '2.0',
          targetId: const TargetId(type: Widget),
        ),
      ],
    ),
  ];

  group('TraitHelper -', () {
    // Matching
    test('isTarget', () {
      expect(
        TraitHelper.isTarget(
          const TargetId(key: Key('TEST')),
          Container(key: const Key('TEST')),
        ),
        true,
      );
      expect(
        TraitHelper.isTarget(
          const TargetId(type: Container),
          Container(),
        ),
        true,
      );
      expect(
        TraitHelper.isTarget(
          const TargetId(key: Key('TEST'), type: Container),
          Container(key: const Key('TEST')),
        ),
        true,
      );

      // Not matching
      expect(
        TraitHelper.isTarget(
          const TargetId(key: Key('TEST')),
          Container(key: const Key('TEST0')),
        ),
        false,
      );
      expect(
        TraitHelper.isTarget(
          const TargetId(type: SizedBox),
          Container(),
        ),
        false,
      );
      expect(
        TraitHelper.isTarget(
          const TargetId(key: Key('TEST'), type: Container),
          Container(key: const Key('TEST0')),
        ),
        false,
      );
      expect(
        TraitHelper.isTarget(
          const TargetId(key: Key('TEST'), type: SizedBox),
          Container(key: const Key('TEST')),
        ),
        false,
      );
      expect(
        TraitHelper.isTarget(
          const TargetId(key: Key('TEST'), type: SizedBox),
          Container(key: const Key('TEST0')),
        ),
        false,
      );
    });

    testWidgets('getTarget', (tester) async {
      // Matching
      await tester.pumpWidget(Column(
        children: [
          Expanded(child: Container()),
          Expanded(key: const Key('#'), child: Container()),
        ],
      ));

      expect(
        TraitHelper.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('#')),
            descendants: [
              WidgetTrait(
                targetId: TargetId.custom((widget) => widget is Container),
              )
            ],
          ),
          tester: tester,
        ),
        isNotNull,
      );

      await tester.pumpWidget(Container(key: const Key('TEST')));
      expect(
        TraitHelper.getTarget(
          WidgetTrait(targetId: const TargetId(key: Key('TEST'))),
          tester: tester,
        ),
        isNotNull,
      );
      expect(
        TraitHelper.getTarget(
          WidgetTrait(targetId: const TargetId(type: Container)),
          tester: tester,
        ),
        isNotNull,
      );
      expect(
        TraitHelper.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST'), type: Container),
          ),
          tester: tester,
        ),
        isNotNull,
      );

      // Not matching
      expect(
        () => TraitHelper.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST0')),
          ),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitHelper.getTarget(
          WidgetTrait(targetId: const TargetId(type: SizedBox)),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitHelper.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST0'), type: Container),
          ),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitHelper.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST'), type: SizedBox),
          ),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitHelper.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST0'), type: SizedBox),
          ),
          tester: tester,
        ),
        throwsStateError,
      );
    });

    test('findAncestorOf', () {
      final trait = rootTraits[1].descendants[0].descendants[0];

      // Ancestor
      expect(
        TraitHelper.findAncestorOf(trait, ancestorId: '1'),
        isNotNull,
      );

      // Non ancestor

      // Other root
      expect(
        TraitHelper.findAncestorOf(trait, ancestorId: '2'),
        isNull,
      );

      // Self
      expect(
        TraitHelper.findAncestorOf(trait, ancestorId: '1.0.0'),
        isNull,
      );

      // Unknown
      expect(
        TraitHelper.findAncestorOf(trait, ancestorId: 'x'),
        isNull,
      );

      // From root ancestor

      final rootAncestor = rootTraits[1];

      // Self
      expect(
        TraitHelper.findAncestorOf(rootAncestor, ancestorId: '1'),
        isNull,
      );
      // Descendant
      expect(
        TraitHelper.findAncestorOf(rootAncestor, ancestorId: '1.0'),
        isNull,
      );
      // Other root descendant
      expect(
        TraitHelper.findAncestorOf(rootAncestor, ancestorId: '2.0'),
        isNull,
      );
    });

    test('findRootAncestorOf', () {
      expect(
        TraitHelper.findRootAncestorOf(rootTraits[0]),
        isNull,
      );
      expect(
        TraitHelper.findRootAncestorOf(
          rootTraits[1].descendants[0].descendants[0],
        ),
        rootTraits[1],
      );
      expect(
        TraitHelper.findRootAncestorOf(rootTraits[2].descendants[0]),
        rootTraits[2],
      );
    });

    test('findDescendantOf', () {
      final trait = rootTraits[1].descendants[0];

      // Descendant
      expect(
        TraitHelper.findDescendantOf(trait, descendantId: '1.0.0'),
        isNotNull,
      );

      // Non descendant

      // Root ancestor
      expect(
        TraitHelper.findDescendantOf(trait, descendantId: '1'),
        isNull,
      );
      // Other root
      expect(
        TraitHelper.findDescendantOf(trait, descendantId: '2'),
        isNull,
      );
      // Other root descendant
      expect(
        TraitHelper.findDescendantOf(trait, descendantId: '2.0'),
        isNull,
      );
      // Self
      expect(
        TraitHelper.findDescendantOf(trait, descendantId: '1.0'),
        isNull,
      );

      // Unknown
      expect(
        TraitHelper.findDescendantOf(trait, descendantId: 'x'),
        isNull,
      );
    });

    test('findUnrelated', () {
      final trait = rootTraits[1].descendants[0];

      // Related

      // Root parent
      expect(
        TraitHelper.findUnrelated(
          trait,
          traitId: '1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Sibling
      expect(
        TraitHelper.findUnrelated(
          trait,
          traitId: '1.1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Self
      expect(
        TraitHelper.findUnrelated(
          trait,
          traitId: '1.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Descendant
      expect(
        TraitHelper.findUnrelated(
          trait,
          traitId: '1.0.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );

      // Unrelated

      // Other root
      expect(
        TraitHelper.findUnrelated(
          trait,
          traitId: '2',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );
      // Other root descendant
      expect(
        TraitHelper.findUnrelated(
          trait,
          traitId: '2.0',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );

      // Unknown
      expect(
        TraitHelper.findUnrelated(trait, traitId: 'x', rootTraits: rootTraits),
        isNull,
      );

      // From root ancestor

      final rootAncestor = rootTraits[1];

      // Self
      expect(
        TraitHelper.findUnrelated(
          rootAncestor,
          traitId: '1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Descendant
      expect(
        TraitHelper.findUnrelated(
          rootAncestor,
          traitId: '1.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Other root descendant
      expect(
        TraitHelper.findUnrelated(
          rootAncestor,
          traitId: '2.0',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );
    });

    test('findNonIntersecting', () {
      final trait = rootTraits[1].descendants[0];

      // Intersecting

      // Root ancestor
      expect(
        TraitHelper.findNonIntersecting(
          trait,
          traitId: '1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Descendant
      expect(
        TraitHelper.findNonIntersecting(
          trait,
          traitId: '1.0.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Self
      expect(
        TraitHelper.findNonIntersecting(
          trait,
          traitId: '1.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );

      // Non intersecting

      // Far sibling
      expect(
        TraitHelper.findNonIntersecting(
          trait,
          traitId: '1.1.0',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );
      // Other root
      expect(
        TraitHelper.findNonIntersecting(
          trait,
          traitId: '2',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );
      // Other root descendant
      expect(
        TraitHelper.findNonIntersecting(
          trait,
          traitId: '2.0',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );

      // Unknown
      expect(
        TraitHelper.findNonIntersecting(
          trait,
          traitId: 'x',
          rootTraits: rootTraits,
        ),
        isNull,
      );
    });

    test('findTrait', () {
      // Known
      expect(
        TraitHelper.findTrait(traitId: '1', rootTraits: rootTraits),
        isNotNull,
      );
      expect(
        TraitHelper.findTrait(traitId: '1.1.0.0', rootTraits: rootTraits),
        isNotNull,
      );
      expect(
        TraitHelper.findTrait(traitId: '2.0', rootTraits: rootTraits),
        isNotNull,
      );

      // Unkown
      expect(
        TraitHelper.findTrait(traitId: 'x', rootTraits: rootTraits),
        isNull,
      );
    });
  });
}
