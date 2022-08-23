/*
  Dart permite que se importe uma biblioteca com o comando "import". Note a
  seguir a importação da biblioteca matemática para usar a classe Random para
  geração de números aleatórios.
*/
  
import 'dart:math'; // Random

// Isto é um comentário

/*
   Dart é uma linguagem tipada, você pode declarar os tipos
   antes de utilizar. Veja a seguir a declaração de alguns tipos.
*/
String declararTipos() {
  String name = "Ulisses";
  int idade = 25;
  double altura = 1.74;
  bool casado = true;

  return "$name, $idade, $altura, $casado \n";
}

/*
   Você também tem a opção de deixar a inferência automática definir os tipos
   por você. Nesse caso, as variáveis terão tipos em tempo de compilação, mas
   você não precisa dizer explicitamente quais são.
*/
String naoDeclararTipos() {
  var name = "Ulisses";
  var idade = 25;
  var altura = 1.74;
  var casado = true;
  return "$name, $idade, $altura, $casado \n";
}

/*
   Use "is" para verificar se uma variável é de um dado tipo e use runtimeType
   para receber o tipo. A seguir mostramos o uso de ambos os comandos.
*/
String obterTipo() {
  var altura = 1.74;
  return "${altura is int} -- ${altura.runtimeType} \n";
}

/*
    Use a palavra reservada dynamic se desejar mudar o tipo de uma variável em
    tempo de execução. Nesse caso, a variável poderá mudar de tipo sempre que
    necessário. Note a seguir a variável altura mudando de double para string e
    posteriormente para boolean.
*/
String tipoDinamico() {
  dynamic altura = 1.74;

  var tipo1 = altura.runtimeType; // double

  altura = "gigante";
  var tipo2 = altura.runtimeType; // string

  altura = true;
  var tipo3 = altura.runtimeType; // boolean

  return "$tipo1, $tipo2, $tipo3 \n";
}

/*
  Existem duas formas de definir constantes em Dart, usando a palavra reservada
  const e a palavra reservada final. A diferença entre ambos é que const exige a
  definição do valor em tempo de compilação, enquanto que final permite a
  definição em tempo de execução.
*/
String constAndFinal() {
  // Um valor deve ser atribuído em tempo de compilação
  const altura = 1.74;

  // O valor da constante abaixo pode ser atribuído em tempo de execução.
  final agora = DateTime.now();

  return "$altura, $agora \n";
}

/*
  Em Dart podemos converter valores antes de atribuir para uma variável. A
  conversão deve ser, em geral, informada explicitamente. As conversões para
  string usam toString, as conversões para tipos numéricos usam parse.
*/
String conversaoTipo() {
  int idade = 25;
  double altura = 1.74;
  String si = idade.toString();
  String sa = altura.toString();

  int id1 = int.parse(si);
  double al1 = double.parse(sa);
  return "Idade: $id1, Altura: $al1";
}

/*
  Dart disponibiliza uma série de estruturas de dados de maneira pré-definida:
  sequências, dicionários e conjuntos. A seguir exemplificamos o principal uso
  de todas elas.
*/

String estruturaDados() {
  /* List: sequência de valores indexáveis
 pela posição. Podemos mudar valores
 existentes e acrescentar novos. */
  var seq = ["a", "e", "i", 1, 2];
  String k = seq[2].toString(); // k recebe "i"
  String output = "$k \n";
  output += "${seq.runtimeType} \n"; //JSArray<Object>

  seq.add(3);
  output += "$seq \n"; //[a, e, i, 1, 2, 3]
  output += '${seq.indexOf("e")}\n'; // 1

/*
 Map: Pares "chave : valor". Use como uma maneira eficiente de indexar um valor
 por outro valor qualquer.
 */
  var dic = {"key": "value", 1: "one", 3.14: "pi", "flag": true};
  output += "$dic \n";
/* {key: value, 1: one,
   3.14: pi, flag: true} */

  var x = dic["key"]; // Acessos
  output += "$x, ${dic.runtimeType} \n"; //JsLinkedHashMap<Object,Object>

// Acrescentando novos elementos
  dic[2] = "dois";
  dic["dois"] = 2;
  output += "$dic \n";
/*
{key: value, 1: one, 3.14: pi, 
flag: true, 2: dois, dois: 2}
*/


//  No caso a seguir, fazemos um dicionário e já forçamos o tipo da key e do valor
  var docentes = Map<String, int>();
  docentes["Ulisses"] = 5;
  docentes["Meira"] = 3;
  docentes["Marco"] = 1;
  docentes["Gisele"] = 4;
  output += "$docentes \n";
/*
{Ulisses: 5, Meira: 3, 
Marco: 1, Gisele: 4}
*/

  docentes.remove("Marco");
  //print(docentes);
  output += "$docentes \n";
/*
{Ulisses: 5, Meira: 3, Gisele: 4}
*/
  output += "${docentes.keys}, ${docentes.values} \n";
//(Ulisses, Meira, Gisele)

/*
 Set: itens não ordenados dentro do
conjunto e não há elemento repetido
*/
  Set docentesSet = Set();
  docentesSet.addAll(["Ulisses", "Meira", "Leon", "Ulisses"]);
  docentesSet.add("Ana Estela");
  docentesSet.remove("Meira");

  output += "$docentesSet, ${docentesSet.contains("Ulisses")} \n";
// {Ulisses, Leon, Ana Estela}
// true

/* A linha a seguir gera ERRO */
//  print(docentesSet[0]);
// Não é possível indexar Set
  return output;
}

