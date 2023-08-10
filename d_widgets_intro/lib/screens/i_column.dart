import 'package:flutter/material.dart';

class Column2 extends StatelessWidget {
  const Column2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1"),
          Text("2"),
          Text("3"),
        ],
      ),
    );
  }
}
