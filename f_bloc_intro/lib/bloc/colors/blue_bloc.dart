import 'package:flutter_bloc/flutter_bloc.dart';

import 'blue_event.dart';
import 'blue_state.dart';

class BlueBloc extends Bloc<BlueEvent, BlueState> {
  BlueBloc(BlueState initialState) : super(initialState) {
    on<SemBlue>((event, emit) => emit(BlueState(amount: 0)));
    on<PoucoBlue>((event, emit) => emit(BlueState(amount: 50)));
    on<NormalBlue>((event, emit) => emit(BlueState(amount: 150)));
    on<MuitoBlue>((event, emit) => emit(BlueState(amount: 255)));
  }
}
