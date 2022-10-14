import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/add_note.dart';
import 'screens/list_note.dart';

import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Local Database'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions)),
                  Tab(icon: Icon(Icons.ac_unit))
                ],
              )),
          body: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ManageBloc()),
              BlocProvider(create: (_) => MonitorBloc()),
            ],
            child: TabBarView(
              children: [
                AddNote(),
                ListNote(),
              ],
            ),
          )),
    );
  }
}
