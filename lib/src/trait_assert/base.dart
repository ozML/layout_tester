import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

import 'package:layout_tester/src/widget_trait.dart';
import 'package:layout_tester/src/exceptions.dart';

/// Base class for assertions on [WidgetTrait].
abstract class TraitAssert with EquatableMixin {
  /// Creates an instance of [TraitAssert].
  const TraitAssert();

  /// Processes the inner logic of this assertion.
  ///
  /// Should throw a [AssertionFailedException]
  void evaluate(
    ft.WidgetTester tester,
    WidgetTrait trait,
    List<WidgetTrait> rootTraits,
  );
}

/// Base class for general assertions on [WidgetTrait].
abstract class GeneralTraitAssert extends TraitAssert {
  const GeneralTraitAssert() : super();
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
/// This class can be used as base for custom trait assertion classes.
abstract class CustomTraitAssert extends TraitAssert {
  /// Creates an instance of [CustomTraitAssert].
  const CustomTraitAssert({this.traitId});

  /// The target trait ID.
  final String? traitId;

  /// Returns whether this trait is relative to another trait.
  bool get isRelative => traitId != null;
}
