import 'package:flutter/material.dart';

class ScreenHeader extends StatefulWidget {
  final String title;
  final Widget child;

  const ScreenHeader({super.key, required this.title, required this.child});

  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: widget.child);
  }
}
