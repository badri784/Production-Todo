import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/bloc/sing_to_app_with_email_and_password/login/login_cubit.dart';
import 'package:pro_todo/core/bloc/google_login/google_login_cubit.dart';
import 'package:pro_todo/feature/widget/cutom_elevated_botton.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
    required this.onLoginPressed,
    required this.onGooglePressed,
  });

  final VoidCallback onLoginPressed;
  final VoidCallback onGooglePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Login Button with loading state
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return CustomElevatedButton(
              borderRadius: 16,
              text: state is LoginLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log in ',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
              onPressed: state is LoginLoading ? null : onLoginPressed,
              backgroundColor: const Color(0xff154212),
              textColor: Colors.white,
            );
          },
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            const SizedBox(width: 10),
            Text(
              'Or sign in with ',
              style: GoogleFonts.nunitoSans(fontSize: 14),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 25),
        // Google Button with loading state
        BlocBuilder<GoogleLoginCubit, GoogleLoginState>(
          builder: (context, state) {
            return CustomElevatedButton(
              borderRadius: 16,
              text: state is GoogleLoginLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in with Google ',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                        const Icon(Icons.g_mobiledata),
                      ],
                    ),
              onPressed: state is GoogleLoginLoading ? null : onGooglePressed,
              border: const BorderSide(color: Colors.black54, width: 1),
              backgroundColor: Colors.white,
              textColor: const Color(0xff154212),
            );
          },
        ),
      ],
    );
  }
}
