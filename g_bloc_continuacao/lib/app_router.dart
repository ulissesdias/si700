import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_bloc_continuacao/bloc/auth_bloc.dart';
import 'package:g_bloc_continuacao/bloc/counter_bloc.dart';
import 'package:g_bloc_continuacao/screens/auth_screen.dart';
import 'package:g_bloc_continuacao/screens/basic_listview.dart';
import 'package:g_bloc_continuacao/screens/counter_screen.dart';
import 'package:g_bloc_continuacao/screens/dynamic_list_view.dart';

import 'main_drawer_navigator.dart';

class AppRouter {
  final CounterBloc _counterBloc = CounterBloc();
  final AuthBloc _authBloc = AuthBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const DrawerNavigator());
      case "/counter":
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterBloc,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text("Counter Screen"),
                  ),
                  body: const CounterScreen(),
                )));

      case "/auth":
        return MaterialPageRoute(
            /*
              Abaixo um MultiBlocProvider sem necessidade, apenas para mostrar o uso 
              dele mais uma vez.
          */
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: _authBloc),
                    ],
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text("Auth Screen"),
                      ),
                      body: const AuthScreen(),
                    )));

      case "/basicListView":
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                appBar: AppBar(title: const Text("Basic List View")),
                body: const BasicListView()));

      case "/dynamicListView":
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                appBar: AppBar(title: const Text("Dynamic List View")),
                body: const DynamicListView()));
      default:
        return MaterialPageRoute(builder: (_) => const Text("Erro"));
    }
  }

  void dispose() {
    _authBloc.close();
    _counterBloc.close();
  }
}
