import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/bloc/sing_to_app_with_email_and_password/signup/sign_up_cubit.dart';
import 'package:pro_todo/core/bloc/google_login/google_login_cubit.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/feature/screens/auth/sign_up_screen/widgets/sign_up_header.dart';
import 'package:pro_todo/feature/screens/auth/sign_up_screen/widgets/sign_up_form_fields.dart';
import 'package:pro_todo/feature/screens/auth/sign_up_screen/widgets/sign_up_buttons.dart';
import 'package:pro_todo/feature/screens/auth/sign_up_screen/widgets/login_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignUpCubit()),
        BlocProvider(create: (_) => GoogleLoginCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Account created successfully.'),
                    backgroundColor: Colors.green,
                  ),
                );
                context.pushReplacementName(Routes.homeRoute);
              } else if (state is SignUpFailure) {
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
                      const SignUpHeader(),
                      const SizedBox(height: 30),
                      SignUpFormFields(
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                      const SizedBox(height: 25),
                      Builder(
                        builder: (context) {
                          return SignUpButtons(
                            onSignUpPressed: () {
                              context
                                  .read<SignUpCubit>()
                                  .createAccountWithEmailAndPassword(
                                    name: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                            },
                            onGooglePressed: () {
                              context
                                  .read<GoogleLoginCubit>()
                                  .loginWithGoogle();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 25),
                      const LoginText(),
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
