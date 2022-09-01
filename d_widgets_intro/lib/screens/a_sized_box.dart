import 'package:flutter/material.dart';

class SizedBox1 extends StatelessWidget {
  const SizedBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 400,
      child: Text("Child2"),
    );
  }
}
