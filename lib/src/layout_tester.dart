import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

import 'extensions.dart';
import 'value_pair.dart';
import 'exceptions.dart';
import 'trait_assert.dart';
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

      final position = trait.asserts
          .whereType<PositionAssert>()
          .where((element) => element is! RelativePositionAssert)
          .singleOrEmpty;
      if (position != null) {
        testPosition(trait.targetId, target, bounds, position);
      }

      final size = trait.asserts
          .whereType<SizeAssert>()
          .where((element) => element is! RelativeSizeAssert)
          .singleOrEmpty;
      if (size != null) {
        testSize(trait.targetId, target, bounds.size, size);
      }

      for (final tAssert in trait.asserts) {
        if (tAssert is RelativePositionAssert) {
          if (atLeastOne(tAssert.getLTRB())) {
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

            testPosition(trait.targetId, target, relativeBounds, tAssert);
          }

          if (atLeastOne(tAssert.getRelativeLTRB())) {
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
              target,
              bounds,
              compareBounds,
              tAssert,
            );
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

          testRelativeSize(
            trait.targetId,
            target,
            bounds.size,
            compareSize,
            tAssert,
          );
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
    Widget target,
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
    Widget target,
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
  /// the position to compare to as [compareBounds].
  void testRelativePosition(
    TargetId targetId,
    Widget target,
    Rect targetBounds,
    Rect compareBounds,
    RelativePositionAssert assertion,
  ) {
    final leftDistance = assertion.leftDistance;
    DoublePair? leftDistanceFail;
    if (leftDistance != null &&
        leftDistance != targetBounds.left - compareBounds.right) {
      leftDistanceFail = DoublePair(
        targetBounds.left - compareBounds.right,
        leftDistance,
      );
    }

    final topDistance = assertion.topDistance;
    DoublePair? topDistanceFail;
    if (topDistance != null &&
        topDistance != targetBounds.top - compareBounds.bottom) {
      topDistanceFail = DoublePair(
        targetBounds.top - compareBounds.bottom,
        topDistance,
      );
    }

    final rightDistance = assertion.rightDistance;
    DoublePair? rightDistanceFail;
    if (rightDistance != null &&
        rightDistance != compareBounds.left - targetBounds.right) {
      rightDistanceFail = DoublePair(
        compareBounds.left - targetBounds.right,
        rightDistance,
      );
    }

    final bottomDistance = assertion.bottomDistance;
    DoublePair? bottomDistanceFail;
    if (bottomDistance != null &&
        bottomDistance != compareBounds.top - targetBounds.bottom) {
      bottomDistanceFail = DoublePair(
        compareBounds.top - targetBounds.bottom,
        bottomDistance,
      );
    }

    if (atLeastOne([
      leftDistanceFail,
      topDistanceFail,
      rightDistanceFail,
      bottomDistanceFail,
    ])) {
      throw AssertionFailedException.forRelativePosition(
        targetId: targetId,
        leftDistance: leftDistanceFail,
        topDistance: topDistanceFail,
        rightDistance: rightDistanceFail,
        bottomDistance: bottomDistanceFail,
      );
    }
  }

  /// Tests the size of the provided widget relative to another element size.
  ///
  /// The size of the widget is provided as [targetSize], the size to compare to
  /// as [compareSize].
  void testRelativeSize(
    TargetId targetId,
    Widget target,
    Size targetSize,
    Size compareSize,
    RelativeSizeAssert assertion,
  ) {
    final pWidth = assertion.percentageWidth;
    DoublePair? pWidthFail;
    if (pWidth != null && pWidth != targetSize.width / compareSize.width) {
      pWidthFail = DoublePair(targetSize.width / compareSize.width, pWidth);
    }

    final pHeight = assertion.percentageHeight;
    DoublePair? pHeightFail;
    if (pHeight != null && pHeight != targetSize.height / compareSize.height) {
      pHeightFail = DoublePair(targetSize.height / compareSize.height, pHeight);
    }

    if (atLeastOne([pWidthFail, pHeightFail])) {
      throw AssertionFailedException.forRelativeSize(
        targetId: targetId,
        pWidth: pWidthFail,
        pHeight: pHeightFail,
      );
    }
  }
}
