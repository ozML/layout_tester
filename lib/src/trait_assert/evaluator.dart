import 'dart:ui';
import 'package:flutter_test/flutter_test.dart' as ft;

import 'package:layout_tester/src/exceptions.dart';
import 'package:layout_tester/src/trait_finder.dart';
import 'package:layout_tester/src/utils.dart';
import 'package:layout_tester/src/value_pair.dart';
import 'package:layout_tester/src/widget_trait.dart';

import 'assert.dart';

/// Conains evaluation logic for [PositionAssert].
class PositionEvaluator {
  PositionEvaluator._();

  /// Evaluates [traitAssert].
  static void evaluate(
    ft.WidgetTester tester,
    PositionAssert traitAssert,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetBounds = tester.getRect(ft.find.byWidget(target));

    final left = traitAssert.left;
    DoublePair? leftFail;
    if (left != null && left != targetBounds.left) {
      leftFail = DoublePair(targetBounds.left, left);
    }

    final top = traitAssert.top;
    DoublePair? topFail;
    if (top != null && top != targetBounds.top) {
      topFail = DoublePair(targetBounds.top, top);
    }

    final right = traitAssert.right;
    DoublePair? rightFail;
    if (right != null && right != targetBounds.right) {
      rightFail = DoublePair(targetBounds.right, right);
    }

    final bottom = traitAssert.bottom;
    DoublePair? bottomFail;
    if (bottom != null && bottom != targetBounds.bottom) {
      bottomFail = DoublePair(targetBounds.bottom, bottom);
    }

    if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
      throw AssertionFailedException.forPosition(
        targetId: trait.targetId,
        left: leftFail,
        top: topFail,
        right: rightFail,
        bottom: bottomFail,
      );
    }
  }
}

/// Contains evaluation logic for [SizeAssert].
class SizeEvaluator {
  SizeEvaluator._();

  /// Evaluates [traitAssert].
  static void evaluate(
    ft.WidgetTester tester,
    SizeAssert traitAssert,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetSize = tester.getSize(ft.find.byWidget(target));

    final width = traitAssert.width;
    DoublePair? widthFail;
    if (width != null && width != targetSize.width) {
      widthFail = DoublePair(targetSize.width, width);
    }

    final height = traitAssert.height;
    DoublePair? heightFail;
    if (height != null && height != targetSize.height) {
      heightFail = DoublePair(targetSize.height, height);
    }

    if (atLeastOne([widthFail, heightFail])) {
      throw AssertionFailedException.forSize(
        targetId: trait.targetId,
        width: widthFail,
        height: heightFail,
      );
    }
  }
}

/// Contains evaluation logic for [RelationAssert].
class RelationEvaluator {
  RelationEvaluator._();

  /// Evaluates [traitAssert].
  static void evaluate(
    ft.WidgetTester tester,
    RelationAssert traitAssert,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetBounds = tester.getRect(ft.find.byWidget(target));

    final success = traitAssert.action(targetBounds, traitAssert.value);
    if (!success) {
      throw AssertionFailedException.forRelation(
        targetId: trait.targetId,
        relation: traitAssert.relation,
        targetBounds: targetBounds,
        compareValue: traitAssert.value,
      );
    }
  }
}

/// Contains evaluation logic for [RelativePositionAssert].
class RelativePositionEvaluator {
  RelativePositionEvaluator._();

  /// Evaluates [traitAssert].
  static void evaluate(
    ft.WidgetTester tester,
    RelativePositionAssert traitAssert,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) {
    if (atLeastOne(traitAssert.getLTRB())) {
      if (traitAssert.refersTo == PositionReference.target) {
        _evaluateTarget(tester, traitAssert, trait, rootTraits);
      } else if (traitAssert.refersTo == PositionReference.parent) {
        _evaluateParent(tester, traitAssert, trait);
      } else if (traitAssert.refersTo == PositionReference.parentBounds) {
        _evaluateParentBounds(tester, traitAssert, trait);
      } else if (traitAssert.refersTo == PositionReference.globalBounds) {
        _evaluateGlobalBounds(tester, traitAssert, trait);
      }
    }
  }

