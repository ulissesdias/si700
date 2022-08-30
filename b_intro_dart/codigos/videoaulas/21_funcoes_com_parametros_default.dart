// O ponto de interrogação em "String" indica que a variável poderá receber
// valores nulos.
void helloTodos(String? user,
    {String? esposa = "Dani",
    String? amiga = "Pri",
    String? cachorro,
    String? gato = "Nini"}) {
  print("Hello $user, $esposa, $amiga, $cachorro, $gato");
}

void main() {
  helloTodos("Ulisses", gato: "Tigre");
  helloTodos("Ulisses", gato: "Tigre", cachorro: "Boró");
  helloTodos("Ulisses", cachorro: "Boró", amiga: "Laura");
}
