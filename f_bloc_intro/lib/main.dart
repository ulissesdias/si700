import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/colors/blue_bloc.dart';
import 'bloc/colors/blue_state.dart';
import 'bloc/colors/green_bloc.dart';
import 'bloc/colors/green_state.dart';
import 'bloc/colors/red_bloc.dart';
import 'bloc/colors/red_state.dart';

import 'bloc/form/a_checkbox_bloc.dart';
import 'bloc/form/b_switch_bloc.dart';
import 'bloc/form/c_radio_bloc.dart';
import 'bloc/form/d_slider_bloc.dart';

import 'screens/bloc_color_emitter.dart';
import 'screens/bloc_color_viewer.dart';
import 'screens/bloc_manage_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 05',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Aula 05'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MultiBlocProvider(
        providers: [
          /*
            Observe a seguir que estamos enviando o Bloc para telas que não usam 
            aquele Bloc. Isso pode ser melhorado usando o construtor nomeado 
            BlocProvder.value().
          */

          // Blocs das duas primeiras telas
          BlocProvider(create: (_) => RedBloc(RedState(amount: 50))),
          BlocProvider(create: (_) => BlueBloc(BlueState(amount: 50))),
          BlocProvider(create: (_) => GreenBloc(GreenState(amount: 50))),
          // Blocs da terceira tela
          BlocProvider(create: (_) => CheckBoxBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => RadioBloc()),
          BlocProvider(create: (_) => SliderBloc()),
        ],
        child: IndexedStack(
          index: _currentScreen,
          children: const [BlocViewer(), BlocEmitter(), WidgetsBloc()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye), label: "Bloc Viewer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.send_sharp), label: "Bloc Emitter"),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: "Bloc Forms"),
        ],
        currentIndex: _currentScreen,
        onTap: (int novoItem) {
          setState(() {
            _currentScreen = novoItem;
          });
        },
        fixedColor: Colors.red,
      ),
    );
  }
}
