extension IterableExtension<E> on Iterable<E> {
  bool hasSingleOrNone(bool Function(E element) test) {
    bool set = false;
    for (final value in this) {
      if (test(value)) {
        if (!set) {
          set = true;
        } else {
          return false;
        }
      }
    }
    return true;
  }

  E? get singleOrNone => isNotEmpty ? single : null;
}
