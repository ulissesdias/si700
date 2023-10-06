import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Center3 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return const Center(
      heightFactor: 3.0,
      child: Icon(Icons.directions_car),
    );
  }

  @override
  String getCode() {
    return """const Center(
      heightFactor: 3.0,
      child: Icon(Icons.directions_car),
    )
""";
  }
}
