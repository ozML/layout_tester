![Tests](https://github.com/ozML/layout_tester/actions/workflows/test.yml/badge.svg)

This helper package provides an easy interface for layout and widget composition testing.



## Installing

It is build atop of `WidgetTester` from the *flutter_test* SDK package and is therefore  meant to be used only in context of widget tests.

**The package has therefor to be added as dev dependency.**

```console
 $ flutter pub add --dev layout_tester
```

For general information about testing see
- [Testing Flutter apps](https://docs.flutter.dev/testing)
- [Widget tests](https://docs.flutter.dev/testing#widget-tests) 

# Overview

The class `LayoutTester` is the central unit of the package. It provides the method `testLayout`, which is used to run the tests and expects a set of data in form of `WidgetTrait`s as input. These are representations of widgets in the widget tree and are used to formulate assertions regarding layout specific properties.

__Note__
The free method `testLayout` can be used as shorthand to make the call to an implicit instance of `LayoutTester`.

## Data structures

- `WidgetTrait`

    Represents a specific widget in the widget tree, which is identified by the `targetId` property. It is used among others to define assertions for this target widget.

- `TargetId`

    Identifies a widget target in the widget tree and is primarily used by `WidgetTrait`. The target can be either identified by type, or by key or both. Additionally a custom delimiter can be defined.

- `PositionAssert`

    Used to make an assertion about the position of the target widget.

- `SizeAssert`

    Used to make an assertion about the size of the target widget.

- `RelationAssert`

    Used to make an assertion regarding the comparison of a property of the target widget with a specified value.

- `RelativePositionAssert`

    Used to make an assertion about the position of the target widget in relation to a specific subject.

- `RelativeSizeAssert`

    Used to make an assertion about the size of the target widget in relation to another one.

- `CustomTraitAssert`

    Template for the creation of custom assertions.

## Abbreviations

The assertion classes provide different constructors to initialize them with the required properties. Beside of this classical way, there are also short hand generator functions for the most of the existing scenarios.

To access those, include the [assertion_factory](https://pub.dev/documentation/layout_tester/latest/assertion_factory/assertion_factory-library.html) library from the package.


For further info on the general library API see the [documentation](https://pub.dev/documentation/layout_tester/latest/layout_tester/layout_tester-library.html).


# Usage

## Defining target widget

To define a widget to test against, the `TargetId` class is used in combination with `WidgetTrait`. `TargetId` combines different properties to an unique identifier, which is converted into a `WidgetFinder` internally. If the search results in multiple found elements, the `elementIndex` field can be defined to choose one out of the collection. It corresponds to the finders `.at` method.

```dart
// Default ID constructor. At least one parameter must be set.
const TargetId(type: Container, key: Key('#'), elementIndex: 0)

// Custom ID.
const TargetId.custom(
    (widget) => widget is Container && widget.key == Key('#'),
    elementIndex:0,
)
```

### Search context

Without further measure, the search context defaults to the whole screen. This means the target widget is searched in the set of all available widgets on the screen. This can be limited by naming an **existing** parent widget by specifying parent traits. The search context is then limited to this parent and consequently only widgets contained by it are considered.

**Note**

The parent does not have to be the direct parent of the target widget.

```dart
// Widget tree
await tester.pumpWidget(
    Row(
        children: [
            SizedBox(width: 300),
            Expanded(
                child: Center(
                    // Target
                    child: SizedBox(width: 50, height: 50),
                ),
            ),
        ],
    ),
);

// Specify target without parent context.
testLayout(
    tester,
    {
        // Element index is required.
        WidgetTrait(
            targetId: const TargetId(type: SizedBox, elementIndex: 1),
        ),
    },
);

// Specify target with parent context.
testLayout(
    tester,
    {
        // Parent
        WidgetTrait(
            targetId: const TargetId(type: Expanded),
            descendants: [
                // No element index needed due to unique parent context.
                WidgetTrait(targetId: const TargetId(type: SizedBox)),
            ],
        ),
    }
);
```

## Defining test criteria

The test criteria for a widget are specified by adding `TraitAsserts` into the `asserts` list parameter of `WidgetTrait`. They are then applied on the target widget of that trait.

There is a list of predefined assertions, but it is also possible to create a custom one using the `CustomTraitAssert` sub class.

### General assertions

Those only involve the containig trait and thus the only the target widget.

Examples: `PositionAssert`, `SizeAssert`, `RelationAssert`

### Relative assertions

Those are relative to another referred trait (therefore implicit to another widget). The referred trait must specify the `id` property, while the referring trait must define the `traitId` property.

Examples: `RelativePositionAssert`, `RelativeSizeAssert`

```dart
testLayout(
    tester,
    {
        // Referred trait
        WidgetTrait(
            // 
            id: 'trait0',
            targetId: const TargetId(key: Key('#')),
        ),

        // Referring trait
        WidgetTrait(
            targetId: const TargetId(type: Text),
            asserts: [
                RelativePositionAssert.target(
                    traitId: 'trait0',
                    left: 25,
                )
            ],
        )
    },
);
```

## Advanced

Defining criteria for layout tests is as simple as modeling a tree based on the widget tree, but only consider the elements of relevance.

**Example**:
```dart
testWidgets('example', (tester) async {
    await tester.pumpWidget(
        // Element 1
        Container(
            // Element 2
            child: Center(
                // Element 3
                child: Container(
                    key: const Key('e2'),
                    width: 500,
                    height: 500,
                    // Element 4
                    child: Center(
                        // Element 5
                        child: Container(width: 50, height: 50),
                    ),
                ),
            ),
        ),
    );

    testLayout(
        tester,
        {
            // Describes element 1, but defines no assertions.
            WidgetTrait(
                targetId: const TargetId(type: Container, elementIndex: 0),
                descendants: [
                    // Describes element 3, but defines no assertions.
                    WidgetTrait(
                        id: 'e2',
                        targetId: const TargetId(key: Key('e2')),
                        descendants: [
                            // Describes element 5 with assertions.
                            WidgetTrait(
                                targetId: const TargetId(type: Container),
                                asserts: const [
                                    // Element 5 has to be dimension 50x50.
                                    SizeAssert.symmetric(50),

                                    // Element 5 has to be the 0.1 of the size of
                                    // element 'e1' (Element 1).
                                    RelativeSizeAssert.symmetric(
                                        traitId: 'e2',
                                        0.1,
                                    ),
                                ],
                            ),
                        ],
                    ),
                ],
            ),
        },
    );
});
```

As you can see the test data structure resembles the widget tree in some way.This structuring is not mandatory, but enables the layout tester to recognize hierarchal order of the widgets and in some constellations allows to omit details.

In the example above for instance, for the trait of element 1 the attribute `elementIndex` must be used to identify the widget exactly, because there are multiple instances of Container in the tree, what makes it impossile for the tester to know which to consider. For element 5 on the other hand, no index is required, as its hierarchal position as sub element of two other Containers  is already sufficient.

If the traits for the parents of an element do not define assertions, a shorthand notation can be used to create the elements.

**Example**

```dart
testLayout(
    tester,
    {
        // Element 5
        WidgetTrait.withParents(
            // Defines parent IDs, which are converted to trait hierarchy.
            // First is direct parent, last is root/top parent.
            const [
                // Represents element 3
                ComposeTargetId(type: Container, elementIndex: 0),
                // Represents element 1
                ComposeTargetId(key: Key('e2'), traitId: 'e2'),
            ],
            targetId: const TargetId(type: Container),
            asserts: const [
                // Element 5 has to be dimension 50x50.
                SizeAssert.symmetric(50),
                
                // Element 5 has to be the 0.1 of the size of
                // element'e1' (Element 1).
                const RelativeSizeAssert.symmetric(
                    traitId: 'e2',
                    0.1,
                ),
            ],
        ),
    },
);


