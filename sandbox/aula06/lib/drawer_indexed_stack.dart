import 'package:flutter/material.dart';

import 'screens/auth_screen.dart';
import 'screens/basic_listview.dart';
import 'screens/counter_screen.dart';
import 'screens/dynamic_listview.dart';

class DrawerIndexedStack extends StatefulWidget {
  const DrawerIndexedStack({super.key});

  @override
  State<DrawerIndexedStack> createState() => _DrawerIndexedStackState();
}

class _DrawerIndexedStackState extends State<DrawerIndexedStack> {
  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Meu app com Drawer"),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: [
          const CounterScreen(),
          AuthScreen(),
          const BasicListView(),
          const DynamicListView()
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("child")),
            ListTile(
              title: Text("Counter Screen"),
              onTap: () {
                setState(() {
                  _currentScreen = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Auth Screen"),
              onTap: () {
                setState(() {
                  _currentScreen = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Basic ListView"),
              onTap: () {
                setState(() {
                  _currentScreen = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Dynamic ListView"),
              onTap: () {
                setState(() {
                  _currentScreen = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
