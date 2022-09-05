import 'package:flutter_bloc/flutter_bloc.dart';

class RadioBloc extends Bloc<int, int> {
  RadioBloc() : super(0) {
    on<int>((event, emit) {
      emit(event);
    });
  }
}
