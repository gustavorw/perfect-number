# Perfect Number — Desafio

Desafio: Crie um aplicativo móvel com interface gráfica que contenha duas funcionalidades principais:

1. Possibilidade de verificar se um número inserido pelo usuário é um NÚMERO PERFEITO;
2. Encontrar todos os NÚMEROS PERFEITOS entre dois números fornecidos na interface pelo usuário;

---

## Tecnologias usadas

- Flutter (Dart) — UI multiplataforma (iOS / Android) e testes.
- Estrutura do projeto: código organizado em `app/lib` com controllers, usecases e algoritmos em `app/lib/core/algorithm`.
- Testes unitários: `flutter test` (ampla cobertura nos algoritmos centrais).


---

## Algoritmos usados e explicação

O projeto faz uso de dois algoritmos principais para detectar números perfeitos e buscar primos candidatos:

1) Crivo de Eratóstenes (Sieve of Eratosthenes)

- Objetivo: gerar uma lista de números primos até um limite n (usado para gerar possíveis expoentes p).
- Como funciona (resumo): inicializa um vetor booleano marcando todos como primos e então itera de 2 até sqrt(n), marcando múltiplos como compostos. O resultado é a lista de índices marcados como primos.
- Complexidade: tempo O(n log log n), espaço O(n).
- Uso no projeto: em `app/lib/core/algorithm/sieve_eratosthenes_algorithm.dart` — gera expoentes candidatos p para testes de Mersenne.

2) Teste de Lucas–Lehmer (LucasLehmerAlgorithm)

- Objetivo: verificar se um número da forma 2^p - 1 (número de Mersenne) é primo, onde p é primo.
- Como funciona (resumo): para p > 2, calcula recorrentemente s_{i+1} = s_i^2 - 2 mod M_p, com s_0 = 4, onde M_p = 2^p - 1. Se após p-2 iterações s == 0, então M_p é primo.
- Complexidade: aproximadamente O(p^2) para aritmética de inteiros grandes, dado que envolve expoentes e operações mod sobre BigInt. Para os casos usados (ex: p até limites modestos), é aceitável.
- Uso no projeto: em `app/lib/core/algorithm/lucas_lehmer_algorithm.dart` — valida se 2^p-1 é primo; quando verdadeiro, gera o número perfeito correspondente.

3) Geração do número perfeito

- Propriedade utilizada: se p é primo e 2^p - 1 é primo (Primo de Mersenne), então (2^{p-1}) * (2^p - 1) é um número perfeito par.
- O projeto percorre a lista de expoentes primos (do Crivo), aplica o teste de Lucas–Lehmer e, quando M_p é primo, calcula o número perfeito e o coleta se estiver dentro do intervalo pedido.

Observações de implementação
- Para evitar trabalho desnecessário o crivo gera expoentes candidatos até um limite configurável (por exemplo 1000 no código atual). Números perfeitos crescem rapidamente; portanto o loop interrompe quando o perfeito calculado ultrapassa o fim do intervalo.
- A implementação usa `BigInt` para acomodar rapidamente valores grandes de 2^p.

---

## Estrutura do repositório (resumo)

- `app/lib/core/algorithm/`
  - `sieve_eratosthenes_algorithm.dart` — Crivo de Eratóstenes
  - `lucas_lehmer_algorithm.dart` — Teste de Lucas–Lehmer
- `app/lib/app/usecases/`
  - `is_perfect_number.dart` — verifica se um BigInt é um número perfeito
  - `find_perfects_in_range.dart` — encontra perfeitos em um intervalo
- `app/lib/app/controllers/` — controllers que expõem estados para a UI (SingleNumber, Range)
- `app/test/` — testes unitários para os algoritmos e casos de uso

---

## Como executar (desenvolvimento)

Requisitos:
- Flutter SDK instalado e configurado (versão compatível com o projeto).

Passos básicos:

1. Instale dependências:

```bash
flutter pub get
```

2. Rodar a aplicação (emulador ou dispositivo conectado):

```bash
flutter run
```

3. Rodar os testes unitários:

```bash
flutter test
```

Para executar um teste específico, por exemplo, o teste do Crivo:

```bash
flutter test test/core/algorithm/sieve_eratosthenes_algorithm_test.dart
```

---

