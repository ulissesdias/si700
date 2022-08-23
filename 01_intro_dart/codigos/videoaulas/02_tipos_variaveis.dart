// Declaração de variáveis

// Código principal
void main() {
  // Declaração com os tipos
  String name = "Ulisses";
  int idade = 38;
  double altura = 1.75;
  bool casado = true;

  // Declaração sem identificar os tipos
  var sobrenome = "Dias";
  var nascimento = 1983;
  var solteiro = false;

  print("\n$name, $idade, $altura, $casado \n");
  print("$sobrenome, $nascimento, $solteiro");

  // Descobrir o tipo em tempo de execução

  print(altura is int);
  print(altura is double);
  print(altura.runtimeType);
  print(solteiro.runtimeType);
}
