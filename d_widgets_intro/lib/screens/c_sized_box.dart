import 'package:flutter/material.dart';

class SizedBox3 extends StatelessWidget {
  const SizedBox3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: FittedBox(
        child: Text("Child2"),
      ),
    );
  }
}
