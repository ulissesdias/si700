import 'package:flutter/material.dart';

class Container4 extends StatelessWidget {
  const Container4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.bottomCenter,
      height: 240,
      width: 180,
      color: Colors.red,
      child: const Icon(Icons.alarm),
    ));
  }
}
