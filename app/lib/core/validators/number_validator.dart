class NumberValidator {
  static String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Digite um número inteiro positivo';
    }
    final integer = num.parse(value);
    if (integer < 0) {
      return 'Digite um número inteiro positivo';
    }
    return null;
  }
}
