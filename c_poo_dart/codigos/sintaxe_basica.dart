/*
  A palavra reservada "class" é usada para gerar classes em dart, de modo
  semelhante a outras linguagens de programação.  A seguir, temos uma classe
  sendo gerada. A classe a seguir não tem utilidade, dado que não tem nenhum
  código associado.
*/

class SemUtilidade{}

/*
  Para instanciar um objeto de uma classe, podemos usar a palavra reservada
  "new". Como o uso de "new" é opcional, iremos evitar durante a disciplina.

  Note no código a seguir, o padrão de maiúsculas e minúsculas para classes e
objetos.
*/

instanciandoSemUtilidade(){
  SemUtilidade semUtilidade1 = new SemUtilidade();
  SemUtilidade semUtilidade2 = SemUtilidade();
}

/*
 A classe a seguir já declara alguns elementos a mais. Por exemplo, temos alguns
 atributos. Como nada é feito com os atributos, a classe tem pouca utilidade.
*/

class PoucaUtilidade{
  String atributo1 = "";
  String _atributo2 = "";
  /*
    O atributo "_atributo2" inicia com um _. Isso quer dizer que é um atributo
    privado. Em outras palavras, só poderá ser acessado diretamente de dentro
    deste arquivo ".dart". Note assim que os conceitos de visibilidade em "dart"
    diferem dos conceitos de visibilidade em outras linguagens.
  */
}

/*
  A classe a seguir é um pouco mais útil, dado que já possui os elementos
  principais de uma classe, que seriam: atributos, getters, setters, métodos e
  construtores definidos. No próprio código explicamos cada um desses
  construtores.
*/
  
// Observe que a classe foi marcada com a palavra reservada "abstract". Isso
// quer dizer que não pode gerar instâncias.
abstract class Pessoa {
  /*
  Nesta disciplina, tentaremos seguir uma ordem ao criar classes:
  
  1 - Atributos
  2 - Getters 
  3 - Setters
  4 - Construtores
  5 - Demais métodos
  
  */
  
  /*
  1 - Atributos
  */
  String _nome = "";
  String _sobrenome = "";

  /*
  2 - Getters: permitem que criemos novos campos (propriedades) acessíveis de
  fora da classe. Por exemplo, criamos o campo "nomeCompleto" a seguir. Nesse
  caso, dada uma instância "p" de "Pessoa", podemos invocar p.nomeCompleto
  */
  String get nomeCompleto {
    return "$_nome $_sobrenome";
  }

  /*
  Como "_nome" é um atributo privado, só poderá ser acessado de dentro deste
  arquivo ".dart". Nesse caso, é interessante aumentar a visibilidade criando o
  campo "nome". Neste ponto do código, podemos adicionar algum tipo de controle
  se for preciso.
  */
  String get nome {
    return _nome;
  }

  String get sobrenome {
    return _sobrenome;
  }

  /*

  3 - Setters: os setters permitem criar novos campos para recebimento de novos
  valores. Por exemplo, anteriormente criamos um getter "nome". Nesse caso, dada
  uma instância "p", podemos fazer:

  x = p.nome;

  Entretanto, apenas como getter não será possível fazer:

  p.nome = "Ulisses";

  Para tanto, precisamos criar um setter.

  */

  set nome(n) {
    _nome = n;
  }

  set sobrenome(n){
    _sobrenome = n;
  }

  // Tente sempre criar um setter para todo getter, dado que a ausência do
  // setter pode deixar confusos os programadores que usarão as suas classes.

  /*
  4 - Construtores: vamos criar um construtor que simplesmente inicializa os
  atributos.
  */
  Pessoa(){
    _nome = "Fulano";
    _sobrenome = "de Tal";
  }

  
  /*
  5 - Demais métodos: como a nossa classe é abstrata, podemos criar métodos
  abstratos. Além disso, como em toda e qualquer classe (abstrata ou não),
  podemos criar métodos concretos. A seguir temos exemplos de ambos.
  */
  displayInfo(); // Método Abstrato

  displayName() { // Métodos concreto
    return "Nome: $_nome";
  }
}  

/*
  Como pessoa é uma classe abstrata, precisaremos usar herança para podermos
  criar classes concretas, o que nos permitiria gerar instâncias. A seguir,
  geramos a classe concreta "Professor", dado que um professor é uma pessoa.

  A palavra reservada "extends" indica a direção da herança.
*/
class Professor extends Pessoa { 
  /*
   1 - Atributos: um professor terá os atributos herdados de "Pessoa", além dos
   atributos a seguir.
   */   
  String _vinculo = "";
  String _nivel = "";

  /*
  2 - Getters: não vamos criar getters aqui.
  */

