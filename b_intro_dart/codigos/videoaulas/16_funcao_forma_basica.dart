void helloUlisses() {
  print("Hello Ulisses!");
}

helloSemDeclaracaoRetorno() {
  print("Hello Sem Declarar Retorno");
}

//String helloUser(String user) {
//helloUser(String user) {
helloUser(user) {
  return "Hello $user";
}

void main() {
  print("");
  helloUlisses();
  helloSemDeclaracaoRetorno();
  print(helloUser("Pedro"));
}
