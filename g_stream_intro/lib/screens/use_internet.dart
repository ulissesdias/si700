import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_stream_intro/bloc/internet_bloc.dart';
import 'package:g_stream_intro/screens/add_note.dart';

class InternetForm extends StatelessWidget {
  const InternetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, ConnectionStatus>(
        builder: (context, state) {
      if (state == ConnectionStatus.online ||
          state == ConnectionStatus.wifion) {
        return AddNote();
      } else {
        return const Text("Esta parte do formulário precisa de internet");
      }
    });
  }
}
