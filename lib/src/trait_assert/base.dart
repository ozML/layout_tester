import 'dart:ui';

import 'package:layout_tester/src/widget_trait.dart';

/// Base class for assertions on [WidgetTrait].
abstract class TraitAssert {
  /// Creates an instance of [TraitAssert].
  const TraitAssert();
}

/// Base class for relative assertions on [WidgetTrait].
abstract class RelativeTraitAssert extends TraitAssert {
  /// Creates an instance of [RelativeTraitAssert].
  const RelativeTraitAssert({required this.traitId}) : super();

  /// The target trait ID.
  final String traitId;
}

/// Customizable assert class.
///
/// This class can be used as base for custom trait assert classes.
abstract class CustomTraitAssert extends TraitAssert {
  /// Creates an instance of [CustomTraitAssert].
  const CustomTraitAssert({this.traitId});

  /// The target trait ID.
  final String? traitId;

  /// Returns whether this trait is relative to another trait.
  bool get isRelative => traitId != null;

  /// Implements the assertion logic.
  ///
  /// Must be implmented in concrete sub classes. The widget trait is passed in
  /// as [trait] and its bounds in the global scope as [bounds]. The screen
  /// size, which represents the global scope, is provided as [screenSize]. If
  /// [traitId] is defined, the optional input parameters [compareTrait] and its
  /// corresponding bounds [compareBounds] are provided.
  void test(
    WidgetTrait trait,
    Rect bounds,
    Size screenSize, [
    WidgetTrait? compareTrait,
    Rect? compareBounds,
  ]);
}
