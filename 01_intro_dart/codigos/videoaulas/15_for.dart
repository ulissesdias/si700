void main() {
  var soma = 0;
  for (var i = 1; i <= 10; i++) {
    soma += i;
  }

  print(soma);

  var numeros = [1, 2, 3, 4, 5, 100];
  for (var num in numeros) {
    soma += num;
  }
  print(soma);
}
