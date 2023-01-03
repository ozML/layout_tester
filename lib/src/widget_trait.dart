import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:layout_tester/src/extensions.dart';

import 'trait_assert/assert.dart';

/// Used to identify a specific widget.
typedef WidgetLocator = bool Function(Widget widget);

/// Identifier for a widget in a [WidgetTrait].
class TargetId with EquatableMixin {
  /// Creates an instance of [TargetId].
  ///
  /// Either [type] or [key] must be set, or both.
  const TargetId({this.type, this.key, this.elementIndex})
      : assert(
          type != null || key != null,
          'At least one of both, type or key must be defined',
        ),
        customLocator = null;

  /// Creates an instance of [TargetId] with a custom locator function.
  const TargetId.custom(WidgetLocator this.customLocator, {this.elementIndex})
      : type = null,
        key = null;

  /// Type of the target widget.
  final Type? type;

  /// Key of the target widget.
  final Key? key;

  /// Callback to realize custom identificaton logic for the target widget.
  final WidgetLocator? customLocator;

  /// Used to distinguish the right widget in a list of possibilities.
  ///
  /// If the declaration of [type] and [key] or [customLocator] lead to a list
  /// of possible widgets, this can be used to get the right one.
  final int? elementIndex;

  @override
  List<Object?> get props => [type, key, customLocator, elementIndex];
}

/// Special identifier which is used to build traits within
/// [WidgetTrait.withParents].
///
/// It extends [TargetId] but introduces a trait ID to refer to a trait.
class ComposeTargetId extends TargetId {
  /// Creates an instance of [ComposeTargetId].
  ///
  /// Either [type] or [key] must be set, or both.
  const ComposeTargetId({
    this.traitId,
    Type? type,
    Key? key,
    int? elementIndex,
  }) : super(type: type, key: key, elementIndex: elementIndex);

  /// Creates an instance of [ComposeTargetId] with a custom locator function.
  const ComposeTargetId.custom(
    WidgetLocator customLocator, {
    this.traitId,
    int? elementIndex,
  }) : super.custom(customLocator, elementIndex: elementIndex);

  /// Trait ID.
  final String? traitId;

  @override
  List<Object?> get props => [traitId, ...super.props];

  TargetId _toTargetId() {
    final customLocator = this.customLocator;

    return customLocator != null
        ? TargetId.custom(customLocator, elementIndex: elementIndex)
        : TargetId(type: type, key: key, elementIndex: elementIndex);
  }
}

/// Describes a widget regarding its layout specific properties.
class WidgetTrait with EquatableMixin {
  WidgetTrait._({
    required this.targetId,
    String? id,
    this.parent,
    this.asserts = const [],
    List<WidgetTrait> descendants = const [],
  }) : _id = id ?? "#${++_idCounter}" {
    this.descendants = descendants
        .map((e) => WidgetTrait._(
              targetId: e.targetId,
              id: e.id,
              parent: this,
              asserts: e.asserts,
              descendants: e.descendants,
            ))
        .toList();
  }

  /// Creates an instance of [WidgetTrait].
  ///
  /// If [id] is omitted a generated value will be assignd instead.
  WidgetTrait({
    required TargetId targetId,
    String? id,
    List<TraitAssert> asserts = const [],
    List<WidgetTrait> descendants = const [],
  }) : this._(
          targetId: targetId,
          id: id,
          parent: null,
          asserts: asserts,
          descendants: descendants,
        );

  /// Creates an instance of [WidgetTrait] as a descendant of parents defined
  /// represented by [parentIds].
  ///
  /// A new parent trait is created for each ID in [parentIds], with the first
  /// element being the direct parent of the trait to be created here and the
  /// last element being the root trait at the top. Therefore each element in
  /// the list is descendant of the next element until reaching the last one.
  /// trait without a parent.
  ///
  /// This constructor can be used as shorthand, to create a hierarchy of
  /// elements with the parents being blank, except of their target IDs.
  factory WidgetTrait.withParents(
    List<ComposeTargetId> parentIds, {
    required TargetId targetId,
    String? id,
    List<TraitAssert> asserts = const [],
    List<WidgetTrait> descendants = const [],
  }) =>
      parentIds.fold(
        WidgetTrait(
          targetId: targetId,
          id: id,
          asserts: asserts,
          descendants: descendants,
        ),
        (previousValue, targetId) => WidgetTrait(
          id: targetId.traitId,
          targetId: targetId._toTargetId(),
          descendants: [previousValue],
        ),
      );

  static int _idCounter = 0;

  /// ID of this trait.
  final String _id;

  // Identifier for the targeted widget.
  final TargetId targetId;

  /// Parent trait.
  final WidgetTrait? parent;

  /// List of assertions on the target.
  final List<TraitAssert> asserts;

  /// Traits of widgets which are descendants of the here targeted widget.
  late final List<WidgetTrait> descendants;

  /// Returns the ID of this trait.
  String get id => _id;

  /// Returns whether this is a root element.
  ///
  /// Returns `true` if the element has no parent.
  bool get isRoot => parent == null;

  @override
  List<Object?> get props => [targetId, id];
}

/// Creates an instance of [WidgetTrait] with a target of type [T].
///
/// A [TargetId] is created for the generated trait, with [T] as target type.
/// Additionally [key] and [elementIndex] are added to it, if provided.
WidgetTrait qualifyTarget<T extends Widget>({
  Key? key,
  String? id,
  int? elementIndex,
  List<TraitAssert> asserts = const [],
  List<WidgetTrait> descendants = const [],
}) =>
    WidgetTrait(
      id: id,
      targetId: TargetId(type: T, key: key, elementIndex: elementIndex),
      asserts: asserts,
      descendants: descendants,
    );
