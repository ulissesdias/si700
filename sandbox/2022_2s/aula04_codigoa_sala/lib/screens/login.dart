import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        TextFormField(
          validator: (String? inValue) {
            if (inValue != null) {
              if (inValue.isEmpty) {
                return "Insira Algo";
              }
            }
            return null;
          },
          onSaved: (String? inValue) {
            if (inValue != null) {
              // Inserir no banco
              print(inValue);
            }
          },
        ),
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 5),
                      content: Text("asdf")),
                );
              }
            },
            child: const Text(
              "Click Me",
            )),
        ElevatedButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (_) {
                    return const Text("ASDF");
                  });
            },
            child: const Text("Click me 2"))
      ]),
    );
  }
}
