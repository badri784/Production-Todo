import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/bloc/sing_to_app_with_email_and_password/signup/sign_up_cubit.dart';
import 'package:pro_todo/core/bloc/google_login/google_login_cubit.dart';
import 'package:pro_todo/feature/widget/cutom_elevated_botton.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({
    super.key,
    required this.onSignUpPressed,
    required this.onGooglePressed,
  });

  final VoidCallback onSignUpPressed;
  final VoidCallback onGooglePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Sign Up Button with loading state
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return CustomElevatedButton(
              borderRadius: 16,
              text: state is SignUpLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      'SIGN UP',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeightHelper.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
              onPressed: state is SignUpLoading ? null : onSignUpPressed,
              backgroundColor: const Color(0xff154212),
              textColor: Colors.white,
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            const SizedBox(width: 10),
            Text(
              'OR SIGN UP WITH',
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeightHelper.regular,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: BlocBuilder<GoogleLoginCubit, GoogleLoginState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    borderRadius: 12,
                    text: state is GoogleLoginLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(FontAwesomeIcons.google),
                              const SizedBox(width: 8),
                              Text(
                                'Google',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  fontWeight: FontWeightHelper.bold,
                                ),
                              ),
                            ],
                          ),
                    onPressed: state is GoogleLoginLoading ? null : onGooglePressed,
                    border: const BorderSide(color: Colors.black12, width: 1),
                    backgroundColor: Colors.white,
                    textColor: Colors.black87,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomElevatedButton(
                borderRadius: 12,
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.facebook),
                    const SizedBox(width: 8),
                    Text(
                      'Facebook',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  // Facebook login not yet implemented
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Facebook login coming soon!')),
                  );
                },
                border: const BorderSide(color: Colors.black12, width: 1),
                backgroundColor: Colors.white,
                textColor: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
