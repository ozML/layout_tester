This helper package provides an easy interface for layout and widget composition testing. This is done by composing a set of assertions for specific layout criteria, which are subject of the tests. These are represented by corresponding meta data objects. The resulting test meta data structure can be modeled as a tree and resembles as such a widget tree.

It is build atop of *flutter_test* `WidgetTester` and is therefore  meant to be used only in context of widget tests.

# Overview

The class `LayoutTester` is the central unit of the package, which is used to process the declared test meta data. The meta data is represented by `WidgetTrait` objects and the related properties. These are passed as a set into the method, with each entry within it  representing the root of a tree.

```dart
class LayoutTester {
  void testLayout(Set<WidgetTrait> traits)
}
```

## Data structures

- `WidgetTrait`

    Describes a specific element in the widget tree. This `target` element is identified by an identifier in form of `TargetId` which is mandatory. A trait can also be set as a descendant of another trait. This way the hierarchical structure can be concretized and therefore the set of potential search results narrowed down. The tester uses all this information and tries to find the described element within the widget tree.

    In addition to the described purpose of search criteria definition, the widget trait is also used to specify the criteria for the layout tests, which are then applied on the target widget. These criteria can be specified with the asserts property.

- `TargetId`

    Identifies a widget target in the widget tree and is primarily used by `WidgetTrait`. The target can be either identified by type, or by key or both. An element index can additionally be provided, if these information doesn't suffice to narrow it down to a single element.

- `PositionAssert`

    Used to make an assertion about the position of the target widget.

    **Note:** A trait can have only one positional assertion.

- `SizeAssert`

    Used to make an assertion about the size of the target widget.

    **Note:** A trait can have only one dimensional assertion.

- `RelativePositionAssert`

    Used to make an assertion about the position of the target widget in relation to another one. There can be multiple instances of this defined in a trait.

- `RelativeSizeAssert`

    Used to make an assertion about the size of the target widget in relation to another one. There can be multiple instances of this defined in a trait.

- `CustomTraitAssert`

    Template for the creation of custom assertions.
    A trait can have multiple custom assertions.


# Usage

Defining criteria for layout tests is as simple as modeling a tree based on the logical widget tree, but only consider the elements of relevance.

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
                                    SizeAssert.WH(50, 50),

                                    // Element 5 has to be the 0.1 of the size of element 'e1' (Element 1).
                                    RelativeSizeAssert(
                                        traitId: 'e2',
                                        percentageWidth: 0.1,
                                        percentageHeight: 0.1,
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

As you can see the test data structure resembles the widget tree in such way, that it mimics the structure of the relevant parts in it. This structuring is not mandatory, but enables the layout tester to recognize hierarchal order of the widgets and in some constellations allows to omit details. In the example above for instance it can be seen, that for the trait of element 1 the attribute `elementIndex` must be used to identify the widget exactly, because there are multiple instances of Container in the tree, what makes it impossile for the tester to know which is meant. For element 5 on the other hand, no index is required, as its hierarchal position as sub element of two other Containers  is already sufficient.

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
                SizeAssert.WH(50, 50),
                
                // Element 5 has to be the 0.1 of the size of element'e1' (Element 1).
                const RelativeSizeAssert(
                    traitId: 'e2',
                    percentageWidth: 0.1,
                    percentageHeight: 0.1,
                ),
            ],
        ),
    },
);

```

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

Without further measure, the search context defaults to the whole screen. This means the target widget is searched in the set of all available widgets on the screen. This can be limited by naming an **existing** parent widgets by specifying parent traits. The search context is then limited to this parent and consequently only
widgets contained by it are considered.

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

The test criteria for a widget are specified with by adding `TraitAsserts` into the `asserts` list parameter of `WidgetTrait`. They are then applied on the target widget of that trait.

There is a list of predefined assertions, but it is also possible to create a custom one using the `CustomTraitAssert` sub class.

### Global assertions

Those are relative to the global context (whole screen).

Examples: `PositionAssert`, `SizeAssert`

### Relative assertions

Those are relative to another referred trait (therefore implicit to the other widget). The referred trait must specify the `id` property, while the referring trait must define the `traitId` property.

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
                RlativePositionAssert(
                    traitId: 'trait0',
                    leftDistance: 25,
                )
            ],
        )
    },
);
```




