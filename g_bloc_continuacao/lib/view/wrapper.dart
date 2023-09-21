import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';
import '../bloc/monitor_bloc.dart';
import 'add_note.dart';
import 'list_note.dart';
import 'login_screen.dart';

import '../bloc/auth_bloc.dart';

import 'register_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro do Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return Column(
            children: [
              const Text("Você está autenticado"),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  child: Text("Logout"))
            ],
          );
        } else {
          return;
        }
      },
    );
  }
}
