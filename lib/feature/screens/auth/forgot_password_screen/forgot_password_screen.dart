import 'package:flutter/material.dart';
import 'package:pro_todo/feature/screens/auth/forgot_password_screen/widgets/forgot_password_header.dart';
import 'package:pro_todo/feature/screens/auth/forgot_password_screen/widgets/forgot_password_form_field.dart';
import 'package:pro_todo/feature/screens/auth/forgot_password_screen/widgets/forgot_password_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: const Padding(
          padding: EdgeInsets.only(right: 25, left: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ForgotPasswordHeader(),
                SizedBox(height: 30),
                ForgotPasswordFormField(),
                SizedBox(height: 25),
                ForgotPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
