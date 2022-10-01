import 'package:aula04_codigoa_sala/screens/form.dart';
import 'package:aula04_codigoa_sala/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: const TabBar(tabs: [
              Tab(
                text: "Primeira",
              ),
              Tab(text: "Segunda"),
              Tab(
                text: "Terceira",
              )
            ]),
          ),
          body: TabBarView(
            children: [LoginScreen(), FormScreen(), Text("C")],
          )),
    );
  }
}
