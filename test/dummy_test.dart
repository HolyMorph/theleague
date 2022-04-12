import 'package:flutter_test/flutter_test.dart';
import 'package:mezorn_dummy/utils/constants.dart';

void main() {
  test('IS_debug', () {
    expect(Constants.isDevUrl, false);
  });
}
