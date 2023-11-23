import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalProvider with ChangeNotifier {
  String _currInput = '';
  String output = '';
  Parser parser = Parser();
// double totalSum =0;
  TextEditingController digitcont = TextEditingController();
  get currentInput => _currInput;
  get currentOutput => output;

//to append inputs by user
  void appendInputs(String value) {
    debugPrint("Called");
    _currInput += value;

    notifyListeners();
  }

  // void onPressEqual() {
  //   Expression exp = parser.parse(_currInput);
  //   double result = exp.evaluate(EvaluationType.REAL, ContextModel());
  //   debugPrint("result: $result");
  //   _currInput = result.toString();
  //   notifyListeners();
  // }

  //to clear single input

  void clearSingleInput() {
    _currInput = _currInput.isNotEmpty
        ? _currInput.substring(0, _currInput.length - 1)
        : '';
    notifyListeners();
  }

  void clearAllInput() {
    _currInput = " ";
    output = " ";
    notifyListeners();
  }

  void performOperation() {
    List<String> operators = ['+', '-', '*', '/', '%'];

    double result = 0;
    double numericOperand = 0;
    String currentOperand = '';
    String currentOperator = '+';

    for (int i = 0; i < _currInput.length; i++) {
      String char = _currInput[i];
      if (operators.contains(char)) {
        // Found an operator, calculate the previous operand
        numericOperand = double.tryParse(currentOperand) ?? 0;

        switch (currentOperator) {
          case '+':
            result += numericOperand;
            break;
          case '-':
            result -= numericOperand;
            break;
          case 'x':
            result *= numericOperand;
            break;
          case '/':
            if (numericOperand != 0) {
              result /= numericOperand;
            } else {
              output = 'Error';
              notifyListeners();
              return;
            }
            break;
          case '%':
            if (numericOperand != 0) {
              result = result % numericOperand;
            } else {
              output = 'Error';
              notifyListeners();
              return;
            }
            break;
        }

        // Reset currentOperand and update currentOperator
        currentOperand = '';
        currentOperator = char;
      } else {
        // Found a digit or decimal point
        currentOperand += char;
      }
    }

    // Calculate the last operand outside the loop
    numericOperand = double.tryParse(currentOperand) ?? 0;

    switch (currentOperator) {
      case '+':
        result += numericOperand;
        break;
      case '-':
        result -= numericOperand;
        break;
      case '*':
        result *= numericOperand;
        break;
      case '/':
        if (numericOperand != 0) {
          result /= numericOperand;
        } else {
          output = 'Error';
          notifyListeners();
          return;
        }
        break;
      case '%':
        if (numericOperand != 0) {
          result = result % numericOperand;
        } else {
          output = 'Error';
          notifyListeners();
          return;
        }
        break;
    }

    output = result.toString();
    _currInput = output;

    notifyListeners();
  }
}
