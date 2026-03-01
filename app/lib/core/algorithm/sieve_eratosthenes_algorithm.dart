class SieveEratosthenesAlgorithm {
  static List<int> call(int n) {
    List<bool> prime = List.filled(n + 1, true);
    prime[0] = prime[1] = false;
    for (int p = 2; p * p <= n; p++) {
      if (prime[p]) {
        for (int i = p * p; i <= n; i += p) {
          prime[i] = false;
        }
      }
    }
    return [
      for (int i = 2; i <= n; i++)
        if (prime[i]) i,
    ];
  }
}
