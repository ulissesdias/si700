void main() {
  bool a = true;
  bool b = false;
  bool c = true;
  bool d = false;

  print("");
  print(a && b);
  print(a && c);
  print(b && d);

  print("");
  print(a || b);
  print(a || c);
  print(b || c);
  print(b || d);

  print("");
  print(!a);
  print(!b);
}
