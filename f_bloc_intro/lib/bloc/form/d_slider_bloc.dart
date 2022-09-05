import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<double, double> {
  SliderBloc() : super(5.0) {
    on<double>((event, emit) {
      emit(event);
    });
  }
}
