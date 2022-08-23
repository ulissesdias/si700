import 'pessoa.dart';
import 'apresentar_publico.dart';

class Professor extends Pessoa with ApresentarPublico {
  // Atributos

  // Públicos: Getters e Setters automáticos
  String nome;
  String sobrenome;
  int idade;

  // Privados: Defina os Getters e Setters
  int _informacaoSigilosa; // Privado dentro do próprio arquivo

  // Estáticos
  static int inteiroEstatico = 10;

  static const constanteEstatica = 15;

  /*
     Getters e Setters
  */

  int get informacaoSigilosa => _informacaoSigilosa;
  set informacaoSigilosa(n) => _informacaoSigilosa = n;

  String get nomeCompleto => "$nome $sobrenome";
  set nomeCompleto(str) {
    var lista = str.split(" ");
    nome = lista[0];
    sobrenome = lista.sublist(1).join(" ");
  }

  // Construtor
  /*
  Professor() {
    nome = "Ulisses";
    sobrenome = "Dias";
    idade = 35;
  }*/

  Professor(this.nome, this.sobrenome, this.idade) {
    this._informacaoSigilosa = 2021;
  }

  // Construtores com nome
  Professor.fromMap(Map<String, dynamic> dicionario) {
    nome = dicionario["nome"];
    sobrenome = dicionario["sobrenome"];
    idade = dicionario["idade"];
  }

  Professor.fromList(lista) {
    nome = lista[0];
    sobrenome = lista[1];
    idade = lista[2];
  }

  // Métodos
  String getInfo() {
    return "\n Nome: $nome $sobrenome \n";
  }

  @override
  respirar() {
    print("Eu respiro");
  }

  static void ensinar() {
    print("Eu ensino");
  }
}

void main() {
  //Professor professor = new Professor();
  Professor professor = new Professor("Ulisses", "Martins", 38);

  print(professor.getInfo());

  /*
    Invocando Getters
  */
  print(professor.nome);
  print(professor.idade);
  print(professor.informacaoSigilosa);

  /*
    Invocando Setters
  */
  professor.nome = "Danielle";
  professor.sobrenome = "Dias";
  professor.informacaoSigilosa = 2030;

  print(professor.getInfo());

  /*
    Usando o Nome Completo
  */
  professor.nomeCompleto = "Gabriel Fulano de Tal";
  print(professor.nome);
  print(professor.sobrenome);

  /*
    Invocando métodos de Pessoa
  */
  professor.pagarImpostos();
  professor.respirar();

  /*
    Invocando métodos do mixin apresentar em público
  */
  professor.apresentacaoPublica();

  /*
    Imprimindo inteiro estático
  */
  print(Professor.inteiroEstatico);
  Professor.inteiroEstatico = 15;
  print(Professor.inteiroEstatico);

  Professor.ensinar();
}