  /*
  3 - Setters: não vamos criar setters aqui.
  */

  /*
  4 - Construtores: os principais tipos de construtores são: (i) construtor sem
  nome e (ii) construtor com nome. Em uma classe, só pode existir no máximo um
  construtor sem nome. Se você não definir nenhum construtor, então um
  construtor sem nome e sem parâmetros será definido automaticamente para você.
  */

  // A seguir temos um construtor sem nome e com parâmetros.
  Professor(n, sn, vn, nvl) {
    _nome = n;
    _sobrenome = sn;
    _vinculo = vn;
    _nivel = nvl;
  }

  /*
   Como já temos um construtor sem nome, não podemos adicionar por exemplo o
   código a seguir:

   Professor(){}
  */

  // A seguir temos um construtor com nome.
  Professor.contratar(n, sn) {
    _nome = n;
    _sobrenome = sn;
    _vinculo = "Esunicamp";
    _nivel = "MS3.1";
  }

  /*
  5 - Demais métodos: a classe mãe "Pessoa" tinha um método abstrato que somos
  obrigados a implementar. Uma implementação possível seria:
  */
  @override
  displayInfo() {
    return """
    Nome: $_nome;
    Sobrenome: $_sobrenome;
    Vínculo: $_vinculo;
    Nível: $_nivel;
    """;
  }
}


/*
Vamos agora instanciar a classe Professor e invocar todos os seus elementos:
*/

instanciandoProfessor(){
  // Instanciando pelo construtor sem nome.
  Professor professor = Professor("Ulisses", "Dias", "CLT", "MS3.2");

  // Como estamos no mesmo arquivo ".dart" da declaração da classe, podemos
  // acessar os atributos privados;
  print("Atributo privado: ${professor._nome}");

  // Também podemos acessar os campos criados com "getters" na classe mãe.
  print("Campos de Getters: ${professor.nomeCompleto}");

  // Também podemos alterar os atributos privados diretamente por estarmos no
  // mesmo arquivo ".dart".
  professor._nome = "Zanoni";
  print(professor.nomeCompleto);

  // Também podemos passar valores aos setters:
  professor.nome = "Ulisses";
  print(professor.nomeCompleto);

  // Podemos invocar o método implementado na classe mãe.
  print(professor.displayName());

  // Também podemos invocar o método declarado na classe mãe e implementado na
  // classe filha.
  print(professor.displayInfo());
}

/*
   Como alunos também são pessoas, vamos criar uma classe aluno e usar alguns
   elementos que diferem do que foi visto acima.
*/
class Aluno extends Pessoa{
  int idade = 25;

  // Observe este construtor exótico. Ele recebe dois parâmetros e imediatamente
  // insere nos atributos.
  Aluno.exotico1(this.idade);

  // Neste outro construtor, criamos um corpo para os outros atributos.
  Aluno.exotico2(n, sn, this.idade) {
    _nome = n;
    _sobrenome = sn;
  }
  
    @override
  displayInfo() {
    return """
    Nome: $_nome;
    Sobrenome: $_sobrenome;
    Idade: $idade;
    """;
  }
}

// Vamos criar uma nova classe que herda de professor para vermos novos detalhes.
class ProfessorEmergencial extends Professor {

  // Observe o construtor sem nome a seguir. Ele recebe dois parâmetros e
  // informa imediatamente qual construtor da classe mãe deve ser invocado antes
  // de realizar o código do construtor atual, o que obedece as regras da
  // orientação a objetos.
  ProfessorEmergencial(n, sn) : super.contratar(n, sn) {
    print("Invoquei construtor na classe filha");
  }

  // O construtor com nome a seguir invoca o construtor sem nome da classe mãe
  ProfessorEmergencial.comNom(n, sn, vn, nvl) : super(n, sn, vn, nvl);
}


/*
  Em Dart não há uma palavra reservada para interfaces, mas podemos usar
  qualquer classe como se fosse interface com a palavra reservada
  "implements". Nesse caso, não herdamos nenhum comportamento e somos obrigados
  a implementar todos os métodos. Observe que precisamos implementar todos os
  getters e setters novamente, dado que eles também são métodos.
*/

class PessoaImplementada implements Pessoa {
  String _nome = "";
  String _sobrenome = "";
  
  String get nomeCompleto {
    return "";
  }

  String get sobrenome {
    return "";
  }

  String get nome {
    return "";
  }

  set nome(n) {
  }

  set sobrenome(n){
  }
  
  displayInfo(){
    print("Um método abstrato sendo concretizado");
  }

  displayName(){
    print("Tive que implementar novamente o método concreto");
  }

}

main(){
  instanciandoSemUtilidade();
  instanciandoProfessor();
}
