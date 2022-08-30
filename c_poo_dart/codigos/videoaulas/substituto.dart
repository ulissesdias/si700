import 'professor.dart';

class Substituto extends Professor {
  /*
  Herdados:
    - Atributos: nome, sobrenome, idade
    - Métodos: getInfo()

  Não Herdados: 
    - Construtores

  Semântica: um substituto é um professor
     - Precisa invocar construtor de professor.  
  */
  int terminoVinculo;

  Substituto(String nome, String sobrenome, int idade, int terminoVinculo)
      : super(nome, sobrenome, idade) {
    this.terminoVinculo = terminoVinculo;
  }

  Substituto.fromMap(Map<String, dynamic> dicionario)
      : super.fromMap(dicionario) {
    terminoVinculo = dicionario["terminoVinculo"];
  }

  // Método Particular de Substituto
  String getCompleteInfo() {
    return "Nome: $nome $sobrenome; Idade: $idade; Término: $terminoVinculo";
  }

  // Método que sobrescreve um da classe mãe
  @override
  String getInfo() => "$nome $sobrenome; $idade; $terminoVinculo";
}

void main() {
  Professor professor = new Professor("Ulisses", "Martins", 38);

  print(professor.getInfo());
  print(professor.nome);
  print(professor.idade);
  // print(professor._informacaoSigilosa);
}
