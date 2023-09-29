import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g_concorrencia/teoria/fibonacci.dart';

class FutureScreen extends StatelessWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        waitProcessoLongoComMuitaCPU(context),
        waitProcessoLongoSemMuitaCPU(context),
        waitNovoIsolateProcessoLongoComMuitaCPU(context)
      ],
    );
  }

  Future<int> processoLongoComMuitaCPU() {
    return Future(() {
      return fibonacci(45);
    });
  }

  Future<int> processoLongoSemMuitaCPU() async {
    await Future.delayed(const Duration(seconds: 5));
    return 10;
  }

  Future<int> novoIsolateProcessoLongoComMuitaCPU() {
    // Abertura de um novo Isolate
    return compute(fibonacci, 45);
  }

  Widget waitProcessoLongoComMuitaCPU(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          //fibonacci(40);
          processoLongoComMuitaCPU().then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Finalizou o Processo")));
          });

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Finalizou o Código do Botão")));
        },
        child: const Text(
          "ProcessoLongoComMuitaCPU",
        ));
  }

  Widget waitProcessoLongoSemMuitaCPU(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          processoLongoSemMuitaCPU().then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Finalizou o Processo")));
          });

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Finalizou o Código do Botão")));
        },
        child: const Text(
          "ProcessoLongoSemMuitaCPU",
        ));
  }

  Widget waitNovoIsolateProcessoLongoComMuitaCPU(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          novoIsolateProcessoLongoComMuitaCPU().then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Finalizou o Processo")));
          });

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Finalizou o Código do Botão")));
        },
        child: const Text(
          "NovoIsolateProcessoLongo",
        ));
  }
}
