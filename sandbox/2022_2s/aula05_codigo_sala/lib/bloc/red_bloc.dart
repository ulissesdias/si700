import 'package:flutter_bloc/flutter_bloc.dart';

enum RedEvent { sem, pouco, normal, muito }

class RedState {
  int amount;
  RedState({this.amount = 0});
}

class RedBloc extends Bloc<RedEvent, RedState> {
  RedBloc() : super(RedState(amount: 0)) {
    on<RedEvent>((event, emit) {
      switch (event) {
        case RedEvent.sem:
          emit(RedState(amount: 0));
          break;
        case RedEvent.pouco:
          emit(RedState(amount: 80));
          break;
        case RedEvent.normal:
          emit(RedState(amount: 150));
          break;
        case RedEvent.muito:
          emit(RedState(amount: 250));
          break;
      }
    });
  }
}
