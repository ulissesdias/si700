import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_bloc_continuacao/screens/auth_screen.dart';
import 'package:g_bloc_continuacao/screens/counter_screen.dart';

import 'bloc/auth_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'screens/basic_listview.dart';
import 'screens/dynamic_list_view.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => CounterBloc(), child: const DrawerIndexedStack()),
    );
  }
}

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
        title: const Text("Indexed Stack"),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: [
          BlocProvider(
              create: (BuildContext context) {
                return CounterBloc();
              },
              child: const CounterScreen()),
          BlocProvider(
              create: (BuildContext context) {
                return AuthBloc();
              },
              child: const AuthScreen()),
          const BasicListView(),
          const DynamicListView(),
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
              title: const Text("Counter Screen"),
              onTap: () {
                setState(() {
                  _currentScreen = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Auth Screen"),
              onTap: () {
                setState(() {
                  _currentScreen = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Basic ListView"),
              onTap: () {
                setState(() {
                  _currentScreen = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Dynamic ListView"),
              onTap: () {
                setState(() {
                  _currentScreen = 3;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
