import 'package:flutter/material.dart';

class Column5 extends StatelessWidget {
  const Column5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("1"),
        Expanded(
          // Este filho tomará o espaço excedente.
          child: FittedBox(child: Text("2")),
        ),
        Text("3"),
      ],
    );
  }
}