  static void _evaluateTarget(
    ft.WidgetTester tester,
    RelativePositionAssert traitAssert,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetBounds = tester.getRect(ft.find.byWidget(target));

    final refTrait = TraitFinder.findNonIntersecting(
      trait,
      traitId: traitAssert.traitId,
      rootTraits: rootTraits,
    );
    if (refTrait == null) {
      throw UnknowWidgetTraitException(traitId: traitAssert.traitId);
    }

    final refTarget = TraitFinder.getTarget(refTrait, tester: tester);
    final refBounds = tester.getRect(ft.find.byWidget(refTarget));

    final left = traitAssert.left;
    DoublePair? leftFail;
    if (left != null && left != targetBounds.left - refBounds.right) {
      leftFail = DoublePair(targetBounds.left - refBounds.right, left);
    }

    final top = traitAssert.top;
    DoublePair? topFail;
    if (top != null && top != targetBounds.top - refBounds.bottom) {
      topFail = DoublePair(targetBounds.top - refBounds.bottom, top);
    }

    final right = traitAssert.right;
    DoublePair? rightFail;
    if (right != null && right != refBounds.left - targetBounds.right) {
      rightFail = DoublePair(refBounds.left - targetBounds.right, right);
    }

    final bottom = traitAssert.bottom;
    DoublePair? bottomFail;
    if (bottom != null && bottom != refBounds.top - targetBounds.bottom) {
      bottomFail = DoublePair(refBounds.top - targetBounds.bottom, bottom);
    }

    if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
      throw AssertionFailedException.forRelativePosition(
        targetId: trait.targetId,
        leftDistance: leftFail,
        topDistance: topFail,
        rightDistance: rightFail,
        bottomDistance: bottomFail,
      );
    }
  }

  static void _evaluateParent(
    ft.WidgetTester tester,
    RelativePositionAssert traitAssert,
    WidgetTrait trait,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetBounds = tester.getRect(ft.find.byWidget(target));
    final ancestorBounds = _getAncestorBounds(tester, traitAssert, trait);
    final localBounds = Rect.fromLTWH(
      targetBounds.left - ancestorBounds.left,
      targetBounds.top - ancestorBounds.top,
      targetBounds.width,
      targetBounds.height,
    );

    final left = traitAssert.left;
    DoublePair? leftFail;
    if (left != null && left != localBounds.left) {
      leftFail = DoublePair(localBounds.left, left);
    }

    final top = traitAssert.top;
    DoublePair? topFail;
    if (top != null && top != localBounds.top) {
      topFail = DoublePair(localBounds.top, top);
    }

    final right = traitAssert.right;
    DoublePair? rightFail;
    if (right != null && right != localBounds.right) {
      rightFail = DoublePair(localBounds.right, right);
    }

    final bottom = traitAssert.bottom;
    DoublePair? bottomFail;
    if (bottom != null && bottom != localBounds.bottom) {
      bottomFail = DoublePair(localBounds.bottom, bottom);
    }

    if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
      throw AssertionFailedException.forPosition(
        targetId: trait.targetId,
        left: leftFail,
        top: topFail,
        right: rightFail,
        bottom: bottomFail,
      );
    }
  }

  static void _evaluateParentBounds(
    ft.WidgetTester tester,
    RelativePositionAssert traitAssert,
    WidgetTrait trait,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetBounds = tester.getRect(ft.find.byWidget(target));
    final ancestorBounds = _getAncestorBounds(tester, traitAssert, trait);
    final localBounds = Rect.fromLTWH(
      targetBounds.left - ancestorBounds.left,
      targetBounds.top - ancestorBounds.top,
      targetBounds.width,
      targetBounds.height,
    );

    final left = traitAssert.left;
    DoublePair? leftFail;
    if (left != null && left != localBounds.left) {
      leftFail = DoublePair(localBounds.left, left);
    }

    final top = traitAssert.top;
    DoublePair? topFail;
    if (top != null && top != localBounds.top) {
      topFail = DoublePair(localBounds.top, top);
    }

    final right = traitAssert.right;
    DoublePair? rightFail;
    if (right != null && right != ancestorBounds.width - localBounds.right) {
      rightFail = DoublePair(ancestorBounds.width - localBounds.right, right);
    }

    final bottom = traitAssert.bottom;
    DoublePair? bottomFail;
    if (bottom != null &&
        bottom != ancestorBounds.height - localBounds.bottom) {
      bottomFail =
          DoublePair(ancestorBounds.height - localBounds.bottom, bottom);
    }

    if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
      throw AssertionFailedException.forRelativePosition(
        targetId: trait.targetId,
        leftDistance: leftFail,
        topDistance: topFail,
        rightDistance: rightFail,
        bottomDistance: bottomFail,
      );
    }
  }

  static void _evaluateGlobalBounds(
    ft.WidgetTester tester,
    RelativePositionAssert traitAssert,
    WidgetTrait trait,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetBounds = tester.getRect(ft.find.byWidget(target));
    final globalBounds = Offset.zero & getScreenSize(tester);

    final left = traitAssert.left;
    DoublePair? leftFail;
    if (left != null && left != targetBounds.left) {
      leftFail = DoublePair(targetBounds.left, left);
    }

    final top = traitAssert.top;
    DoublePair? topFail;
    if (top != null && top != targetBounds.top) {
      topFail = DoublePair(targetBounds.top, top);
    }

    final right = traitAssert.right;
    DoublePair? rightFail;
    if (right != null && right != globalBounds.width - targetBounds.right) {
      rightFail = DoublePair(globalBounds.width - targetBounds.right, right);
    }

    final bottom = traitAssert.bottom;
    DoublePair? bottomFail;
    if (bottom != null && bottom != globalBounds.height - targetBounds.bottom) {
      bottomFail =
          DoublePair(globalBounds.height - targetBounds.bottom, bottom);
    }

    if (atLeastOne([leftFail, topFail, rightFail, bottomFail])) {
      throw AssertionFailedException.forRelativePosition(
        targetId: trait.targetId,
        leftDistance: leftFail,
        topDistance: topFail,
        rightDistance: rightFail,
        bottomDistance: bottomFail,
      );
    }
  }

  static Rect _getAncestorBounds(
    ft.WidgetTester tester,
    RelativePositionAssert traitAssert,
    WidgetTrait trait,
  ) {
    final ancestor = TraitFinder.findAncestorOf(
      trait,
      ancestorId: traitAssert.traitId,
    );
    if (ancestor == null) {
      throw UnknowWidgetTraitException.forAncestor(
        trait.id,
        ancestorId: traitAssert.traitId,
      );
    }

    final ancestorTarget = TraitFinder.getTarget(
      ancestor,
      tester: tester,
    );

    return tester.getRect(
      ft.find.byWidget(ancestorTarget),
    );
  }
}

