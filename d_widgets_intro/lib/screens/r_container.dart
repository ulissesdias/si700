import 'package:flutter/material.dart';

class Container6 extends StatelessWidget {
  const Container6({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 20),
        ],
        gradient: const LinearGradient(colors: [
          Colors.blue,
          Colors.red,
          Colors.yellow,
          Colors.green,
        ]),
      ),
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(40),
      child: const SizedBox(
        width: double.infinity,
        height: 100,
        child: Text(
          "Romeo",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
