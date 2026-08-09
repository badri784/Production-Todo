import 'package:flutter/material.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/login_header.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/login_form_fields.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/login_buttons.dart';
import 'package:pro_todo/feature/screens/auth/login_screen/widgets/sign_up_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                LoginHeader(),
                SizedBox(height: 16),
                LoginFormFields(),
                SizedBox(height: 25),
                LoginButtons(),
                SizedBox(height: 16),
                SignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
