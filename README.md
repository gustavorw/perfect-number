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

## O que é um Número Perfeito

Um número perfeito é um inteiro positivo que é igual à soma de todos os seus divisores positivos próprios (isto é, todos os divisores excluindo ele mesmo). Exemplos clássicos:

- 6 = 1 + 2 + 3
- 28 = 1 + 2 + 4 + 7 + 14
- 496 = 1 + 2 + 4 + 8 + 16 + 31 + 62 + 124 + 248

No projeto usaremos a propriedade matemática associada aos números perfeitos pares: se p é primo e 2^p - 1 é primo (um primo de Mersenne), então $$(2^{p-1}) \cdot (2^p - 1)$$ é um número perfeito.

## Algoritmos usados

Para a solução fez uso dos seguintes algoritmos:

* [Crivo de Eratóstenes](https://cp-algorithms.com/algebra/sieve-of-eratosthenes.html)
* [Lucas Lehmer](https://en.wikipedia.org/wiki/Lucas%E2%80%93Lehmer_primality_test)
* [Mersenne](https://en.wikipedia.org/wiki/Mersenne_prime)
* [Euclides Euler](https://pt.wikipedia.org/wiki/Teorema_de_Euclides-Euler)
---
## Solução 
1. Geração de Candidatos (Crivo de Eratóstenes)O algoritmo inicia gerando uma lista de números primos pequenos (ex: até 1000).Esses números são usados como expoentes ($p$).
    - Por que? De acordo com a regra de Mersenne, para que $2^p - 1$ seja um número primo, o próprio expoente $p$ deve ser um número primo. O Crivo elimina candidatos inválidos logo no início.
2. Teste de Primalidade (Algoritmo de Lucas-Lehmer)Para cada primo $p$ encontrado, verificamos se o número de Mersenne correspondente ($M_p = 2^p - 1$) é realmente primo.
   - O Teste: Utilizamos a sequência de Lucas-Lehmer: $S_{n} = (S_{n-1}^2 - 2) \pmod{M_p}$, começando com $S_0 = 4$.
   - Resultado: Se o resto final for $0$, temos em mãos um Primo de Mersenne.
3. Construção do Número Perfeito (Teorema de Euclides-Euler)Uma vez confirmado que $M_p$ é um primo de Mersenne, aplicamos a fórmula milenar de Euclides: <br> $$Perfect = 2^{p-1} \times (2^p - 1)$$ <br> O número gerado por esta fórmula é garantidamente um Número Perfeito (um número que é igual à soma de seus divisores próprios).


Um exemplo pratico (p = 5):
1. Crivo: Identifica que 5 é primo.
2. Lucas-Lehmer: Testa $M_5$ ($2^5 - 1 = 31$). O teste retorna true (31 é primo).
3. Euclides-Euler: Calcula $2^{5-1} \times 31 = 16 \times 31 = 496$.
4. Verificação: Se o número de entrada for 496, o algoritmo retorna true. 


No repositorio encontra-se os algoritmos usados.

## Estrutura do repositório (resumo)

Esta seção descreve a organização do código e a responsabilidade de cada camada/folder principal.

- `app/lib/core/` — Código de baixo nível e utilitários reutilizáveis
  - `core/algorithm/` — Implementações dos algoritmos matemáticos (Crivo de Eratóstenes, Lucas–Lehmer, etc.). São funções puras que podem ser testadas isoladamente.
  - `core/validators/` — Validadores de entrada (ex.: `NumberValidator`), usados pela camada de UI/forms.

- `app/lib/app/` — Camada de aplicação (órgão de coordenação entre UI e domínio)
  - `usecases/` — Casos de uso / regras de negócio (ex.: `is_perfect_number.dart`, `find_perfects_in_range.dart`). Cada usecase encapsula uma tarefa específica e pode ser testado independentemente.
  - `controllers/` — Controladores reativos (ValueNotifiers) que expõem estados para a UI. Responsáveis por orquestrar validação, chamar usecases e emitir estados (loading, success, error).
  - `view/` — Widgets e telas (forms, views, widgets compartilhados). Aqui ficam componentes específicos da interface, que consomem os `controllers`.
  - `theme/` — Definições de cores, tipografia e temas (ex.: `app_theme.dart`).

- `app/lib/shared/widgets/` (ou `app/lib/app/view/widgets/`) — Widgets reutilizáveis de UI (botões, inputs, componentes de formulário).

- `test/` — Testes automatizados
  - `core/` — testes para algoritmos e utilitários (Crivo, Lucas–Lehmer, validações)
  - `app/` — testes para usecases e integração lógica (ex.: `is_perfect_number_test.dart`, `find_perfects_in_range_test.dart`)




Responsabilidades por camada (resumido)

- UI / View: renderizar dados e capturar interação do usuário; delega validações simples para validators e ações para controllers.
- Controllers: manter estado da UI (ValueNotifier), validar entradas, acionar usecases e mapear resultados para estados de apresentação.
- Usecases (aplicação): conter regras de negócio e fluxo principal (por exemplo: como buscar números perfeitos dentro de um intervalo), coordenando algoritmos do `core`.
- Core (algoritmos & utilitários): implementação pura de algoritmos (testáveis); sem dependências de UI ou Flutter.
- Tests: garantir comportamento correto das unidades e integração mínima entre camadas.

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

