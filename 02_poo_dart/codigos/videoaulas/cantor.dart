import 'pessoa.dart';
import 'apresentar_publico.dart';

class Cantor with ApresentarPublico implements Pessoa {
  int cpf;

  @override
  pagarImpostos() {
    print("Eu sou um cantor que paga impostos");
  }

  @override
  respirar() {
    print("Eu sou um cantor que respira");
  }

  cantar() {
    print("Eu sou um cantor que canta");
  }
}
