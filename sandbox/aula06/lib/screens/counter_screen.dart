import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    CounterBloc lbloc = BlocProvider.of<CounterBloc>(context);
                    return BlocProvider.value(
                        value: lbloc, child: const CounterScreen());
                  }));
                },
                child: const Text("Nova Tela"))
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
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CounterEvent.increment);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
