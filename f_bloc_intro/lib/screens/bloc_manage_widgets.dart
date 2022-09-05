import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/form/a_checkbox_bloc.dart';
import '../bloc/form/b_switch_bloc.dart';
import '../bloc/form/c_radio_bloc.dart';
import '../bloc/form/d_slider_bloc.dart';

class WidgetsBloc extends StatelessWidget {
  const WidgetsBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [myCheckbox(), const Text("Checkbox")]),
        Row(children: [mySwitch(), const Text("Switch")]),
        Row(children: [const Text("Slider"), mySlider()]),
        Row(children: [myRadio(1), const Text("Radio 1")]),
        Row(children: [myRadio(2), const Text("Radio 2")]),
        Row(children: [myRadio(3), const Text("Radio 3")]),
        Row(children: [myRadio(4), const Text("Radio 4")]),
      ],
    );
  }

  Widget myCheckbox() {
    return BlocBuilder<CheckBoxBloc, CheckBoxState>(
        builder: (context, state) => Checkbox(
            value: state == CheckBoxState.checked ? true : false,
            onChanged: (bool? inValue) {
              if (inValue != null) {
                if (inValue) {
                  BlocProvider.of<CheckBoxBloc>(context)
                      .add(CheckBoxEvent.check);
                } else {
                  BlocProvider.of<CheckBoxBloc>(context)
                      .add(CheckBoxEvent.uncheck);
                }
              }
            }));
  }

  Widget mySwitch() {
    return BlocBuilder<SwitchBloc, bool>(
        builder: (context, state) => Switch(
            value: state,
            onChanged: (bool inValue) {
              BlocProvider.of<SwitchBloc>(context).add(inValue);
            }));
  }

  Widget mySlider() {
    return BlocBuilder<SliderBloc, double>(
        builder: (context, state) => Slider(
            min: 0,
            max: 20,
            value: state,
            onChanged: (double inValue) {
              BlocProvider.of<SliderBloc>(context).add(inValue);
            }));
  }

  Widget myRadio(int value) {
    return BlocBuilder<RadioBloc, int>(
        builder: (context, state) => Radio(
              groupValue: state,
              onChanged: (int? inValue) {
                if (inValue != null) {
                  BlocProvider.of<RadioBloc>(context).add(inValue);
                }
              },
              value: value,
            ));
  }
}
