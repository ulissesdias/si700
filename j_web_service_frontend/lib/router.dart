import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_web_service_frontend/bloc/manage_bloc.dart';
import 'package:j_web_service_frontend/bloc/monitor_bloc.dart';
import 'package:j_web_service_frontend/screens/add_note.dart';
import 'package:j_web_service_frontend/screens/list_note.dart';

import 'screens/home_screen.dart';
import 'screens/screen_header.dart';

class AppRouter {
  final ManageBloc _manageBloc = ManageBloc();
  final MonitorBloc _monitorBloc = MonitorBloc();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/add":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _manageBloc,
                child: ScreenHeader(
                  title: "Add Note",
                  child: AddNote(),
                )));

      case "/list":
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: _manageBloc),
                      BlocProvider.value(value: _monitorBloc)
                    ],
                    child: ScreenHeader(
                      title: "List Note",
                      child: ListNote(),
                    )));

      default:
        return MaterialPageRoute(builder: (_) => const Text("Erro"));
    }
  }

  void dispose() {
    _manageBloc.close();
    _monitorBloc.close();
  }
}
