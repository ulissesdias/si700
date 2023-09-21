import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    on<LoginUser>((LoginUser event, Emitter emit) {
      if (event.password == "senha") {
        emit(Authenticated(username: event.username));
      } else {
        emit(AuthError(message: "Impossível Logar com ${event.username}"));
      }
    });
    on<Logout>((Logout event, Emitter emit) async {
      emit(Unauthenticated());
    });
  }
}

/*
 Eventos
*/
abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

class Logout extends AuthEvent {}

/*
Estados
*/
abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String username;
  Authenticated({required this.username});
}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
