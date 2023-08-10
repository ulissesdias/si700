import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blueAccent,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Column(
          children: [
            Text("Filho Interno"),
            RotatedBox(quarterTurns: 3, child: Text("Romeo Dias"))
          ],
        ));
  }
}
