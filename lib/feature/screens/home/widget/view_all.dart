import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';

class ViewAllText extends StatelessWidget {
  const ViewAllText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Today\'s Tasks',
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeightHelper.regular,
            fontSize: 22,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'View All',
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeightHelper.semiBold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
