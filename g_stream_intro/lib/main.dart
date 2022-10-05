import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_stream_intro/bloc/internet_bloc.dart';

import 'screens/use_wifi.dart';
import 'screens/use_internet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;

  _stepState(int step) {
    /*
StepState.indexed - The step is active and shows a number.
StepState.error - The step shows an error.
StepState.disabled - The step is disabled.
StepState.editing - The step is active and shows a pencil icon.
StepState.complete - The step is completed.
    */
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  _steps() => [
        Step(
          title: const Text('Internet'),
          content: const InternetForm(),
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text('WiFi'),
          content: const UseWiFi(),
          state: _stepState(1),
          isActive: _currentStep == 1,
        ),
        Step(
          title: const Text('Overview'),
          content: const _Overview(),
          state: _stepState(2),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => InternetBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stepper(
          type: StepperType.horizontal,
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: controls.onStepContinue,
                    child: const Text('NEXT'),
                  ),
                  if (_currentStep != 0)
                    TextButton(
                      onPressed: controls.onStepCancel,
                      child: const Text(
                        'BACK',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                ],
              ),
            );
          },
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue: () {
            setState(() {
              if (_currentStep < _steps().length - 1) {
                _currentStep += 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep -= 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          currentStep: _currentStep,
          steps: _steps(),
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(child: Text('Thank you for your order!')),
      ],
    );
  }
}
