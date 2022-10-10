import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ConnectionType { wifi, fourG }

enum ConnectionStatus { online, wifion, wifioff, offline }

class InternetBloc extends Bloc<ConnectivityResult, ConnectionStatus> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivityStream;

  InternetBloc() : super(ConnectionStatus.offline) {
    connectivityStream = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult event) {
        add(event);
      },
    );

    on<ConnectivityResult>((event, emit) async {
      //print("status chagnged");
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile ||
          event == ConnectivityResult.ethernet) {
        bool isOnline = false;
        try {
          final result = await InternetAddress.lookup('http://www.unicamp.br');
          isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        } catch (_) {
          isOnline = false;
        }
        if (isOnline) {
          if (event == ConnectivityResult.wifi) {
            emit(ConnectionStatus.wifion);
          } else {
            emit(ConnectionStatus.online);
          }
        } else if (event == ConnectivityResult.wifi) {
          emit(ConnectionStatus.wifioff);
        } else {
          emit(ConnectionStatus.offline);
        }
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStream?.cancel();
    return super.close();
  }
}
