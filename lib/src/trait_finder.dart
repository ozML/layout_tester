import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

import 'widget_trait.dart';

/// Helper class which provides functions to handle operations regarding traits.
class TraitFinder {
  TraitFinder._();

  /// Checks whether the widget is identified by the specified target ID.
  static bool isTarget(TargetId targetId, Widget widget) {
    final type = targetId.type;
    final key = targetId.key;

    if (targetId.customLocator != null) {
      return targetId.customLocator?.call(widget) ?? false;
    }

    if (type != null && key != null) {
      return widget.runtimeType == type && widget.key == key;
    } else if (type != null) {
      return widget.runtimeType == type;
    } else {
      return widget.key == key;
    }
  }

  /// Searches the widget identified by the specified target ID in the widget
  /// tree and returns it.
  static Widget getTarget(
    WidgetTrait trait, {
    required ft.WidgetTester tester,
  }) {
    ft.Finder findWidget(WidgetTrait trait) => ft.find.byWidgetPredicate(
          (widget) => isTarget(trait.targetId, widget),
        );

    final ancestry = getAncestryOf(trait);

    ft.Finder finder = findWidget(trait);
    for (int i = 0; i < ancestry.length; i++) {
      final ancestor = ancestry[i];
      final index = ancestor.targetId.elementIndex;

      finder = ft.find.descendant(
        of: index != null
            ? findWidget(ancestor).at(index)
            : findWidget(ancestor),
        matching: finder,
      );
    }

    final index = trait.targetId.elementIndex;

    return tester.widget(index != null ? finder.at(index) : finder);
  }

  /// Searches for the ancestor of [trait] with the specified ID and returns it.
  ///
  /// Therefor all parents of [trait] are traversed up to its root, until the
  /// corresponding ancestor is found. Otherwise `null` is returned.
  static WidgetTrait? findAncestorOf(
    WidgetTrait trait, {
    required String ancestorId,
  }) {
    WidgetTrait? currentTrait = trait.parent;
    while (currentTrait != null) {
      if (currentTrait.id != ancestorId) {
        currentTrait = currentTrait.parent;
      } else {
        return currentTrait;
      }
    }

    return null;
  }

  /// Searches and returns the root ancestor of [trait].
  ///
  /// If [trait] is already the root element, `null` is returned.
  static WidgetTrait? findRootAncestorOf(WidgetTrait trait) {
    WidgetTrait? currentTrait = trait.parent;
    while (currentTrait != null) {
      if (currentTrait.parent != null) {
        currentTrait = currentTrait.parent;
      } else {
        return currentTrait;
      }
    }

    return null;
  }

  /// Searches for the descendant of [trait] with the specified ID and returns
  /// it.
  ///
  /// Therefor all childs of [trait] are traversed until the corresponding
  /// descendant is found. Otherwise `null` is returned.
  static WidgetTrait? findDescendantOf(
    WidgetTrait trait, {
    required descendantId,
  }) {
    for (final descendant in trait.descendants) {
      if (descendant.id != descendantId) {
        final result = findDescendantOf(descendant, descendantId: descendantId);
        if (result != null) {
          return result;
        }
      } else {
        return descendant;
      }
    }

    return null;
  }

  /// Searches for an element unrelated to [trait].
  ///
  /// Related here means all elements which share the same root. All root
  /// elements shall be passed as [rootTraits], which should also include the
  /// root element of [trait]. Returns `null` if no element was found.
  static WidgetTrait? findUnrelated(
    WidgetTrait trait, {
    required String traitId,
    required List<WidgetTrait> rootTraits,
  }) {
    final rootTrait = findRootAncestorOf(trait) ?? trait;
    for (final element in rootTraits) {
      if (element.id != rootTrait.id) {
        if (element.id == traitId) {
          return element;
        }

        final result = findDescendantOf(element, descendantId: traitId);
        if (result != null) {
          return result;
        }
      }
    }

    return null;
  }

  /// Searches for an element which is not intersecting with [trait].
  ///
  /// The bounds of the searched element must not intersect with [trait], which
  /// means it neither can be an ancestor in direct line, nor descendants of
  /// [trait]. All other elements, including elements in other sub branches of
  /// direct ancestors.
  ///
  /// All root elements shall be passed as [rootTraits], which should also
  /// include the root element of [trait]. Returns `null` if no element was
  /// found.
  static WidgetTrait? findNonIntersecting(
    WidgetTrait trait, {
    required String traitId,
    required List<WidgetTrait> rootTraits,
  }) {
    WidgetTrait previousTrait = trait;
    WidgetTrait? currentTrait = trait.parent;

    /// Search related in non-direct line.
    while (currentTrait != null) {
      for (final descendant in currentTrait.descendants) {
        if (descendant.id != previousTrait.id) {
          final result = findDescendantOf(descendant, descendantId: traitId);
          if (result != null) {
            return result;
          }
        }
      }
      previousTrait = currentTrait;
      currentTrait = currentTrait.parent;
    }

    /// Search unrelated.
    final rootAncestor = findRootAncestorOf(trait);
    for (final rootTrait in rootTraits) {
      if (rootTrait.id != (rootAncestor?.id ?? trait.id)) {
        if (rootTrait.id == traitId) {
          return rootTrait;
        }

        final result = findDescendantOf(rootTrait, descendantId: traitId);
        if (result != null) {
          return result;
        }
      }
    }

    return null;
  }

  /// Finds the element with the specified ID within the given list.
  ///
  /// The list represents the root of a relational tree. All traits within it,
  /// and their descendants are traversed to fint the searched element.
  /// Otherwise `null` is returned.
  static WidgetTrait? findTrait({
    required String traitId,
    required List<WidgetTrait> rootTraits,
  }) {
    for (final trait in rootTraits) {
      if (trait.id == traitId) {
        return trait;
      }

      final result = findDescendantOf(trait, descendantId: traitId);
      if (result != null) {
        return result;
      }
    }

    return null;
  }

  /// Returns all ancestors of the given trait in a list.
  ///
  /// The list begins with the direct ancestor on index 0.
  static List<WidgetTrait> getAncestryOf(WidgetTrait trait) {
    final ancestry = <WidgetTrait>[];

    WidgetTrait? currentTrait = trait.parent;
    while (currentTrait != null) {
      ancestry.add(currentTrait);
      currentTrait = currentTrait.parent;
    }

    return ancestry;
  }
}
