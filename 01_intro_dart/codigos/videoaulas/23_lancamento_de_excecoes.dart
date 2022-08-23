// Importando um pacote
import 'dart:math'; // Random

// Função que lança exceções ao acaso
void lancandoExcecoes() {
  Random random = new Random();
  int randomNumber = random.nextInt(3); // gera 0, 1, ou 2

  if (randomNumber == 0) {
    throw "Lancei algo em String";
  } else if (randomNumber == 1) {
    throw FormatException("Lancei um FormatException");
  } else {
    throw Exception("Lancei um Exception");
  }
}

void main() {
  try {
    lancandoExcecoes();
  } on FormatException {
    print("Capturei um FormatException \n");
  } on Exception catch (obj) {
    print("Capturei um Exception: Objeto -> $obj \n");
  } catch (obj) {
    print("Capturei algo e não importa o tipo: Objeto -> $obj \n");
  } finally {
    print("Terminei de fazer o que gostaria de fazer");
  }
}
