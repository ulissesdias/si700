import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_local_database/screens/add_notes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screens/add_note.dart';
import 'screens/list_note.dart';

import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('widgets_values');
  await Hive.openBox("list_view_data");
  await Hive.openBox('widgets_values2');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 07 - Memória Persistente',
      theme: ThemeData(
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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ManageBloc()),
        BlocProvider(create: (_) => MonitorBloc()),
      ],
      child: BlocListener<ManageBloc, ManageState>(
        listener: (context, state) {
          if (state is UpdateState) {
            setState(() {
              _currentScreen = 1;
            });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: IndexedStack(
            index: _currentScreen,
            children: [
              const AddNotes(),
              const AddNote(),
              ListNote(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.remove_red_eye), label: "Multi Insert"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.send_sharp), label: "Manage"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.email), label: "Monitor"),
            ],
            currentIndex: _currentScreen,
            onTap: (int novoItem) {
              setState(() {
                _currentScreen = novoItem;
              });
            },
            fixedColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
