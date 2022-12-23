/// Extension on [Iterable].
extension IterableExtension<E> on Iterable<E> {
  /// Checks whether the list has either one or none elements which satisfies
  /// [test].
  ///
  /// Returns `true` if one or none element was found, otherwise `false`.
  bool hasSingleOrNone(bool Function(E element) test) {
    bool foundValidElement = false;
    for (final value in this) {
      if (test(value)) {
        if (!foundValidElement) {
          foundValidElement = true;
        } else {
          return false;
        }
      }
    }

    return true;
  }

  /// Checks that this iterable has only one element, which is then returned,
  /// or none.
  ///
  /// Throws a [StateError] if `this` has more than one element.
  /// In case of no element `null` is returned instead.
  E? get singleOrEmpty => isNotEmpty ? single : null;
}
