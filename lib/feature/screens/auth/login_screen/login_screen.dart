import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/bloc/sing_to_app_with_email_and_password/login/login_cubit.dart';
import 'package:pro_todo/core/bloc/google_login/google_login_cubit.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/login_header.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/login_form_fields.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/login_buttons.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/sign_up_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => GoogleLoginCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                context.pushAndRemoveUntilname(Routes.homeRoute);
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          BlocListener<GoogleLoginCubit, GoogleLoginState>(
            listener: (context, state) {
              if (state is GoogleLoginSuccess) {
                context.pushAndRemoveUntilname(Routes.homeRoute);
              } else if (state is GoogleLoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: const Color(0xfff9f9f9),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoginHeader(),
                      const SizedBox(height: 16),
                      LoginFormFields(
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                      const SizedBox(height: 25),
                      Builder(
                        builder: (context) {
                          return LoginButtons(
                            onLoginPressed: () {
                              context.read<LoginCubit>().signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                            },
                            onGooglePressed: () {
                              context.read<GoogleLoginCubit>().loginWithGoogle();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      const SignUpText(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
