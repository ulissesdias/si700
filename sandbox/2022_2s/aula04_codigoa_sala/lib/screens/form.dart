import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool checkBoxValue = false;
  bool switchValue = false;
  double sliderValue = 4;
  int radioValue = 3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: checkBoxValue,
              onChanged: (bool? inValue) {
                if (inValue != null) {
                  setState(() {
                    checkBoxValue = inValue;
                  });
                }
              },
            ),
            const Text("Selecione ou não")
          ],
        ),
        Switch(
          value: switchValue,
          onChanged: (bool inValue) {
            setState(() {
              switchValue = inValue;
            });
          },
        ),
        Slider(
            min: 1,
            max: 15,
            value: sliderValue,
            onChanged: (double inValue) {
              setState(() {
                sliderValue = inValue;
              });
            }),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: radioValue,
              onChanged: updateRadio,
            ),
            Radio(
              value: 2,
              groupValue: radioValue,
              onChanged: updateRadio,
            ),
            Radio(
              value: 3,
              groupValue: radioValue,
              onChanged: updateRadio,
            ),
            Radio(
              value: 4,
              groupValue: radioValue,
              onChanged: updateRadio,
            ),
            Radio(
              value: 5,
              groupValue: radioValue,
              onChanged: updateRadio,
            ),
          ],
        )
      ],
    );
  }

  updateRadio(int? inValue) {
    if (inValue != null) {
      setState(() {
        radioValue = inValue;
      });
    }
  }
}
