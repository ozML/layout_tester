import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:layout_tester/layout_tester.dart';

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

  group('TraitFinder -', () {
    // Matching
    test('isTarget', () {
      expect(
        TraitFinder.isTarget(
          const TargetId(key: Key('TEST')),
          Container(key: const Key('TEST')),
        ),
        true,
      );
      expect(
        TraitFinder.isTarget(
          const TargetId(type: Container),
          Container(),
        ),
        true,
      );
      expect(
        TraitFinder.isTarget(
          const TargetId(key: Key('TEST'), type: Container),
          Container(key: const Key('TEST')),
        ),
        true,
      );

      // Not matching
      expect(
        TraitFinder.isTarget(
          const TargetId(key: Key('TEST')),
          Container(key: const Key('TEST0')),
        ),
        false,
      );
      expect(
        TraitFinder.isTarget(
          const TargetId(type: SizedBox),
          Container(),
        ),
        false,
      );
      expect(
        TraitFinder.isTarget(
          const TargetId(key: Key('TEST'), type: Container),
          Container(key: const Key('TEST0')),
        ),
        false,
      );
      expect(
        TraitFinder.isTarget(
          const TargetId(key: Key('TEST'), type: SizedBox),
          Container(key: const Key('TEST')),
        ),
        false,
      );
      expect(
        TraitFinder.isTarget(
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
        TraitFinder.getTarget(
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
        TraitFinder.getTarget(
          WidgetTrait(targetId: const TargetId(key: Key('TEST'))),
          tester: tester,
        ),
        isNotNull,
      );
      expect(
        TraitFinder.getTarget(
          WidgetTrait(targetId: const TargetId(type: Container)),
          tester: tester,
        ),
        isNotNull,
      );
      expect(
        TraitFinder.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST'), type: Container),
          ),
          tester: tester,
        ),
        isNotNull,
      );

      // Not matching
      expect(
        () => TraitFinder.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST0')),
          ),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitFinder.getTarget(
          WidgetTrait(targetId: const TargetId(type: SizedBox)),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitFinder.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST0'), type: Container),
          ),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitFinder.getTarget(
          WidgetTrait(
            targetId: const TargetId(key: Key('TEST'), type: SizedBox),
          ),
          tester: tester,
        ),
        throwsStateError,
      );
      expect(
        () => TraitFinder.getTarget(
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
        TraitFinder.findAncestorOf(trait, ancestorId: '1'),
        isNotNull,
      );

      // Non ancestor

      // Other root
      expect(
        TraitFinder.findAncestorOf(trait, ancestorId: '2'),
        isNull,
      );

      // Self
      expect(
        TraitFinder.findAncestorOf(trait, ancestorId: '1.0.0'),
        isNull,
      );

      // Unknown
      expect(
        TraitFinder.findAncestorOf(trait, ancestorId: 'x'),
        isNull,
      );

      // From root ancestor

      final rootAncestor = rootTraits[1];

      // Self
      expect(
        TraitFinder.findAncestorOf(rootAncestor, ancestorId: '1'),
        isNull,
      );
      // Descendant
      expect(
        TraitFinder.findAncestorOf(rootAncestor, ancestorId: '1.0'),
        isNull,
      );
      // Other root descendant
      expect(
        TraitFinder.findAncestorOf(rootAncestor, ancestorId: '2.0'),
        isNull,
      );
    });

    test('findRootAncestorOf', () {
      expect(
        TraitFinder.findRootAncestorOf(rootTraits[0]),
        isNull,
      );
      expect(
        TraitFinder.findRootAncestorOf(
          rootTraits[1].descendants[0].descendants[0],
        ),
        rootTraits[1],
      );
      expect(
        TraitFinder.findRootAncestorOf(rootTraits[2].descendants[0]),
        rootTraits[2],
      );
    });

    test('findDescendantOf', () {
      final trait = rootTraits[1].descendants[0];

      // Descendant
      expect(
        TraitFinder.findDescendantOf(trait, descendantId: '1.0.0'),
        isNotNull,
      );

      // Non descendant

      // Root ancestor
      expect(
        TraitFinder.findDescendantOf(trait, descendantId: '1'),
        isNull,
      );
      // Other root
      expect(
        TraitFinder.findDescendantOf(trait, descendantId: '2'),
        isNull,
      );
      // Other root descendant
      expect(
        TraitFinder.findDescendantOf(trait, descendantId: '2.0'),
        isNull,
      );
      // Self
      expect(
        TraitFinder.findDescendantOf(trait, descendantId: '1.0'),
        isNull,
      );

      // Unknown
      expect(
        TraitFinder.findDescendantOf(trait, descendantId: 'x'),
        isNull,
      );
    });

    test('findUnrelated', () {
      final trait = rootTraits[1].descendants[0];

      // Related

      // Root parent
      expect(
        TraitFinder.findUnrelated(
          trait,
          traitId: '1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Sibling
      expect(
        TraitFinder.findUnrelated(
          trait,
          traitId: '1.1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Self
      expect(
        TraitFinder.findUnrelated(
          trait,
          traitId: '1.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Descendant
      expect(
        TraitFinder.findUnrelated(
          trait,
          traitId: '1.0.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );

      // Unrelated

      // Other root
      expect(
        TraitFinder.findUnrelated(
          trait,
          traitId: '2',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );
      // Other root descendant
      expect(
        TraitFinder.findUnrelated(
          trait,
          traitId: '2.0',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );

      // Unknown
      expect(
        TraitFinder.findUnrelated(trait, traitId: 'x', rootTraits: rootTraits),
        isNull,
      );

      // From root ancestor

      final rootAncestor = rootTraits[1];

      // Self
      expect(
        TraitFinder.findUnrelated(
          rootAncestor,
          traitId: '1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Descendant
      expect(
        TraitFinder.findUnrelated(
          rootAncestor,
          traitId: '1.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Other root descendant
      expect(
        TraitFinder.findUnrelated(
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
        TraitFinder.findNonIntersecting(
          trait,
          traitId: '1',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Descendant
      expect(
        TraitFinder.findNonIntersecting(
          trait,
          traitId: '1.0.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );
      // Self
      expect(
        TraitFinder.findNonIntersecting(
          trait,
          traitId: '1.0',
          rootTraits: rootTraits,
        ),
        isNull,
      );

      // Non intersecting

      // Far sibling
      expect(
        TraitFinder.findNonIntersecting(
          trait,
          traitId: '1.1.0',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );
      // Other root
      expect(
        TraitFinder.findNonIntersecting(
          trait,
          traitId: '2',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );
      // Other root descendant
      expect(
        TraitFinder.findNonIntersecting(
          trait,
          traitId: '2.0',
          rootTraits: rootTraits,
        ),
        isNotNull,
      );

      // Unknown
      expect(
        TraitFinder.findNonIntersecting(
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
        TraitFinder.findTrait(traitId: '1', rootTraits: rootTraits),
        isNotNull,
      );
      expect(
        TraitFinder.findTrait(traitId: '1.1.0.0', rootTraits: rootTraits),
        isNotNull,
      );
      expect(
        TraitFinder.findTrait(traitId: '2.0', rootTraits: rootTraits),
        isNotNull,
      );

      // Unkown
      expect(
        TraitFinder.findTrait(traitId: 'x', rootTraits: rootTraits),
        isNull,
      );
    });
  });
}
