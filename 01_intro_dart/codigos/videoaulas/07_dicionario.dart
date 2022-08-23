void main() {
  // Chave --> Valor
  var dic = {"key": "value", 1: "one", 3.14: "pi", "flag": true};
  print(dic);

  print(dic["key"]);
  print(dic.runtimeType);

  // Acrescentar
  dic[2] = "dois";
  dic["dois"] = 2;
  print(dic);

  dic.forEach((key, val) {
    print("--> $key: $val");
  });

  print("\n\n");
  var docentes = Map<String, int>();
  docentes["Ulisses"] = 5;
  docentes["Meira"] = 3;
  print(docentes);
  docentes.remove("Meira");
  print(docentes);
  docentes.remove("Marco");

  docentes["Ana"] = 5;
  print(docentes.keys);
  print(docentes.values);
}
