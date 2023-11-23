import 'package:calculator/constants/appcolors.dart';
import 'package:calculator/constants/button_values.dart';
import 'package:calculator/widgets/body_container.dart';
import 'package:calculator/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalulatorScreen extends StatefulWidget {
  const CalulatorScreen({super.key});

  @override
  State<CalulatorScreen> createState() => _CalulatorScreenState();
}

class _CalulatorScreenState extends State<CalulatorScreen> {
  String number1 = "";
  String operand = "";
  String number2 = "";

  void onBtnTap(String value) {
    if (value == Btn.del) {
      deleteInput();
      return;
    }

    if (value == Btn.rst) {
      clearInput();
      return;
    }

    if (value == Btn.calculate) {
      calculateValues();
      return;
    }

    addValue(value);
  }

//###################### function to calculate values

  void calculateValues() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    final double num1 = double.parse(number1);
    final double num2 = double.parse(number2);

    var result = 0.0;

    switch (operand) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.subtract:
        result = num1 - num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
        break;
      default:
    }

    setState(() {
      number1 = '$result';

      if (number1.endsWith(".0")) {
        number1 = number1.substring(0, number1.length - 2);
      }

      operand = "";
      number2 = "";
    });
  }

//###################### function to clear input
  void clearInput() {
    setState(() {
      number1 = "";
      operand = "";
      number2 = "";
    });
  }

//###################### function to delete input
  void deleteInput() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }

    setState(() {});
  }

//###################### function to add input
  void addValue(String value) {
    if (value != Btn.dot && int.tryParse(value) == null) {
      if (operand.isNotEmpty && number2.isNotEmpty) {
        calculateValues();
      }

      operand = value;
    } else if (number1.isEmpty || operand.isEmpty) {
      if (value == Btn.dot && number1.contains(Btn.dot)) return;
      if (value == Btn.dot && (number1.isEmpty || number1 == Btn.n0)) {
        value = "0.";
      }
      number1 += value;
    } else if (number2.isEmpty || operand.isNotEmpty) {
      if (value == Btn.dot && number2.contains(Btn.dot)) return;
      if (value == Btn.dot && (number2.isEmpty || number2 == Btn.n0)) {
        value = "0.";
      }
      number2 += value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColors.mainBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: SpecialButtonText(text: 'Calculator'),
              ),
              //output

              SingleChildScrollView(
                child: ScreenContainer(
                    child: Text(
                  "$number1$operand$number2".isEmpty
                      ? "0"
                      : "$number1$operand$number2",
                  style: GoogleFonts.leagueSpartan(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.end,
                )),
              ),

              const SizedBox(
                height: 10,
              ),

              CalculatorContainer(
                child: Wrap(
                  children: Btn.buttonValues
                      .map(
                        (value) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 8.0),
                          child: SizedBox(
                            width: [Btn.rst, Btn.calculate].contains(value)
                                ? MediaQuery.of(context).size.width * 0.333
                                : MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            child: buildButton(value),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )

              //buttons
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Material(
      color: [Btn.del, Btn.rst].contains(value)
          ? CalculatorColors.specialKeyBackground
          : [Btn.calculate].contains(value)
              ? CalculatorColors.specialKeyBackgroundRed
              : CalculatorColors.keyBackground,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => onBtnTap(value),
        child: Center(
          child: Text(
            value,
            style: GoogleFonts.leagueSpartan(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: [Btn.del, Btn.rst, Btn.calculate].contains(value)
                    ? CalculatorColors.specialText
                    : CalculatorColors.buttonText),
          ),
        ),
      ),
    );
  }
}



// const [Btn.rst, Btn.calculate].contains(value)
//           ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0)
//           : null,