/*
  Os operadores aritméticos em Dart não possuem nenhum segredo e seguem o padrão
  da maioria das linguagens de programação. Veja a seguir vários exemplos.
*/

String operadoresAritmeticos() {
  double a = 23.0;
  double b = 7.0;
  String output = "";

  output += "${a + b} "; // Adição :        30.0
  output += "${a - b} "; // Subtração:      16.0
  output += "${a * b} "; // Multiplicação:  161.0
  output += "${a / b} "; // Divisão: 3.2857142857
  output += "${a ~/ b} "; // Divisão Inteira: 3
  output += "${a % b} \n "; // Resto da Divisão: 2

/*
 Abaixo, o valor impresso é 23, 
 mas o valor é incrementado logo
 em seguida
*/
  output += "${a++} "; // 23
  output += "$a \n"; // 24

/*
 Abaixo, o valor impresso é 25, 
 pois o incremento ocorreu antes
 de retornar o valor da expressão
*/
  output += "${++a} "; // 25
  output += "$a \n"; // 25
  return output;
}

/*
  Em Dart, é possível definir um novo tipo usando a palavra reservada
  enum. Nesse caso, o novo tipo permite apenas um conjunto discreto (enumerável)
  de valores.
*/
enum Disciplinas { SI700, SI202, SI101, SI100 }
String operadoresCondicionais() {
  var disciplina = Disciplinas.SI700;
  String output = "";

  /*
    O comando switch permite decidir entre diversas opções. Você provavelmente
    irá usar de maneira pareada com o comando enum.
  */
  switch (disciplina) {
    case Disciplinas.SI700:
      output += "Ambos os semestres \n";
      break;
    case Disciplinas.SI202:
      output += "Segundo semestre \n";
      break;
    case Disciplinas.SI101:
    case Disciplinas.SI100:
      output += "Primeiro semestre \n";
      break;
  }
// O código acima irá devolver "Ambos os semestres" como output.

/*
 Comando condicional If provavelmente será usado mais vezes.
 */
  var professor = "Ulisses";
  if (professor == "Ulisses" || professor == "Meira") {
    output += "Professor FT/Unicamp";
  } else if (professor == "Zanoni") {
    output += "Professor IC/Unicamp";
  } else {
    output += "Não sei quem é";
  }

/*
 Uma maneira comum de fazer uma condição é usando o operador ? e o operador : para fazer
 uma operação ternária.
 
 Condição ternária:
 */
  bool a = true;
  int b = 1;
  int c = 2;
  var d;

/* Se a for verdadeiro, então
retorna b, caso contrário c. */
  output += "${a ? b : c} \n"; // 1

/* Se d for não nulo retorna d,
caso contrário b */
  output += "${d ?? b} \n"; // 1

  return output;
}

/*
 Para laços de repetição, temos os comandos "for" e "while" seguindo um padrão
 comum nas linguagens baseadas em C. Temos também um "for" baseado em python.
*/
String lacosRepeticao() {
  String output = "\n";

/* Loop while */
  int count = 0;
  while (count < 4) {
    output += "Count = $count, ";
    count = count + 1;
  }
  output += "\n Resultado do While \n";

/* Loop For Convencional */
  var soma = 0;
  for (var i = 1; i <= 10; i++) {
    soma += i;
  }
  output += "For Convencional: $soma \n"; // 55

// Iteração sobre tipos estruturados
  var numeros = [1, 2, 3, 4, 5];
  for (var num in numeros) {
    soma += num;
  }
  output += "For sobre lista: $soma \n"; // 70
  return output;
}

