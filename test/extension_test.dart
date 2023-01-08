import 'package:flutter_test/flutter_test.dart';

import 'package:layout_tester/src/extensions.dart';

void main() {
  group('IterableExtesion -', () {
    test('hasSingleOrNone', () {
      expect([null, null, null].hasSingleOrNone((e) => e != null), true);
      expect([null, null, Object()].hasSingleOrNone((e) => e != null), true);
      expect(
        [null, Object(), Object()].hasSingleOrNone((e) => e != null),
        false,
      );
    });

    test('singleOrEmpty', () {
      expect([].singleOrEmpty, null);
      expect([Object()].singleOrEmpty, isNotNull);
      expect(() => [Object(), Object()].singleOrEmpty, throwsStateError);
    });
  });
}
