import 'package:aula06/app_router.dart';
import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBaHRFTfuudYJ-V2I2BeZ-URcw3Jd90PYw",
            authDomain: "si7002s2023.firebaseapp.com",
            projectId: "si7002s2023",
            storageBucket: "si7002s2023.appspot.com",
            messagingSenderId: "1040749039198",
            appId: "1:1040749039198:web:198ff1450765de8caa2ecf"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
      /*home: BlocProvider(
        create: (_) => CounterBloc(),
        child: BlocProvider(
          create: (_) => AuthBloc(),
          child: const DrawerIndexedStack(),
        ),
      ),*/
    );
  }
}

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Meu app com Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("child")),
            ListTile(
              title: Text("Counter Screen"),
              onTap: () {
                // O pop é no drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, "/counter");
              },
            ),
            ListTile(
              title: Text("Auth Screen"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, "/auth");
              },
            ),
            ListTile(
              title: Text("Basic ListView"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, "/basic");
              },
            ),
            ListTile(
              title: Text("Dynamic ListView"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(context, "/dynamic");
              },
            ),
          ],
        ),
      ),
    );
  }
}
