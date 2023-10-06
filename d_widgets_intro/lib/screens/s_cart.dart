import 'package:flutter/material.dart';
import 'widget_with_code.dart';

class Card1 extends WidgetWithCode {
  @override
  Widget getWidget() {
    return Card(
        color: Colors.blueAccent,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Column(
          children: [
            Text("Filho Interno"),
            RotatedBox(quarterTurns: 3, child: Text("Romeo Dias"))
          ],
        ));
  }

  @override
  String getCode() {
    return """Card(
        color: Colors.blueAccent,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Column(
          children: [
            Text("Filho Interno"),
            RotatedBox(quarterTurns: 3, child: Text("Romeo Dias"))
          ],
        ))
""";
  }
}
