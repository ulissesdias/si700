import 'package:flutter_bloc/flutter_bloc.dart';

enum CheckBoxEvent { check, uncheck }

enum CheckBoxState { checked, unchecked }

class CheckBoxBloc extends Bloc<CheckBoxEvent, CheckBoxState> {
  CheckBoxBloc() : super(CheckBoxState.unchecked) {
    on<CheckBoxEvent>((event, emit) {
      switch (event) {
        case CheckBoxEvent.check:
          emit(CheckBoxState.checked);
          break;
        case CheckBoxEvent.uncheck:
          emit(CheckBoxState.unchecked);
          break;
      }
    });
  }
}
