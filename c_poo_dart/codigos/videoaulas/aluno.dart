import 'pessoa.dart';

class Aluno implements Pessoa {
  int cpf;

  @override
  pagarImpostos() {
    print("Eu sou um aluno que paga impostos");
  }

  @override
  respirar() {
    print("Eu sou um aluno que respira");
  }

  estudar() {
    print("Eu sou um aluno que estuda");
  }
}
