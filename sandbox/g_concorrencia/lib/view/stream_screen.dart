import 'package:flutter/material.dart';
import '../teoria/streams.dart';

class StreamsAsyncStar extends StatelessWidget {
  const StreamsAsyncStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        generateListenButton(context),
        generateListenButtonWithFunctionGenerator(context),
        generateListenButtonInBroadcast(context),
        generateListenButtonWithFor(context),
        generateListenButtonWithMapAndFilder(context)
      ],
    );
  }

  Widget generateListenButton(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          /*
              Note que há um delay entre o início das emissões e a chegada 
              do receptor.
          */
          await Future.delayed(const Duration(seconds: 10));

          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $data"));
          });
          /*
           O código abaixo não funciona, dado que só pode existir um
           receptor
           */
          //numberStream.listen((event) {});
        },
        child: const Text("Listen Stream"));
  }

  Widget generateListenButtonWithFunctionGenerator(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir

          Stream<int> numberStream = streamEnviaDados();

          /*
              Note que há um delay entre o início das emissões e a chegada 
              do receptor.
          */
          await Future.delayed(const Duration(seconds: 10));

          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $data"));
          });

          /*
           O código abaixo não funciona, dado que só pode existir um
           receptor
           */
          //numberStream.listen((event) {});
        },
        child: const Text("Listen Stream With Function Generator"));
  }

  Widget generateListenButtonInBroadcast(context) {
    return ElevatedButton(
        onPressed: () async {
          /*
           Emissor começa a emitir, mas note que houve uma configuração para que
           a emissão ocorra em broodcast.
           */
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream =
              numberStreamCreator.stream.asBroadcastStream();

          /*
          O primeiro receptor chega e passa a consumir os dados.
          */
          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received1: $data"));
          });

          /*
          O segundo receptor demora ainda 10 segundos para chegar, não estando
          então desde o início
          */
          await Future.delayed(const Duration(seconds: 10));
          numberStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received2: $data"));
          });

          /*
          Execute o código e verifique se você entende o resultado
          */
        },
        child: const Text("Listen Stream In Broadcast"));
  }

  Widget generateListenButtonWithFor(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          /*
          Abaixo uma maneira de ler os dados da stream dentro de um for.
          */
          int total = 0;
          await for (int value in numberStream) {
            total += value;
            ScaffoldMessenger.of(context).showSnackBar(
                generateSnackBar("Recebido $value -- Soma: $total"));
          }
        },
        child: const Text("Listen Stream With For"));
  }

  Widget generateListenButtonWithMapAndFilder(context) {
    return ElevatedButton(
        onPressed: () async {
          // Emissor começa a emitir
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();
          Stream<int> numberStream = numberStreamCreator.stream;

          /*
          Note a seguir que nem todos os dados da stream serão consumidos, 
          então a cláusula "where" serve para fazer a filtragem. 
          */
          Stream<int> filteredStream =
              numberStream.where((data) => data % 2 == 0);

          /*
          Note que queremos "ler" uma stream de strings, então o que fizemos
          a seguir foi colocar o "map" para fazer a conversão necessária
          */
          Stream<String> mappedStream = filteredStream
              .map((data) => "$data ao quadrado é ${data * data}");

          mappedStream.listen((data) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $data"));
          });
        },
        child: const Text("Listen Stream With Map and Filter"));
  }

  SnackBar generateSnackBar(String text) {
    return SnackBar(
      backgroundColor: Colors.orange,
      duration: const Duration(seconds: 1),
      content: Text(text),
    );
  }
}
