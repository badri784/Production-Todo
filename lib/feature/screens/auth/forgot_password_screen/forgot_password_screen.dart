import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/bloc/forgot_password/forgot_password_cubit.dart';
import 'package:pro_todo/feature/screens/auth/forgot_password_screen/widgets/forgot_password_header.dart';
import 'package:pro_todo/feature/screens/auth/forgot_password_screen/widgets/forgot_password_form_field.dart';
import 'package:pro_todo/feature/screens/auth/forgot_password_screen/widgets/forgot_password_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset email sent! Check your inbox.'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          } else if (state is ForgotPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
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
                      const ForgotPasswordHeader(),
                      const SizedBox(height: 30),
                      ForgotPasswordFormField(
                        emailController: _emailController,
                      ),
                      const SizedBox(height: 25),
                      Builder(
                        builder: (context) {
                          return ForgotPasswordButton(
                            onPressed: () {
                              context.read<ForgotPasswordCubit>().sendPasswordResetEmail(
                                email: _emailController.text.trim(),
                              );
                            },
                          );
                        },
                      ),
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
