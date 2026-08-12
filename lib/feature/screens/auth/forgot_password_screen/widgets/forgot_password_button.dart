import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/bloc/forgot_password/forgot_password_cubit.dart';
import 'package:pro_todo/feature/widget/cutom_elevated_botton.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          builder: (context, state) {
            return CustomElevatedButton(
              borderRadius: 16,
              text: state is ForgotPasswordLoading
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
                          'Send Reset Link ',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
              onPressed: state is ForgotPasswordLoading ? null : onPressed,
              backgroundColor: const Color(0xff154212),
              textColor: Colors.white,
            );
          },
        ),
      ],
    );
  }
}
