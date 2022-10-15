import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/note.dart';
import '../bloc/manage_bloc.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      Note note;
      if (state is UpdateState) {
        note = state.previousNote;
      } else {
        note = Note();
      }
      return Form(
          key: formKey,
          child: Column(
            children: [
              tituloFormField(note),
              descriptionFormField(note),
              submitButton(note, context, state),
              cancelButton(note, context, state),
            ],
          ));
    });
  }

  Widget tituloFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.title,
        decoration: InputDecoration(
            labelText: "Título",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione algum título";
          }
          return null;
        },
        onSaved: (value) {
          note.title = value!;
        },
      ),
    );
  }

  Widget descriptionFormField(Note note) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: note.description,
        decoration: InputDecoration(
            labelText: "Anotação",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione alguma anotação";
          }
          return null;
        },
        onSaved: (value) {
          note.description = value!;
        },
      ),
    );
  }

  Widget submitButton(
    Note note,
    BuildContext context,
    ManageState state,
  ) {
    return ElevatedButton(
        child: (state is UpdateState
            ? const Text("Update Data")
            : const Text(
                "Insert Data",
              )),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            BlocProvider.of<ManageBloc>(context).add(
              SubmitEvent(
                note: Note.withData(
                  title: note.title,
                  description: note.description,
                ),
              ),
            );

            formKey.currentState!.reset();
          }
        });
  }

  Widget cancelButton(Note note, BuildContext context, ManageState state) {
    return (state is UpdateState
        ? ElevatedButton(
            onPressed: () {
              BlocProvider.of<ManageBloc>(context).add(
                UpdateCancel(),
              );
            },
            child: const Text("Cancel Update"))
        : Container());
  }
}
