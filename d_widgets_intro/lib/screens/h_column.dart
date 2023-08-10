import 'package:flutter/material.dart';

class Column1 extends StatelessWidget {
  const Column1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
