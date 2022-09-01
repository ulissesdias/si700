import 'package:flutter/material.dart';

class Container5 extends StatelessWidget {
  const Container5({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      height: 240,
      width: 180,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Icon(Icons.alarm),
    ));
  }
}
