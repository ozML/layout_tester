import 'package:flutter_test/flutter_test.dart';
import 'package:layout_tester/src/utils.dart';

void main() {
  group('utils_test.dart -', () {
    test('oneOrNone', () {
      expect(oneOrNone([null, null, null]), true);
      expect(oneOrNone([null, null, Object()]), true);
      expect(oneOrNone([null, Object(), Object()]), false);
    });

    test('atLeastOne', () {
      expect(atLeastOne([null, null, null]), false);
      expect(atLeastOne([null, null, Object()]), true);
      expect(atLeastOne([null, Object(), Object()]), true);
    });
  });
}
