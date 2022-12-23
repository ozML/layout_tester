import 'value_pair.dart';
import 'widget_trait.dart';

/// Base class for all layout_tester related exceptions.
class LayoutTesterException implements Exception {
  /// Creates an instance of [LayoutTesterException].
  LayoutTesterException(this.message);

  /// The error message.
  final String message;

  @override
  String toString() => message;
}

/// Exception which indicates the missing of an expected widget.
class UnknowWidgetTraitException extends LayoutTesterException {
  /// Creates an instance of [UnknowWidgetTraitException].
  UnknowWidgetTraitException({required String traitId})
      : super('The widget trait with the ID \'$traitId\' was not found.');

  /// Creates an instance of [UnknowWidgetTraitException] with additional
  /// information regarding an ancestor.
  UnknowWidgetTraitException.forAncestor(
    String traitId, {
    required String ancestorId,
  }) : super('The ancestor \'$ancestorId\' of trait \'$traitId\' '
            'was not found.');

  /// Creates an instance of [UnknowWidgetTraitException] with additional
  /// information regarding a descendant.
  UnknowWidgetTraitException.forDescendant(
    String traitId, {
    required String descendantId,
  }) : super('The descendant \'$descendantId\' of trait \'$traitId\' '
            'was not found.');
}

/// Holds the info about an assertion failure on a specific field.
class FailedAssertionInfo<T> extends ValuePair<T> {
  /// Creates an instance of [FailedAssertionInfo].
  FailedAssertionInfo(this.fieldName, T value, T expected)
      : super(value, expected);

  /// Creates an instance of [FailedAssertionInfo] from a [ValuePair].
  FailedAssertionInfo.fromPair(String fieldName, ValuePair<T> pair)
      : this(fieldName, pair.value1, pair.value2);

  /// Field name.
  final String fieldName;

  /// Returns the given value.
  T get value => value1;

  /// Returns the expected value.
  T get expected => value2;
}

/// Contains information about a failing assertion.
class AssertionFailedException extends LayoutTesterException {
  /// Creates an instance of [AssertionFailedException].
  AssertionFailedException({
    required TargetId targetId,
    required String cause,
    required List<FailedAssertionInfo> infos,
  }) : super(
          '$cause\n\n'
          '${infos.isNotEmpty ? 'Expected\n' : ''}'
          '${infos.map(
                (e) => '${e.fieldName}: ${e.value}; Found: ${e.expected}',
              ).join('\n')}',
        );

  /// Creates an instance of [AssertionFailedException] for position failure.
  ///
  /// Expects [DoublePair] objects for the different property details, where
  /// `value1` corresponds to the actual value and `value2` to the expected.
  AssertionFailedException.forPosition({
    required TargetId targetId,
    DoublePair? left,
    DoublePair? top,
    DoublePair? right,
    DoublePair? bottom,
  }) : this(
          targetId: targetId,
          cause: 'Position assertion for target ${_idInfo(targetId)} failed.',
          infos: [
            if (left != null) FailedAssertionInfo.fromPair('Left', left),
            if (top != null) FailedAssertionInfo.fromPair('Top', top),
            if (right != null) FailedAssertionInfo.fromPair('Right', right),
            if (bottom != null) FailedAssertionInfo.fromPair('Bottom', bottom),
          ],
        );

  /// Creates an instance of [AssertionFailedException] for size failure.
  ///
  /// Expects [DoublePair] objects for the different property details, where
  /// `value1` corresponds to the actual value and `value2` to the expected.
  AssertionFailedException.forSize({
    required TargetId targetId,
    DoublePair? width,
    DoublePair? height,
  }) : this(
          targetId: targetId,
          cause: 'Size assertion for target ${_idInfo(targetId)} failed.\n\n',
          infos: [
            if (width != null) FailedAssertionInfo.fromPair('Width', width),
            if (height != null) FailedAssertionInfo.fromPair('Height', height),
          ],
        );

  /// Creates an instance of [AssertionFailedException] for relative position
  /// failure.
  ///
  /// Expects [DoublePair] objects for the different property details, where
  /// `value1` corresponds to the actual value and `value2` to the expected.
  AssertionFailedException.forRelativePosition({
    required TargetId targetId,
    DoublePair? leftDistance,
    DoublePair? topDistance,
    DoublePair? rightDistance,
    DoublePair? bottomDistance,
  }) : this(
          targetId: targetId,
          cause: 'Relative position assertion '
              'for target ${_idInfo(targetId)} failed.',
          infos: [
            if (leftDistance != null)
              FailedAssertionInfo.fromPair('Left distance', leftDistance),
            if (topDistance != null)
              FailedAssertionInfo.fromPair('Top distance', topDistance),
            if (rightDistance != null)
              FailedAssertionInfo.fromPair('Right distance', rightDistance),
            if (bottomDistance != null)
              FailedAssertionInfo.fromPair('Bottom distance', bottomDistance),
          ],
        );

  /// Creates an instance of [AssertionFailedException] for relative size
  /// failure.
  ///
  /// Expects [DoublePair] objects for the different property details, where
  /// `value1` corresponds to the actual value and `value2` to the expected.
  AssertionFailedException.forRelativeSize({
    required TargetId targetId,
    DoublePair? pWidth,
    DoublePair? pHeight,
  }) : this(
          targetId: targetId,
          cause: 'Relative size assertion for '
              'target ${_idInfo(targetId)} failed.\n\n',
          infos: [
            if (pWidth != null)
              FailedAssertionInfo.fromPair('Relative width', pWidth),
            if (pHeight != null)
              FailedAssertionInfo.fromPair('Relative height', pHeight),
          ],
        );
}

String _idInfo(TargetId targetId) => '#(${[
      targetId.type,
      targetId.key,
      targetId.elementIndex,
      if (targetId.customLocator != null) 'customLocator',
    ].where((element) => element != null).join(', ')})';
