import 'package:flutter/material.dart';

class Container2 extends StatelessWidget {
  const Container2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      height: 240,
      width: 180,
      color: Colors.red,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network('https://flutter.github.io/'
            'assets-for-api-docs/assets/widgets/owl-2.jpg'),
      ),
    ));
  }
}
