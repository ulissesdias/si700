import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Center1 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return const Center(
      child: Icon(
        Icons.directions_car,
      ),
    );
  }

  @override
  String getCode() {
    return """const Center(
      child: Icon(
        Icons.directions_car,
      ),
    )
""";
  }
}
