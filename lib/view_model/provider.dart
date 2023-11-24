import 'package:basic_calculator/ui_helper/custom_toast.dart';
import 'package:basic_calculator/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalProvider with ChangeNotifier {
  static String _currInput = '';
  String output = '';
  Parser parser = Parser();

  TextEditingController digitcont =
      TextEditingController(text: _currInput.toString());
  get currentInput => _currInput;
  get currentOutput => output;

  @override
  void dispose() {
    super.dispose();
    digitcont.dispose();
  }

  void appendInputs(String value) {
    if (value == AppStrings.decimal &&
        _currInput.endsWith(AppStrings.decimal)) {
      output = AppStrings.invalid;
      CustomToast.toastMessage("$output");
      notifyListeners();
      return;
    }

    // if (_currInput.endsWith(AppStrings.divide) && (value == AppStrings.sub || value == AppStrings.add)) {

    //   _currInput += value;
    //   notifyListeners();
    //   return;
    // }

    if (_currInput.isNotEmpty && isOperator(_currInput[_currInput.length - 1]) &&
        isOperator(value)) {
      output = AppStrings.invalid;
      _currInput = output;
      digitcont.text = _currInput;
      notifyListeners();
      return;
    }
    digitcont.text = _currInput;
    int location = digitcont.selection.start;
    if (location < 0) {
      debugPrint("Location Error Found");
      return;
    }

    // Get the left text of cursor
    String prefixText = digitcont.text.substring(0, location);
    String suffixText = digitcont.text.substring(location);

    debugPrint(
        "Location is: $location \n prefixText is : $prefixText \n suffixText is: $suffixText \n value is: $value");
    _currInput = prefixText + value + suffixText;
    digitcont.text = _currInput;
    // digitcont.selection = TextSelection(
    //   baseOffset: location + value.length,
    //   extentOffset: location + value.length,
    // );
    // _currInput = _currInput.substring(0, location) + value +_currInput.substring(location, _currInput.length);
    // _currInput += value;
    notifyListeners();
  }

  bool isOperator(String value) {
    List<String> operators = [
      AppStrings.add,
      AppStrings.sub,
      AppStrings.mltiply,
      AppStrings.divide,
      AppStrings.remainder
    ];
    return operators.contains(value);
  }

  void refreshInput() {
    _currInput = '';
    output = '';
    notifyListeners();
  }

// void appendInputs(String value) {
//   debugPrint("Called");

//   if (_currInput.isNotEmpty && isOperator(_currInput[_currInput.length - 1]) && isOperator(value)) {
//     // If the last character is an operator and the new value is an operator, trigger an error
//     output = 'Error: Invalid input';
//     notifyListeners();
//     return;
//   }

//   _currInput += value;
//   notifyListeners();
// }

// bool isOperator(String value) {
//   List<String> operators = ['+', '-', '*', '/', '%'];
//   return operators.contains(value);
// }

// void refreshInput() {
//   _currInput = '';
//   output = '';
//   notifyListeners();
// }
  // void appendInputs(String value) {
  //   debugPrint("Called");
  //   _currInput += value;

  //   notifyListeners();
  // }

  //to clear single input

  void clearSingleInput() {
    // _currInput = _currInput.isNotEmpty
    //     ? _currInput.substring(0, _currInput.length - 1)
    //     : '';

    int location = digitcont.selection.start;
    if (location < 0) {
      debugPrint("Location Error Found ");
      return;
    }

    // Get the left text of cursor
    String prefixText = digitcont.text.substring(0, location);
    String suffixText = digitcont.text.substring(location);

    try {
      prefixText = prefixText.substring(0, prefixText.length - 1);
      digitcont.text = prefixText + suffixText;
      digitcont.selection = TextSelection(
        baseOffset: location,
        extentOffset: location + 1,
      );
    } catch (e) {}
    notifyListeners();
  }

  void clearAllInput() {
    _currInput = " ";
    output = " ";
    digitcont.text = "";
    notifyListeners();
  }

  //perform operations

  void performOperation() {
    List<String> operators = [
      AppStrings.add,
      AppStrings.sub,
      AppStrings.mltiply,
      AppStrings.divide,
      AppStrings.remainder
    ];

    double result = 0;
    double numericOperand = 0;
    String currentOperand = '';
    String currentOperator = AppStrings.add;
    bool lastWasOperator = false;
    _currInput = digitcont.text.toString();

    debugPrint("Expression is $_currInput");
    for (int i = 0; i < _currInput.length; i++) {
      String char = _currInput[i];

      if (operators.contains(char)) {
        if (lastWasOperator) {
          output = AppStrings.invalid;
          _currInput = output;
          notifyListeners();
          return;
        }

        if (currentOperand.isEmpty) {
          output = AppStrings.missingop;
          _currInput = output;
          notifyListeners();
          return;
        }

        numericOperand = double.tryParse(currentOperand) ?? 0;

        switch (currentOperator) {
          case AppStrings.add:
            result += numericOperand;
            break;
          case AppStrings.sub:
            result -= numericOperand;
            break;
          case AppStrings.mltiply:
            result *= numericOperand;
            break;
          case AppStrings.divide:
            if (numericOperand != 0) {
              result /= numericOperand;
            } else {
              output = AppStrings.opwithZero;
              _currInput = output;
              digitcont.text = _currInput;
              notifyListeners();
              return;
            }
            break;
          case AppStrings.remainder:
            if (numericOperand != 0) {
              result = result % numericOperand;
            } else {
              output = AppStrings.cantModulo;
              _currInput = output;
              notifyListeners();
              return;
            }
            break;
        }

        currentOperator = char;

        currentOperand = '';
        lastWasOperator = true;
      } else {
        currentOperand += char;
        lastWasOperator = false;
      }
    }

    if (operators.contains(_currInput[_currInput.length - 1])) {
      output = AppStrings.invalid;
      _currInput = output;
      notifyListeners();
      return;
    }

    // Check for an empty final operand
    if (currentOperand.isEmpty) {
      output = AppStrings.missingop;
      _currInput = output;
      notifyListeners();
      return;
    }

    // Calculate the last operand outside the loop
    numericOperand = double.tryParse(currentOperand) ?? 0;

    switch (currentOperator) {
      case AppStrings.add:
        result += numericOperand;
        break;
      case AppStrings.sub:
        result -= numericOperand;
        break;
      case AppStrings.mltiply:
        result *= numericOperand;
        break;
      case AppStrings.divide:
        if (numericOperand != 0) {
          result /= numericOperand;
        } else {
          output = AppStrings.opwithZero;
          _currInput = output;
          notifyListeners();
          return;
        }
        break;
      case AppStrings.remainder:
        if (numericOperand != 0) {
          result = result % numericOperand;
        } else {
          output = AppStrings.cantModulo;
          _currInput = output;
          notifyListeners();
          return;
        }
        break;
    }

    output = result.toString();
    _currInput = output;
    digitcont.text = _currInput;
    notifyListeners();
  }
}
