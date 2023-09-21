import 'dart:developer';

import 'package:flutter/material.dart';

class BasicListView extends StatelessWidget {
  const BasicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          title: Text("Meu Primeiro Tile"),
          subtitle: Text("SI700 - Aula 06"),
          leading: Icon(Icons.access_time),
          trailing: Icon(Icons.add_a_photo),
        ),
        ListTile(
          title: const Text("Meu Segundo Tile"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Meu Terceiro Tile"),
          subtitle: const Text("ListTile e Leading clicáveis"),
          leading: GestureDetector(
              onTap: () {
                log("Gesture Detector");
              },
              child: const Icon(Icons.access_time)),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {
            log("ListTile");
          },
        ),
        const Card(
          color: Colors.blue,
          elevation: 5,
          child: ListTile(
            title: Text("ListTile dentro do Card"),
            leading: Icon(Icons.cabin),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.yellow, Colors.red])),
          child: const ListTile(title: Text("ListTile dentro do Container")),
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Outros ListTiles"),
          subtitle: const Text("ListTile clicável"),
          leading: const Icon(Icons.access_time),
          trailing: const Icon(Icons.add_a_photo),
          onTap: () {},
        ),
      ],
    );
  }
}
