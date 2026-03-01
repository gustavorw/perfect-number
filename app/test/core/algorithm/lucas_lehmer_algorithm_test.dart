import 'package:flutter_test/flutter_test.dart';
import 'package:app/core/algorithm/lucas_lehmer_algorithm.dart';

void main() {
  test('Lucas–Lehmer retorna verdadeiro para p=5 (2^5-1 = 31 é primo)', () {
    expect(LucasLehmerAlgorithm.call(5), isTrue);
  });

  test('Lucas–Lehmer retorna falso para p=11 (2^11-1 = 2047 é composto)', () {
    expect(LucasLehmerAlgorithm.call(11), isFalse);
  });
}