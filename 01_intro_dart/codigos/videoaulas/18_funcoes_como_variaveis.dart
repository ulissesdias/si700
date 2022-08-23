int soma(a, b) {
  return a + b;
}

// Função que recebe outra função como parâmetro
doSomething(paramA, paramB, funcao) {
  return funcao(paramA, paramB);
}

void main() {
  var x = doSomething(10, 15, soma);
  print(x);

  var y = doSomething(10, 15, (var1, var2) {
    return var1 * var2;
  });
  print(y);

  var z = doSomething(10, 15, (var1, var2) => 2 * var1 - var2);
  print(z);
}
