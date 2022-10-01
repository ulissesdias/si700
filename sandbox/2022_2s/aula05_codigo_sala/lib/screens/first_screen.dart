import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/red_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<RedBloc, RedState>(builder: (context, state) {
          return AnimatedContainer(
              duration: const Duration(seconds: 4),
              height: 100,
              width: 100,
              color: Color.fromRGBO(state.amount, 0, 0, 1));
        }),
        ElevatedButton(
          onPressed: () {
            RedBloc bloc = BlocProvider.of<RedBloc>(context);
            bloc.add(RedEvent.muito);
          },
          child: const Text("Muito"),
        ),
        ElevatedButton(
          onPressed: () {
            RedBloc bloc = BlocProvider.of<RedBloc>(context);
            bloc.add(RedEvent.pouco);
          },
          child: const Text("POuco"),
        )
      ],
    );
  }
}
