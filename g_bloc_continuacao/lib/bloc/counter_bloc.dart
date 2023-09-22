import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0)) {
    on<CounterEvent>((CounterEvent event, Emitter emit) {
      switch (event) {
        case CounterEvent.increment:
          emit(CounterState(counterValue: state.counterValue + 1));
          break;
        case CounterEvent.decrement:
          emit(CounterState(counterValue: state.counterValue - 1));
          break;
      }
    });
  }
}

/*
 Eventos
*/
enum CounterEvent { increment, decrement }

/*
 Estados
*/
class CounterState {
  int counterValue;
  CounterState({this.counterValue = 0});
}
