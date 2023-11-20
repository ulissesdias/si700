import 'package:flutter/material.dart';

class BasicListView extends StatelessWidget {
  const BasicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing:
                GestureDetector(onTap: () {}, child: const Icon(Icons.delete)),
            onTap: () {},
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
          ListTile(
            title: Text("Primeiro Título"),
            subtitle: Text("Primeira Descrição de Título"),
            leading: Icon(Icons.access_time_filled_sharp),
            trailing: Icon(Icons.ad_units_sharp),
          ),
        ],
      ),
    );
  }
}