/*
   Funções: devemos observar:

   1 - Argumentos podem definir parâmetros opcionais ou obrigatórios.
   2 - O tipo de retorno  é opcional
   3 - Todas as funções retornam alguma coisa. Um "return null" está implícito
       se nada for dito.
   4 - Não precisa declarar tipo dos parâmetros
*/
findArea(altura, int largura) {
  return "findArea: ${altura * largura} \n";
}

findPerimetro(int altura, int largura) =>
    "findPerimetro: ${2 * (altura + largura)} \n";

doSomething(a, b, funcao) => "doSomething: ${funcao(a, b)}";

parametrosOpcionaisPosicionais(a, b, [c, d]) {
  return "Obrigatorios: $a $b, Opcionais1: $c, $d \n";
}

parametrosOpcionaisNomeados(a, b, {c, d}) {
  return "Obrigatorios: $a $b, Opcionais2: $c, $d \n";
}

parametrosOpcionaisDefault(a, b, {c = "default", d = "default"}) {
  return "Obrigatorios: $a, $b, Opcionais3: $c, $d \n";
}

/*
   Tratamento de Exceções
*/
/*
  Lançando Exceções: vamos criar um método que lança exceções usando a palavra
  reservada "throw". Imagine este método como se fosse uma função pouco
  confiável que pode lançar pelo menos três tipos de exceções.
*/
lancandoExcecoes() {
  Random random = Random();
  int randomNumber = random.nextInt(3); // gera 0, 1 ou 2
  if (randomNumber == 0) {
    // Nunca faça isso.
    throw "Lancei algo em String";
  } else if (randomNumber == 1) {
    throw const FormatException("Lancei um FormatException");
  } else {
    throw Exception("Lancei um Exception");
  }
}

/*
  Para capturar a exceção, usamos "catch" ou "on". O bloco onde o erro pode
  ocorrer deve estar no escopo do comando "try".
*/
capturandoExcecoes() {
  try {
    lancandoExcecoes();
    /* Pode-se usar "on" se o objeto não importa, apenas
    a classe dele */
  } on FormatException {
    // Trocar por print
    return ("Capturei um FormatException \n");
  } on Exception catch (obj) {
    return ("Capturei um Exception: $obj \n");
  } catch (obj) {
    return ("Capturei algo e não importa o tipo: $obj \n");
  } finally {
    /* Um bloco a ser executado sempre  */
  }
}



void main() {
  
  /*
  Imprimindo o Hello World
  */
  print("Hello World");

  /*
  Declarando e convertendo tipos
  */
  print(declararTipos());
  print(naoDeclararTipos());
  print(tipoDinamico());
  print(conversaoTipo());

  /*
  Utilizando Estruturas de Dados
  */
  print(estruturaDados());

  /*
  Operadores
  */
  print(operadoresCondicionais());

  print(lacosRepeticao());

  print(findArea(5, 10));
  print(findPerimetro(5, 10));
//  helloUser("Lucas");

  print(doSomething(5, 10, findArea));
  print(doSomething(5, 10, findPerimetro)); 

  print(doSomething("a", "b", (x, y) {
    return "${x + y}";
  }));

  print(doSomething("a", "b", (x, y) => "$x, $y"));

  print("");

  print(parametrosOpcionaisPosicionais(5, 10));
  print(parametrosOpcionaisPosicionais(5, 10, 15));
  print(parametrosOpcionaisPosicionais(5, 10, 15, 20));

  // print(parametrosOpcionaisPosicionais(5));
  // print(parametrosOpcionaisPosicionais(5, 10, 15,20,25));

  print(parametrosOpcionaisNomeados(5, 10));
  print(parametrosOpcionaisNomeados(5, 10, d: 15));
  print(parametrosOpcionaisNomeados(5, 10, d: 15, c: 20));

  print("");
  print(parametrosOpcionaisDefault(5, 10));
  print(parametrosOpcionaisDefault(5, 10, d: 15));
  print(parametrosOpcionaisDefault(5, 10, d: 15, c: 20));

  print(capturandoExcecoes());

}
