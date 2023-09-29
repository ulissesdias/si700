import 'dart:async';

Future<int> g() async {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(const Duration(seconds: 3));
    print("g$i");
  }
  return 0;
}

Future<int> f() async {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(const Duration(seconds: 3));
    print("f$i");
  }
  return 1;
}


void main() {
  var x = f();
  var y = g();
  print(x);
  print(y);

  x.then( (val){print(val);});
  y.then( (val){print(val);});
}
