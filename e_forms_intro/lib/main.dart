import 'package:e_forms_intro/screens/a_professor_presentation.dart';
import 'package:e_forms_intro/screens/b_text_form_field.dart';
import 'package:e_forms_intro/screens/c_other_form_widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Aula 04',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.red,
      ),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]),
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: const Text("Aula 04"),
              ),
              body: TabBarView(
                children: [
                  const ProfessorScreen(),
                  SimpleForm(),
                  const CompleteForm(),
                ],
              ))),
    );
  }
}
