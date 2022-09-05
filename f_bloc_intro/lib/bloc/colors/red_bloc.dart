import 'package:flutter_bloc/flutter_bloc.dart';

import 'red_event.dart';
import 'red_state.dart';

class RedBloc extends Bloc<RedEvent, RedState> {
  RedBloc(RedState initialState) : super(initialState) {
    on<SemRed>((event, emit) => emit(RedState(amount: 0)));
    on<PoucoRed>((event, emit) => emit(RedState(amount: 50)));
    on<NormalRed>((event, emit) => emit(RedState(amount: 150)));
    on<MuitoRed>((event, emit) => emit(RedState(amount: 255)));
  }
}
