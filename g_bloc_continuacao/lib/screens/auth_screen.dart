import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Impossível Logar"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return Column(
            children: [
              Text("Você está autenticado ${state.username}"),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  child: const Text("Logout"))
            ],
          );
        } else {
          return Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  usernameFormField(),
                  passwordFormField(),
                  const Divider(),
                  submitButton(),
                ],
              ),
            ),
          );
        }
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
    return ElevatedButton(
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
    );
  }
}
