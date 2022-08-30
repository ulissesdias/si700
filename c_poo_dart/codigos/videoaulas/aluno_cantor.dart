import 'aluno.dart';
import 'cantor.dart';
import 'apresentar_publico.dart';

class AlunoCantor with ApresentarPublico implements Aluno, Cantor {
  int cpf;

  @override
  pagarImpostos() {
    print("Eu sou um aluno cantor que paga impostos");
  }

  @override
  respirar() {
    print("Eu sou um aluno cantor que respira");
  }

  estudar() {
    print("Eu sou um aluno cantor que estuda");
  }

  cantar() {
    print("Eu sou um aluno cantor que canta");
  }
}

void main() {
  Aluno aluno1 = AlunoCantor();
  Cantor aluno2 = AlunoCantor();

  print(aluno1.estudar());
  print(aluno2.cantar());

  //print(aluno1.cantar());

  aluno2.apresentacaoPublica();

  //aluno1.apresentacaoPublica();
}
