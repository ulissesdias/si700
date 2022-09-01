import 'package:flutter/material.dart';

class Column1 extends StatelessWidget {
  const Column1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("1"),
          Text("2"),
          Text("3"),
        ],
      ),
    );
  }
}
