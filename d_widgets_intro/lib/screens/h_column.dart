import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Column1 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1"),
          Text("2"),
          Text("3"),
        ],
      ),
    );
  }

  @override
  String getCode() {
    return """const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1"),
          Text("2"),
          Text("3"),
        ],
      ),
    )
""";
  }
}
