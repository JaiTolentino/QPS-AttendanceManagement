part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignInWithMicrosoft extends AuthEvent {
  SignInWithMicrosoft();
}

class SignOutUser extends AuthEvent {
  SignOutUser();
}
