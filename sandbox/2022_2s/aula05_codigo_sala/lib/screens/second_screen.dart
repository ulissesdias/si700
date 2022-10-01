import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/red_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      RedBloc bloc = context.watch<RedBloc>();
      return Container(
        color: Color.fromRGBO(bloc.state.amount, 0, 0, 1),
      );
    });
  }
}
