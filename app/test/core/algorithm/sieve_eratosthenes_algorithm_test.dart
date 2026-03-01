import 'package:flutter_test/flutter_test.dart';
import 'package:app/core/algorithm/sieve_eratosthenes_algorithm.dart';

void main() {
  test('Crivo de Eratóstenes retorna primos esperados até 30 (caso positivo)', () {
    final primes = SieveEratosthenesAlgorithm.call(30);
    expect(primes, containsAll([2, 3, 5, 7, 11, 13, 17, 19, 23, 29]));
   
  });

  test('Crivo de Eratóstenes não inclui números compostos (caso negativo)', () {
    final primes = SieveEratosthenesAlgorithm.call(30);
    expect(primes, isNot(contains(15)));
  });
}