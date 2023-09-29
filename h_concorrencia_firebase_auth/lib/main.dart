import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_concorrencia_firebase_auth/bloc/auth_bloc.dart';
import 'package:h_concorrencia_firebase_auth/screens/auth_screen.dart';
import 'package:h_concorrencia_firebase_auth/screens/future_screen.dart';

import 'screens/stream_screen.dart';

Future<void> main() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDPr37O9XUOiRiVfoIj3Ttwk2aw-A9r-a8",
            authDomain: "si7001s2023.firebaseapp.com",
            databaseURL: "https://si7001s2023-default-rtdb.firebaseio.com",
            projectId: "si7001s2023",
            storageBucket: "si7001s2023.appspot.com",
            messagingSenderId: "589839738233",
            appId: "1:589839738233:web:211c1c054e532e55a53ba8"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Aula 07',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        create: (context) {
          return AuthBloc();
        },
        child: DefaultTabController(
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
                  title: const Text("Aula 07"),
                ),
                body: const TabBarView(
                  children: [
                    FutureScreen(),
                    StreamScreen(),
                    AuthScreen(),
                  ],
                ))),
      ),
    );
  }
}
