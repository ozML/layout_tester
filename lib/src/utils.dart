import 'extensions.dart';

/// Checks whether one or no element in a provided list is not `null`.
///
/// Returns `true` if a single element in the provided list or none is set.
bool oneOrNone(List values) =>
    values.hasSingleOrNone((element) => element != null);

/// Checks whether at least one element in a provided list is not `null`.
///
/// Returns `true` if one or more elements in the provided list is set.
bool atLeastOne(List values) => values.any((element) => element != null);
