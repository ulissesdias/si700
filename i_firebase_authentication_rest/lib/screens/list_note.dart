import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';

import '../model/notes.dart';

import '../bloc/monitor_bloc.dart';

class ListNote extends StatelessWidget {
  ListNote({Key? key}) : super(key: key);

  final List colors = [Colors.orange, Colors.red, Colors.yellow];
  final List icons = [Icons.ac_unit_outlined, Icons.access_alarm_rounded];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => getNoteListView(state.noteCollection),
    );
  }

  ListView getNoteListView(NoteCollection noteCollection) {
    return ListView.builder(
        itemCount: noteCollection.length(),
        itemBuilder: (context, position) => ListTile(
              onTap: () {
                //print(noteCollection.getIdAtIndex(position));
                BlocProvider.of<ManageBloc>(context).add(UpdateRequest(
                  noteId: noteCollection.getIdAtIndex(position),
                  previousNote: noteCollection.getNoteAtIndex(position),
                ));
              },
              leading: Icon(icons[position % icons.length]),
              trailing: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ManageBloc>(context).add(DeleteEvent(
                        noteId: noteCollection.getIdAtIndex(position)));
                  },
                  child: const Icon(Icons.delete)),
              title: Text(noteCollection.getNoteAtIndex(position).title),
              subtitle:
                  Text(noteCollection.getNoteAtIndex(position).description),
            ));
  }
}
