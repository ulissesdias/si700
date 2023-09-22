import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}

/*
  Classe que contém o Drawer
*/

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: const Center(child: Text("Corpo da Home Screen")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  "NavigationDrawer App",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
            ListTile(
                leading: const Icon(Icons.cake),
                title: const Text("Counter Screen"),
                onTap: () {
                  /* Apenas para fechar o drawer */
                  Navigator.pop(context);

                  /* Navegando para a rota  */
                  Navigator.pushNamed(context, "/counter");
                }),
            ListTile(
                leading: const Icon(Icons.cake),
                title: const Text("Auth Screen"),
                onTap: () {
                  /* Apenas para fechar o Drawer */
                  Navigator.pop(context);

                  /* Navegando para a rota */
                  Navigator.pushNamed(context, "/auth");
                }),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text("Basic ListView"),
              onTap: () {
                /* Apenas para fechar o Drawer */
                Navigator.pop(context);

                /* Navegando para a rota */
                Navigator.pushNamed(context, "/basicListView");
              },
            ),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text("Dyncamic ListView"),
              onTap: () {
                /* Apenas para fechar o Drawer */
                Navigator.pop(context);

                /* Navegando para a rota */
                Navigator.pushNamed(context, "/dynamicListView");
              },
            ),
          ],
        ),
      ),
    );
  }
}
