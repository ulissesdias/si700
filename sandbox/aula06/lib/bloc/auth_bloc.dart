import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/firebase_auth.dart';
import '../provider/firebase_firestore.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthenticationProvider authProvider =
      FirebaseAuthenticationProvider();

  AuthBloc() : super(Unauthenticated()) {
    authProvider.stream.listen((event) {
      add(AuthServerEvent(username: event));
    });

    on<AuthServerEvent>((event, emit) {
      if (event.username == null) {
        FirestoreDatabase.helper.username = "default_user";
        emit(Unauthenticated());
      } else {
        FirestoreDatabase.helper.username = event.username;
        emit(Authenticated(username: event.username!));
      }
    });

    on<LoginUser>((LoginUser event, emit) {
      /*
      if (event.password == "senha") {
        emit(Authenticated(username: event.username));
      } else {
        emit(AuthError(message: "Você errou a senha ${event.username}"));
      }*/
      authProvider.signInWithEmailAndPassword(event.username, event.password);
    });

    on<RegisterUser>((RegisterUser event, emit) async {
      try {
        await authProvider.createUserWithEmailandPassword(
            event.username, event.password);
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
    on<Logout>(
      (Logout event, Emitter emit) {
        authProvider.signOut();
      },
    );
  }
}

/*
Eventos
*/
abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({
    this.username = "",
    this.password = "",
  });
}

class RegisterUser extends AuthEvent {
  String username;
  String password;

  RegisterUser({
    this.username = "",
    this.password = "",
  });
}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  String? username;
  AuthServerEvent({this.username});
}

/*
Estados
*/

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String username;

  Authenticated({this.username = ""});
}

class AuthError extends AuthState {
  String message;

  AuthError({this.message = ""});
}
