import 'package:app/core/algorithm/lucas_lehmer_algorithm.dart';
import 'package:app/core/algorithm/sieve_eratosthenes_algorithm.dart';

class FindPerfectsInRange {
  List<BigInt> call(BigInt start, BigInt end) {
    List<BigInt> perfects = [];
    final candidates = SieveEratosthenesAlgorithm.call(1000);
    for (var p in candidates) {
      if (LucasLehmerAlgorithm.call(p)) {
        BigInt mersenne = (BigInt.from(2).pow(p)) - BigInt.one;
        BigInt perfect = (BigInt.from(2).pow(p - 1)) * mersenne;
        if (perfect >= start && perfect <= end) {
          perfects.add(perfect);
        }
        if (perfect > end) {
          break;
        }
      }
    }
    return perfects;
  }
}


