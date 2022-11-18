import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                title: const Text("Add Note"),
                onTap: () {
                  /*
                    Apenas para fechar o drawer
                  */
                  Navigator.pop(context);

                  /*
                    Navegando para a rota
                  */
                  Navigator.pushNamed(context, "/add");
                }),
            ListTile(
                leading: const Icon(Icons.cake),
                title: const Text("List Note"),
                onTap: () {
                  /*
                    Apenas para fechar o Drawer
                  */
                  Navigator.pop(context);
                  /*
                    Navegando para a rota
                  */
                  Navigator.pushNamed(context, "/list");
                }),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text("Do Nothing"),
              onTap: () {
                /*
                  Apenas para fechar o Drawer
                */
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
