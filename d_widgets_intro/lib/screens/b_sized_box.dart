import 'package:flutter/material.dart';

class SizedBox2 extends StatelessWidget {
  const SizedBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 400,
      child: FittedBox(
        child: Text("Child2"),
      ),
    );
  }
}
