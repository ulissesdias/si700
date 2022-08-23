int findArea(int altura, int largura) => altura * largura;

int findAreaMaior(int altura, int largura) {
  return altura * largura;
}

main() {
  int x = findArea(10, 12);
  int y = findAreaMaior(10, 12);
  print("\n $x, $y");
}
