import 'package:flutter_test/flutter_test.dart';
import 'package:app/app/usecases/find_perfects_in_range.dart';

void main() {
  test('FindPerfectsInRange encontra números perfeitos no intervalo', () {
    final usecase = FindPerfectsInRange();
    final result = usecase.call(BigInt.from(1), BigInt.from(1000));
    expect(result, containsAll([BigInt.from(6), BigInt.from(28), BigInt.from(496)]));
  });

  test('FindPerfectsInRange retorna lista vazia quando não há números perfeitos', () {
    final usecase = FindPerfectsInRange();
    final result = usecase.call(BigInt.from(7), BigInt.from(27));
    expect(result, isEmpty);
  });
}