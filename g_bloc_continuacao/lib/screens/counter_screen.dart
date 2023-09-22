import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_bloc_continuacao/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
                builder: (BuildContext context, CounterState state) {
              return Text(
                '${state.counterValue}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            /*
              Usando o Navigator de forma anônima
            */
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    // Abaixo daria um erro, dado que o CounterBloc não
                    // foi passado para a nova tela.
                    //return const CounterScreen();

                    // Abaixo seria um erro de semânica
                    // CounterBloc lCounter = CounterBloc();
                    CounterBloc lCounter =
                        BlocProvider.of<CounterBloc>(context);

                    return BlocProvider.value(
                        value: lCounter, child: const CounterScreen());
                  }));
                },
                child: const Text("Nova Route")),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterEvent.decrement);
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.exposure_minus_1),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_plus_1),
          ),
        ],
      ),
    );
  }
}
