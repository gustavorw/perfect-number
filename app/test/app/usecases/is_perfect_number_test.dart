import 'package:flutter_test/flutter_test.dart';
import 'package:app/app/usecases/is_perfect_number.dart';

void main() {
  test('IsPerfectNumber retorna verdadeiro para número perfeito (6)', () {
    final usecase = IsPerfectNumber();
    final result = usecase.call(BigInt.from(6));
    expect(result, isTrue);
  });

  test('IsPerfectNumber retorna falso para número não perfeito (12)', () {
    final usecase = IsPerfectNumber();
    final result = usecase.call(BigInt.from(12));
    expect(result, isFalse);
  });
}