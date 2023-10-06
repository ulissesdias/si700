import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Container2 extends WidgetWithCode {
  @override
  Widget getWidget() {
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

  @override
  String getCode() {
    return """Center(
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
    ))
""";
  }
}
