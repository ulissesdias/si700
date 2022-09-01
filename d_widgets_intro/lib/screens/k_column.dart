import 'package:flutter/material.dart';

class Column4 extends StatelessWidget {
  const Column4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("1"),
        Text("2"),
        Text("3"),
      ],
    );
  }
}
