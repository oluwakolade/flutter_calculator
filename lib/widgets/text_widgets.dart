import 'package:calculator/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.leagueSpartan(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: CalculatorColors.buttonText),
      textAlign: TextAlign.center,
    );
  }
}

class SpecialButtonText extends StatelessWidget {
  final String text;

  const SpecialButtonText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.leagueSpartan(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: CalculatorColors.specialText),
      textAlign: TextAlign.center,
    );
  }
}
