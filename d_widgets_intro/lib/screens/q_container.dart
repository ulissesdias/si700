import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Container5 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      height: 240,
      width: 180,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Icon(Icons.alarm),
    ));
  }

  @override
  String getCode() {
    return """Center(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      height: 240,
      width: 180,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: const Icon(Icons.alarm),
    ))
""";
  }
}
