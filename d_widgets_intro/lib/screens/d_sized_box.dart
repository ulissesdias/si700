import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class SizedBox4 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: const FittedBox(
        child: Text("Child2"),
      ),
    );
  }

  @override
  String getCode() {
    return """ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100),
      child: const FittedBox(
        child: Text("Child2"),
      ),
    )
""";
  }
}
