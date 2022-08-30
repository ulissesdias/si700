void main() {
  // Palavra reservada const
  const altura = 1.74; // Valor conhecido em tempo de compilação.
  print("$altura");

  final idade = 38; // Valor conhecido em tempo de compilação ou execução.
  print("Altura = $altura; Idade = $idade");

  final agora = DateTime.now();
  print(agora);
}