/// Contains evaluation logic for [RelativeSizeAssert].
class RelativeSizeEvaluator {
  RelativeSizeEvaluator._();

  /// Evaluates [traitAssert].
  static void evaluate(
    ft.WidgetTester tester,
    RelativeSizeAssert traitAssert,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  ) {
    final target = TraitFinder.getTarget(trait, tester: tester);
    final targetSize = tester.getSize(ft.find.byWidget(target));
    final compareTrait = TraitFinder.findTrait(
      traitId: traitAssert.traitId,
      rootTraits: rootTraits,
    );

    if (compareTrait == null) {
      throw UnknowWidgetTraitException(traitId: traitAssert.traitId);
    }

    final compareTarget = TraitFinder.getTarget(
      compareTrait,
      tester: tester,
    );
    final compareSize = tester.getSize(ft.find.byWidget(compareTarget));

    final pWidth = traitAssert.width;
    DoublePair? widthFail;
    if (pWidth != null && pWidth != targetSize.width / compareSize.width) {
      widthFail = DoublePair(targetSize.width / compareSize.width, pWidth);
    }

    final pHeight = traitAssert.height;
    DoublePair? heightFail;
    if (pHeight != null && pHeight != targetSize.height / compareSize.height) {
      heightFail = DoublePair(targetSize.height / compareSize.height, pHeight);
    }

    if (atLeastOne([widthFail, heightFail])) {
      throw AssertionFailedException.forRelativeSize(
        targetId: trait.targetId,
        pWidth: widthFail,
        pHeight: heightFail,
      );
    }
  }
}
