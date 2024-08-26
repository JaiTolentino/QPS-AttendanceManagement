import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:ssoattendance/counter/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc())],
        child: LoginView());
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignInSuccessful) {
                context.go('/home');
              } else if (state is SignInFailed) {
                var snack = SnackBar(content: Text(state.message));
                ScaffoldMessenger.of(context).showSnackBar(snack);
              } else {
                print('is loading');
              }
            },
            child: Container(),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: SocialLoginButton(
                buttonType: SocialLoginButtonType.microsoft,
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignInWithMicrosoft());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
