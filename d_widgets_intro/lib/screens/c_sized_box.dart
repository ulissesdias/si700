import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class SizedBox3 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return const SizedBox.expand(
      child: FittedBox(
        child: Text("Child2"),
      ),
    );
  }

  @override
  String getCode() {
    return """const SizedBox.expand(
      child: FittedBox(
        child: Text("Child2"),
      ),
    )
""";
  }
}
