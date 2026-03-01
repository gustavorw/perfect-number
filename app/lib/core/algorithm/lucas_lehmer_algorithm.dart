class LucasLehmerAlgorithm {
  static bool call(int p) {
    if (p == 2) return true;
    BigInt mP = (BigInt.from(2).pow(p)) - BigInt.one;
    BigInt s = BigInt.from(4);

    for (int i = 0; i < p - 2; i++) {
      s = (s * s - BigInt.from(2)) % mP;
    }
    return s == BigInt.zero;
  }
}
