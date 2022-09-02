import 'package:flutter/material.dart';

class Container3 extends StatelessWidget {
  const Container3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      height: 240,
      width: 180,
      color: Colors.red,
      transform: Matrix4.rotationZ(0.1),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network('https://flutter.github.io/'
            'assets-for-api-docs/assets/widgets/owl-2.jpg'),
      ),
    ));
  }
}
