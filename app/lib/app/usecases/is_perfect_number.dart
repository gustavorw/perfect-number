import 'package:app/core/algorithm/lucas_lehmer_algorithm.dart';
import 'package:app/core/algorithm/sieve_eratosthenes_algorithm.dart';

class IsPerfectNumber {
  bool call(BigInt number) {
    final candidates = SieveEratosthenesAlgorithm.call(1000);
    for (var p in candidates) {
      if (LucasLehmerAlgorithm.call(p)) {
        BigInt mersenne = (BigInt.from(2).pow(p)) - BigInt.one;
        BigInt perfect = (BigInt.from(2).pow(p - 1)) * mersenne;
        if (number == perfect) {
          return true;
        }
      }
    }
    return false;
  }
}
