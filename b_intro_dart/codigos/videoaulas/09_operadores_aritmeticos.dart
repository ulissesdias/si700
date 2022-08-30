void main() {
  double a = 23.0;
  double b = 7.0;

  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b); // Divisão
  print(a ~/ b); // Divisão Inteira
  print(a % b); // Resto da Divisão

  // Outros operadores
  print(a++);
  print(a);

  // a++ difere de ++a
  print(++a);
  print(a);

  // Operadores Aritméticos e de Atribuição
  a += 1; // a = a + 1;
  a -= 1;
  a *= 2;
  a /= 2;
  print("Último: $a");
}
