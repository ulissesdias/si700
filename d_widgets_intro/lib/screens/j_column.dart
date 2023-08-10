import 'package:flutter/material.dart';

class Column3 extends StatelessWidget {
  const Column3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("1"),
        Text("2"),
        Text("3"),
      ],
    );
  }
}
