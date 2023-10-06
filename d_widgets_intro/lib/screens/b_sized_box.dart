import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class SizedBox2 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return const SizedBox(
      width: 200,
      height: 400,
      child: FittedBox(
        child: Text("Child2"),
      ),
    );
  }

  @override
  String getCode() {
    return """
const SizedBox(
      width: 200,
      height: 400,
      child: FittedBox(
        child: Text("Child2"),
      ),
    )
""";
  }
}
