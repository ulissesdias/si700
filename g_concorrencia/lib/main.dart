import 'package:flutter/material.dart';
import 'package:g_concorrencia/view/screens/dynamic_listview.dart';
import 'package:g_concorrencia/view/screens/future_screen.dart';

import 'view/screens/basic_listview.dart';

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
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: [
          const BasicListView(),
          DynamicListView(),
          const FutureScreen(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Aula 06",
                style: TextStyle(fontSize: 32),
              ),
            ),
            ListTile(
              title: const Text("Basic ListView"),
              onTap: () {
                setState(() {
                  _currentScreen = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Dynamic ListView"),
              onTap: () {
                setState(() {
                  _currentScreen = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Future Screen"),
              onTap: () {
                setState(() {
                  _currentScreen = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
