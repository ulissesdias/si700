import 'dart:io';

Future<int> f() async {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(const Duration(seconds: 5));
    print("f$i");
  }
  return 0;
}

Future<int> g() async {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(const Duration(seconds: 5));
    print("g$i");
  }
  return 1;
}

Future<int> h() async {
  for (int i = 0; i < 3; i++) {
    await Future(() {
      sleep(Duration(seconds: 5));
    });
    print("h$i");
  }
  return 2;
}

chamadas_sem_await() {
  Future<int> x = f();
  Future<int> y = g();
  print(x);
  print(y);

  x.then((int value) {
    print(value);
  });

  y.then((int value) {
    print(value);
  });
}

chama_f_com_await() async {
  int x = await f();
  print(x); // Estava no callback
}

chama_g_com_await() async {
  int y = await g();
  print(y); // Estava no callback
}

chamadas_com_await() {
  print(chama_f_com_await());
  print(chama_g_com_await());
}

void main() {
  //chamadas_sem_await();
  // chamadas_com_await();

  h();
  h();
}
