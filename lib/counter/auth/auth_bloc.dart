import 'package:bloc/bloc.dart';
import 'package:ssoattendance/counter/auth/auth_service.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    AuthService authService = AuthService();
    on<SignInWithMicrosoft>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          await authService.signInUser();
          emit(SignInSuccessful());
        } catch (e) {
          print('Error: $e');
          emit(SignInFailed('Error logging in'));
        }
      },
    );

    on<SignOutUser>((event, emit) {
      emit(AuthLoadingState());
      try {
        emit(SignOutSuccessful());
      } catch (e) {
        emit(SignOutFailed('Failed to sign out'));
      }
    },);
  }
}
