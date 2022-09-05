import 'package:flutter_bloc/flutter_bloc.dart';

import 'green_event.dart';
import 'green_state.dart';

class GreenBloc extends Bloc<GreenEvent, GreenState> {
  GreenBloc(GreenState initialState) : super(initialState) {
    on<SemGreen>((event, emit) => emit(GreenState(amount: 0)));
    on<PoucoGreen>((event, emit) => emit(GreenState(amount: 50)));
    on<NormalGreen>((event, emit) => emit(GreenState(amount: 150)));
    on<MuitoGreen>((event, emit) => emit(GreenState(amount: 255)));
  }
}
