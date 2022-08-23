void main() {
  var seq = ["a", "e", "i", 1, 2];
  print("Segundo Elemento: ${seq[1]}");
  print(seq.runtimeType);

  seq.add(3);
  print(seq);
  print(seq.indexOf("e"));

  seq.forEach(print);
}
