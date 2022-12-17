/// Represents a pair of equally typed values.
class ValuePair<T> {
  /// Creates an instance of [ValuePair].
  ValuePair(this.value1, this.value2);

  /// First value.
  final T value1;

  /// Second value.
  final T value2;
}

/// Specialisation of [ValuePair] for [double].
class DoublePair extends ValuePair<double> {
  /// Creates an instance of [DoublePair].
  DoublePair(super.value1, super.value2);
}
