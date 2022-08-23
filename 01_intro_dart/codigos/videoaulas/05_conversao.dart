void main() {
  int idade = 38;
  double altura = 1.75;
  print("Idade: $idade; Altura: $altura");

  int alturaInt = altura.toInt();
  double idadeDouble = idade.toDouble();
  print("Idade: $idadeDouble; Altura: $alturaInt");

  String idadeString = idade.toString();
  String alturaString = altura.toString();
  print("Idade: $idadeString; Altura: $alturaString");

  int idadeConvertida = int.parse(idadeString);
  double alturaConvertida = double.parse(alturaString);
  print("Idade: $idadeConvertida; Altura: $alturaConvertida");
}
