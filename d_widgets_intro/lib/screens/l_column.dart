import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Column5 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("1"),
        Expanded(
          // Este filho tomará o espaço excedente.
          child: FittedBox(child: Text("2")),
        ),
        Text("3"),
      ],
    );
  }

  @override
  String getCode() {
    return """const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("1"),
        Expanded(
          // Este filho tomará o espaço excedente.
          child: FittedBox(child: Text("2")),
        ),
        Text("3"),
      ],
    )
""";
  }
}
