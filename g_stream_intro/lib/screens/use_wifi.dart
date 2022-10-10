import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:g_stream_intro/screens/list_note.dart';

import '../bloc/internet_bloc.dart';

class UseWiFi extends StatelessWidget {
  const UseWiFi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, ConnectionStatus>(
        builder: (context, state) {
      if (state == ConnectionStatus.wifioff ||
          state == ConnectionStatus.wifion) {
        return const Text("Voce tem wif"); //ListNote();
      } else {
        return const Text("Esta parte do formulário precisa de wifi");
      }
    });
  }
}
