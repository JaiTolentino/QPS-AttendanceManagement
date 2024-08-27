part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {
  AuthInitialState();
}

class AuthLoadingState extends AuthState {
  AuthLoadingState();
}

class SignInSuccessful extends AuthState {
  SignInSuccessful();
}

class SignInFailed extends AuthState {
  final String message;
  SignInFailed(this.message);
}

class SignOutSuccessful extends AuthState {
  SignOutSuccessful();
}

class SignOutFailed extends AuthState {
  final String message;
  SignOutFailed(this.message);
}