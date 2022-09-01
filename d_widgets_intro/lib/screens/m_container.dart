import 'package:flutter/material.dart';

class Container1 extends StatelessWidget {
  const Container1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 240,
        width: 180,
        color: Colors.red,
        child: Image.network('https://flutter.github.io/'
            'assets-for-api-docs/assets/widgets/owl-2.jpg'),
      ),
    );
  }
}
