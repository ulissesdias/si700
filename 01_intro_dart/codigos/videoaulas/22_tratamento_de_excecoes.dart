void main() {
  int x = 12;
  int y = 0;

  print("");
  try {
    print(x ~/ y);
  } on IntegerDivisionByZeroException catch (e) {
    print("Divisão Inteira por zero");
    print(e);
  }

  try {
    print(x ~/ y);
  } catch (e) {
    print(e);
  } finally {
    print("Bloco finally invocado");
  }
}
