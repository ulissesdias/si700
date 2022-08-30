void helloFamilia(user, [esposa]) {
  print("Hello $user e $esposa");
}

void muitosParametros(obrig1, obrig2, [opc1, opc2, opc3]) {
  print("Obrigatórios: $obrig1, $obrig2; Opcionais: $opc1, $opc2, $opc3");
}

void main() {
  print("");
  helloFamilia("Ulisses", "Danielle");
  helloFamilia("Ulisses");
  print("");
  muitosParametros("Primeiro", "Segundo", "Terceiro", "Quarto");
}
