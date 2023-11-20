import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';
import '../bloc/monitor_bloc.dart';
import '../model/note.dart';
import '../model/notes.dart';

class DynamicListView extends StatefulWidget {
  const DynamicListView({super.key});

  @override
  State<DynamicListView> createState() => _DynamicListViewState();
}

class _DynamicListViewState extends State<DynamicListView> {
  String title = "";

  String description = "";

  final GlobalKey<FormState> formKeySubmit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(
        builder: (BuildContext context, ManageState state) {
      if (state is UpdateState) {
        title = state.previousNote.title;
        description = state.previousNote.description;
        return Form(
          key: formKeySubmit,
          child: Column(
            children: [
              titleFormField(),
              descriptionFormField(),
              ElevatedButton(
                onPressed: () {
                  if (formKeySubmit.currentState!.validate()) {
                    formKeySubmit.currentState!.save();
                    BlocProvider.of<ManageBloc>(context).add(SubmitEvent(
                        note: Note.withData(
                            title: title, description: description)));
                  }
                },
                child: const Text("Submit"),
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ManageBloc>(context).add(UpdateCancel());
                  },
                  child: const Text("Cancel Update")),
            ],
          ),
        );
      } else {
        return BlocBuilder<MonitorBloc, MonitorState>(
          builder: (BuildContext context, MonitorState state) {
            return getNoteListView(state.noteCollection);
          },
        );
      }
    });
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

  Widget titleFormField() {
    return TextFormField(
      initialValue: title,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um title";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        title = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "Meu Título",
        labelText: "Título",
      ),
    );
  }

  Widget descriptionFormField() {
    return TextFormField(
      initialValue: description,
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira uma descrição";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        description = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "Meu Description",
        labelText: "Description",
      ),
    );
  }
}
