import 'package:aula06/bloc/counter_bloc.dart';
import 'package:aula06/bloc/manage_bloc.dart';
import 'package:aula06/bloc/monitor_bloc.dart';
import 'package:aula06/main.dart';
import 'package:aula06/screens/auth_screen.dart';
import 'package:aula06/screens/basic_listview.dart';
import 'package:aula06/screens/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc.dart';
import 'screens/dynamic_listview.dart';

class AppRouter {
  CounterBloc counterBloc = CounterBloc();
  AuthBloc authBloc = AuthBloc();
  ManageBloc manageBloc = ManageBloc();
  MonitorBloc monitorBloc = MonitorBloc();

  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case "/":
        return MaterialPageRoute(builder: (_) {
          return const DrawerNavigator();
        });
      case "/counter":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Counter Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BlocProvider.value(
                  value: counterBloc, child: CounterScreen()));
        });
      case "/auth":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Counter Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BlocProvider.value(
                value: authBloc,
                child: BlocProvider.value(
                  value: manageBloc,
                  child: BlocProvider.value(
                      value: monitorBloc, child: AuthScreen()),
                ),
              ));
        });
      case "/basic":
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Counter Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BasicListView());
        });
      case "/dynamic":
        monitorBloc.add(UpdateStreamSubscription());
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Counter Screen"),
                backgroundColor: Colors.blue,
              ),
              body: BlocProvider.value(
                  value: monitorBloc,
                  child: BlocProvider.value(
                      value: manageBloc, child: DynamicListView())));
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return const Text("ASDF");
        });
    }
  }
}
