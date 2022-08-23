// O ponto de interrogação em "String" indica que a variável poderá receber
// valores nulos.
void helloAmigos(String? user, {String? esposa, String? amiga}) {
  print("Hello $user --> Esposa: $esposa; Amiga: $amiga");
}

void main() {
  print("");
  helloAmigos("Ulisses");
  helloAmigos("Ulisses", esposa: "Dani");
  helloAmigos("Ulisses", amiga: "Pri");
  helloAmigos("Ulisses", esposa: "Dani", amiga: "Pri");
  print("");
  helloAmigos("Ulisses", amiga: "Pri", esposa: "Dani");
}
