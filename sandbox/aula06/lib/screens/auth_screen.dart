import 'dart:typed_data';

import 'package:aula06/bloc/auth_bloc.dart';
import 'package:aula06/bloc/manage_bloc.dart';
import 'package:aula06/bloc/monitor_bloc.dart';
import 'package:aula06/screens/widgets/pick_a_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/note.dart';
import '../model/notes.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String username = "";
  String password = "";

  String title = "";
  String description = "";
  Uint8List? fileBytes;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeySubmit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, AuthState state) {
      if (state is AuthError) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text("Senha errada"),
                  content: Text("Impossível : ${state.message}"));
            });
      }
    }, builder: (context, AuthState state) {
      if (state is Authenticated) {
        return SingleChildScrollView(
          child: Form(
            key: formKeySubmit,
            child: Column(
              children: [
                Text("Legal ${state.username}, você logou"),
                titleFormField(),
                descriptionFormField(),
                pickAFileFormField(),
                ElevatedButton(
                  onPressed: () {
                    if (formKeySubmit.currentState!.validate()) {
                      formKeySubmit.currentState!.save();
                      BlocProvider.of<ManageBloc>(context).add(SubmitEvent(
                          note: Note.withData(
                              title: title,
                              description: description,
                              path: "",
                              fileBytes: fileBytes)));
                    }
                  },
                  child: const Text("Submit"),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<MonitorBloc>(context).add(AskNewList());
                    },
                    child: const Text("AskNewList")),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  child: const Text("Deslogue"),
                ),
              ],
            ),
          ),
        );
      } else {
        return Form(
          key: formKey,
          child: Column(
            children: [
              usernameFormField(),
              passwordFormField(),
              submitButton(),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(LoginUser(username: "Thyago", password: "senha"));
                  },
                  child: const Text("Logue Corretamente")),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context)
                        .add(LoginUser(username: "Thyago", password: "asdf"));
                  },
                  child: const Text("Login Errado")),
            ],
          ),
        );
      }
    });
  }

  Widget titleFormField() {
    return TextFormField(
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

  Widget pickAFileFormField() {
    return PickAFile(
      validator: (Uint8List? fileBytes) {
        if (fileBytes == null) {
          return "Coloque uma imagem";
        } else {
          return null;
        }
      },
      onSaved: (Uint8List? inValue) {
        fileBytes = inValue;
      },
    );
  }

  Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.isEmpty) {
            return "Insira um nome de usuário";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        username = inValue ?? "";
      },
      decoration: const InputDecoration(
        hintText: "user@domain.br",
        labelText: "Username (E-mail Address)",
      ),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String? inValue) {
        if (inValue != null) {
          if (inValue.length < 4) {
            return "Mínimo de 4 letras";
          }
        }
        return null;
      },
      onSaved: (String? inValue) {
        password = inValue ?? "";
      },
      decoration: const InputDecoration(
        labelText: "Insira uma senha forte",
      ),
    );
  }

  Widget submitButton() {
    return Row(
      children: [
        ElevatedButton(
          child: const Text("Log In!"),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<AuthBloc>(context).add(LoginUser(
                username: username,
                password: password,
              ));
            }
          },
        ),
        ElevatedButton(
          child: const Text("Registro!"),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<AuthBloc>(context).add(RegisterUser(
                username: username,
                password: password,
              ));
            }
          },
        ),
      ],
    );
  }
}
