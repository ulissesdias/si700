void main() {
  Set docentes = Set();
  docentes.addAll(["Ulisses", "Meira", "Leon", "Ulisses"]);
  print(docentes);
  docentes.add("Ana");
  print(docentes);
  docentes.remove("Meira");
  print(docentes);

  // Contains
  print(docentes.contains("Ulisses"));
  print(docentes.contains("Marco"));
  print(docentes.containsAll(["Ulisses", "Leon"]));
  print(docentes.containsAll(["Ulisses", "Marco"]));

  // Tentando Indexar
  //print(docentes[0]);
}
