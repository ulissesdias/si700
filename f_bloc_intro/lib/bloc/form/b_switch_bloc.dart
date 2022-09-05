import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<bool, bool> {
  SwitchBloc() : super(false) {
    on<bool>((event, emit) {
      emit(event);
    });
  }
}
