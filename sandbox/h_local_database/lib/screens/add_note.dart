import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/note.dart';
import '../bloc/manage_bloc.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final _widgetsValues = Hive.box("widgets_values2");

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageBloc, ManageState>(
      listener: (context, state) {
        if (state is UpdateState) {
          titleController.text = state.previousNote.title;
          descriptionController.text = state.previousNote.description;
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            tituloFormField(),
            descriptionFormField(),
            submitButton(),
            cancelButton(),
          ],
        ),
      ),
    );
  }

  Widget tituloFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        //initialValue: _widgetsValues.get('title'),
        controller: titleController,
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
          _widgetsValues.put('title', value);
        },
        onChanged: (value) {
          _widgetsValues.put('title', value);
        },
      ),
    );
  }

  Widget descriptionFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        //initialValue: _widgetsValues.get('description'),
        controller: descriptionController,
        decoration: InputDecoration(
            labelText: "Anotação",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adicione alguma descrição";
          }
          return null;
        },
        onSaved: (value) {
          _widgetsValues.put('description', value);
        },
        onChanged: (value) {
          _widgetsValues.put('description', value);
        },
      ),
    );
  }

  Widget submitButton() {
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      return ElevatedButton(
          child: (state is UpdateState
              ? const Text("Update Data")
              : const Text(
                  "Insert Data",
                )),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<ManageBloc>(context).add(
                SubmitEvent(
                  note: Note.withData(
                    title: _widgetsValues.get('title'),
                    description: _widgetsValues.get('description'),
                  ),
                ),
              );
              await _widgetsValues.put('title', "");
              await _widgetsValues.put('description', "");
              titleController.clear();
              descriptionController.clear();
            }
          });
    });
  }

  Widget cancelButton() {
    return BlocBuilder<ManageBloc, ManageState>(builder: (context, state) {
      return (state is UpdateState
          ? ElevatedButton(
              onPressed: () async {
                BlocProvider.of<ManageBloc>(context).add(
                  UpdateCancel(),
                );
              },
              child: const Text("Cancel Update"))
          : Container());
    });
  }
}
