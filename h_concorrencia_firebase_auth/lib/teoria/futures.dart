import 'dart:developer';
import 'dart:io';

Future<int> f() async {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(const Duration(seconds: 5));
    log("f$i");
  }
  return 0;
}

Future<int> g() async {
  for (int i = 0; i < 3; i++) {
    await Future.delayed(const Duration(seconds: 5));
    log("g$i");
  }
  return 1;
}

Future<int> h() async {
  for (int i = 0; i < 3; i++) {
    await Future(() {
      sleep(const Duration(seconds: 5));
    });
    log("h$i");
  }
  return 2;
}

chamadasSemAwait() {
  Future<int> x = f();
  Future<int> y = g();
  log("$x");
  log("$y");

  x.then((int value) {
    log("$value");
  });

  y.then((int value) {
    log("$value");
  });
}

chamaFComAwait() async {
  int x = await f();
  log("$x"); // Estava no callback
}

chamaGComAwait() async {
  int y = await g();
  log("$y"); // Estava no callback
}

chamadasComAwait() {
  log(chamaFComAwait());
  log(chamaGComAwait());
}

void main() {
  //chamadasSemAwait();
  // chamadasComAwait();

  h();
  h();
}
