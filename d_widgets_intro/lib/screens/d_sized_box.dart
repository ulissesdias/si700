import 'package:flutter/material.dart';

class SizedBox4 extends StatelessWidget {
  const SizedBox4({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: const FittedBox(
        child: Text("Child2"),
      ),
    );
  }
}
