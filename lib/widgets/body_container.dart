import 'package:calculator/constants/appcolors.dart';
import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;

  const ScreenContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomRight,
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.3, // 80% of screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: CalculatorColors.screenColor, // You can customize the color
      ),
      padding: const EdgeInsets.all(16.0), // You can adjust the padding
      child: child,
    );
  }
}

class CalculatorContainer extends StatelessWidget {
  final Widget child;

  const CalculatorContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      // 80% of screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: CalculatorColors.keypad, // You can customize the color
      ),
      padding: const EdgeInsets.all(16.0), // You can adjust the padding
      child: child,
    );
  }
}
