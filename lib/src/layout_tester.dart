import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

import 'extensions.dart';
import 'value_pair.dart';
import 'exceptions.dart';
import 'trait_assert/assert.dart';
import 'widget_trait.dart';
import 'utils.dart';
import 'trait_helper.dart';

/// Runs the layout test logic without the need to create a [LayoutTester]
/// manually.
void testLayout(ft.WidgetTester tester, Set<WidgetTrait> traits) =>
    LayoutTester(tester).testLayout(traits);

class LayoutTester {
  /// Creates an instance of [LayoutTester].
  const LayoutTester(this.tester);

  /// Widget tester used with this instance.
  final ft.WidgetTester tester;

  /// Returns the size of the screen.
  Size getScreenSize() =>
      tester.binding.window.physicalSize /
      tester.binding.window.devicePixelRatio;

  /// Runs the layout test logic.
  void testLayout(Set<WidgetTrait> traits) =>
      _traverseAndTest(rootTraits: traits.toList());

  void _traverseAndTest({
    required List<WidgetTrait> rootTraits,
    List<WidgetTrait>? currentTraits,
  }) {
    final traits = currentTraits ?? rootTraits;
    for (final trait in traits) {
      final target = TraitHelper.getTarget(trait, tester: tester);
      final bounds = tester.getRect(ft.find.byWidget(target));

      final position = trait.asserts.whereType<PositionAssert>().singleOrEmpty;
      if (position != null) {
        testPosition(trait.targetId, bounds, position);
      }

      final size = trait.asserts.whereType<SizeAssert>().singleOrEmpty;
      if (size != null) {
        testSize(trait.targetId, bounds.size, size);
      }

      for (final tAssert in trait.asserts) {
        if (tAssert is RelativePositionAssert) {
          if (atLeastOne(tAssert.getLTRB())) {
            if (tAssert.refersTo == PositionReference.target) {
              final compareTrait = TraitHelper.findNonIntersecting(
                trait,
                traitId: tAssert.traitId,
                rootTraits: rootTraits,
              );
              if (compareTrait == null) {
                throw UnknowWidgetTraitException(traitId: trait.id);
              }

              final compareTarget = TraitHelper.getTarget(
                compareTrait,
                tester: tester,
              );
              final compareBounds = tester.getRect(
                ft.find.byWidget(compareTarget),
              );

              testRelativePosition(
                trait.targetId,
                bounds,
                compareBounds,
                tAssert,
              );
            } else if (tAssert.refersTo == PositionReference.parent ||
                tAssert.refersTo == PositionReference.parentBounds) {
              final ancestor = TraitHelper.findAncestorOf(
                trait,
                ancestorId: tAssert.traitId,
              );
              if (ancestor == null) {
                throw UnknowWidgetTraitException.forAncestor(
                  trait.id,
                  ancestorId: tAssert.traitId,
                );
              }

              final ancestorTarget = TraitHelper.getTarget(
                ancestor,
                tester: tester,
              );
              final ancestorBounds = tester.getRect(
                ft.find.byWidget(ancestorTarget),
              );
              final relativeBounds = Rect.fromLTWH(
                bounds.left - ancestorBounds.left,
                bounds.top - ancestorBounds.top,
                bounds.width,
                bounds.height,
              );

              // testPosition(trait.targetId, target, relativeBounds, tAssert);
              testRelativePosition(
                trait.targetId,
                relativeBounds,
                ancestorBounds,
                tAssert,
              );
            } else if (tAssert.refersTo == PositionReference.globalBounds) {
              testRelativePosition(
                trait.targetId,
                bounds,
                Offset.zero & getScreenSize(),
                tAssert,
              );
            }
          }
        }

        if (tAssert is RelativeSizeAssert) {
          final compareTrait = TraitHelper.findTrait(
            traitId: tAssert.traitId,
            rootTraits: rootTraits,
          );
          if (compareTrait == null) {
            throw UnknowWidgetTraitException(traitId: trait.id);
          }

          final compareTarget = TraitHelper.getTarget(
            compareTrait,
            tester: tester,
          );
          final compareSize = tester.getSize(ft.find.byWidget(compareTarget));

          testRelativeSize(trait.targetId, bounds.size, compareSize, tAssert);
        }

        if (tAssert is CustomTraitAssert) {
          WidgetTrait? compareTrait;
          Rect? compareBounds;

          final traitId = tAssert.traitId;
          if (traitId != null) {
            compareTrait = TraitHelper.findTrait(
              traitId: traitId,
              rootTraits: rootTraits,
            );
            if (compareTrait == null) {
              throw UnknowWidgetTraitException(traitId: trait.id);
            }

            compareBounds = tester.getRect(
              ft.find.byWidget(
                TraitHelper.getTarget(compareTrait, tester: tester),
              ),
            );
          }

          tAssert.test(
            trait,
            bounds,
            getScreenSize(),
            compareTrait,
            compareBounds,
          );
        }
      }

      _traverseAndTest(
        rootTraits: rootTraits,
        currentTraits: trait.descendants,
      );
    }
  }

