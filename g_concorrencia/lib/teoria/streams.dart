// Classe que é uma Stream
import 'dart:async';

class NumberStreamCreator {
  StreamController<int> _controller = StreamController<int>();
  int _count = 0;

  NumberStreamCreator() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      _count++;
      _controller.sink.add(_count);
      if (_count > 10) {
        timer.cancel();
      }
    });
  }

  Stream<int> get stream => _controller.stream;
}

// Função que é uma Stream
Stream<int> streamEnviaDados() async* {
  for (int i = 0; i <= 10; i++) {
    await Future.delayed(Duration(seconds: 3));
    yield i;
  }
}

recebeDadosDaStream(int dadoRecebido) {
  print("Recebi: $dadoRecebido");
}

void main() {
  // Stream<int> stream = streamEnviaDados();
  // stream.listen(recebeDadosDaStream);

  NumberStreamCreator numberStreamCreator = NumberStreamCreator();
  numberStreamCreator.stream.listen(recebeDadosDaStream);
}
