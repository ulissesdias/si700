import 'package:flutter/material.dart';

class DynamicListView extends StatelessWidget {
  const DynamicListView({super.key});

  final texto = const ["A", "B", "C", "D", "E", "F"];
  final List colors = const [
    Colors.green,
    Colors.grey,
    Colors.blue,
    Colors.red,
  ];
  final List icons = const [
    Icons.cake,
    Icons.calendar_month_outlined,
    Icons.account_balance
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          color: colors[index % colors.length],
          child: ListTile(
              leading: Icon(icons[index % icons.length]),
              title: Text(texto[index % texto.length])),
        );
      },
    );
  }
}