  /// Tests the position of the provided widget.
  ///
  /// The position rectangle of the widget is provided as [targetBounds].
  void testPosition(
    TargetId targetId,
    Rect targetBounds,
    PositionAssert assertion,
  ) {
    final left = assertion.left;
    DoublePair? leftFail;
    if (left != null && left != targetBounds.left) {
      leftFail = DoublePair(targetBounds.left, left);
    }

    final top = assertion.top;
    DoublePair? topFail;
    if (top != null && top != targetBounds.top) {
      topFail = DoublePair(targetBounds.top, top);
    }

    final right = assertion.right;
    DoublePair? rightFail;
    if (right != null && right != targetBounds.right) {
      rightFail = DoublePair(targetBounds.right, right);
    }

    final bottom = assertion.bottom;
    DoublePair? bottomFail;
    if (bottom != null && bottom != targetBounds.bottom) {
      bottomFail = DoublePair(targetBounds.bottom, bottom);
    }

    if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
      throw AssertionFailedException.forPosition(
        targetId: targetId,
        left: leftFail,
        top: topFail,
        right: rightFail,
        bottom: bottomFail,
      );
    }
  }

  /// Tests the size of the provided widget.
  ///
  /// The size of the widget is provided as [targetSize].
  void testSize(
    TargetId targetId,
    Size targetSize,
    SizeAssert assertion,
  ) {
    final width = assertion.width;
    DoublePair? widthFail;
    if (width != null && width != targetSize.width) {
      widthFail = DoublePair(targetSize.width, width);
    }

    final height = assertion.height;
    DoublePair? heightFail;
    if (height != null && height != targetSize.height) {
      heightFail = DoublePair(targetSize.height, height);
    }

    if (atLeastOne([widthFail, heightFail])) {
      throw AssertionFailedException.forSize(
        targetId: targetId,
        width: widthFail,
        height: heightFail,
      );
    }
  }

  /// Tests the position of the provided widget relative to another element
  /// position.
  ///
  /// The position rectangle of the widget is provided as [targetBounds],
  /// the position to compare to as [refBounds].
  void testRelativePosition(
    TargetId targetId,
    Rect targetBounds,
    Rect refBounds,
    RelativePositionAssert assertion,
  ) {
    final left = assertion.left;
    final top = assertion.top;
    final right = assertion.right;
    final bottom = assertion.bottom;

    DoublePair? leftFail;
    DoublePair? topFail;
    DoublePair? rightFail;
    DoublePair? bottomFail;

    if (assertion.refersTo == PositionReference.target) {
      if (left != null && left != targetBounds.left - refBounds.right) {
        leftFail = DoublePair(targetBounds.left - refBounds.right, left);
      }

      if (top != null && top != targetBounds.top - refBounds.bottom) {
        topFail = DoublePair(targetBounds.top - refBounds.bottom, top);
      }

      if (right != null && right != refBounds.left - targetBounds.right) {
        rightFail = DoublePair(refBounds.left - targetBounds.right, right);
      }

      if (bottom != null && bottom != refBounds.top - targetBounds.bottom) {
        bottomFail = DoublePair(refBounds.top - targetBounds.bottom, bottom);
      }

      if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
        throw AssertionFailedException.forRelativePosition(
          targetId: targetId,
          leftDistance: leftFail,
          topDistance: topFail,
          rightDistance: rightFail,
          bottomDistance: bottomFail,
        );
      }
    } else if (assertion.refersTo == PositionReference.parent) {
      if (left != null && left != targetBounds.left) {
        leftFail = DoublePair(targetBounds.left, left);
      }
      if (top != null && top != targetBounds.top) {
        topFail = DoublePair(targetBounds.top, top);
      }
      if (right != null && right != targetBounds.right) {
        rightFail = DoublePair(targetBounds.right, right);
      }
      if (bottom != null && bottom != targetBounds.bottom) {
        bottomFail = DoublePair(targetBounds.bottom, bottom);
      }

      if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
        throw AssertionFailedException.forPosition(
          targetId: targetId,
          left: leftFail,
          top: topFail,
          right: rightFail,
          bottom: bottomFail,
        );
      }
    } else if (assertion.refersTo == PositionReference.parentBounds ||
        assertion.refersTo == PositionReference.globalBounds) {
      if (left != null && left != targetBounds.left) {
        leftFail = DoublePair(targetBounds.left, left);
      }

      if (top != null && top != targetBounds.top) {
        topFail = DoublePair(targetBounds.top, top);
      }

      if (right != null && right != refBounds.width - targetBounds.right) {
        rightFail = DoublePair(refBounds.width - targetBounds.right, right);
      }

      if (bottom != null && bottom != refBounds.height - targetBounds.bottom) {
        bottomFail = DoublePair(refBounds.height - targetBounds.bottom, bottom);
      }

      if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
        throw AssertionFailedException.forRelativePosition(
          targetId: targetId,
          leftDistance: leftFail,
          topDistance: topFail,
          rightDistance: rightFail,
          bottomDistance: bottomFail,
        );
      }
    }
  }

  /// Tests the size of the provided widget relative to another element size.
  ///
  /// The size of the widget is provided as [targetSize], the size to compare to
  /// as [compareSize].
  void testRelativeSize(
    TargetId targetId,
    Size targetSize,
    Size compareSize,
    RelativeSizeAssert assertion,
  ) {
    final pWidth = assertion.width;
    DoublePair? widthFail;
    if (pWidth != null && pWidth != targetSize.width / compareSize.width) {
      widthFail = DoublePair(targetSize.width / compareSize.width, pWidth);
    }

    final pHeight = assertion.height;
    DoublePair? heightFail;
    if (pHeight != null && pHeight != targetSize.height / compareSize.height) {
      heightFail = DoublePair(targetSize.height / compareSize.height, pHeight);
    }

    if (atLeastOne([widthFail, heightFail])) {
      throw AssertionFailedException.forRelativeSize(
        targetId: targetId,
        pWidth: widthFail,
        pHeight: heightFail,
      );
    }
  }
}
