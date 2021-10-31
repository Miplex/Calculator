import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  String _currentNumber = '0';
  String _prevNumber = '0';
  double _firstNum = 0.0;
  double _secondNum = 0.0;
  double _fontsize = 53.2;
  String operation = '';
  String delimetr = '';

  double get getFontsize => _fontsize;
  String get getCurrentNumber => _currentNumber;
  String get getPrevNumber => _prevNumber;

  updateDisplay(String value) {
    if (_currentNumber.length >= 16) {
      return;
    }

    if (_currentNumber == '0') {
      _currentNumber = '';
    }

    addOperation(value);

    changeSizeNumber(_currentNumber.length);

    notifyListeners();
  }

  void changeSizeNumber(int size) {
    if (size <= 9) {
      _fontsize = 53.2;
    } else if (size <= 14) {
      _fontsize = 40.0;
    } else if (size <= 18) {
      _fontsize = 30.0;
    } else if (size >= 20) {
      _fontsize = 25.0;
    }
    notifyListeners();
  }

  void addOperation(String value) {
    if (value == '+' ||
        value == '-' ||
        value == '*' ||
        value == '/' ||
        value == '=') {
      operation = value;
    }

    if (value != operation) {
      _currentNumber += value;
      _firstNum = double.parse(_currentNumber);
    } else if (operation == '+' ||
        operation == '-' ||
        operation == '*' ||
        operation == '/') {
      _secondNum = double.parse(_currentNumber);
      _prevNumber = _currentNumber += value;
      _currentNumber = '0';
    }
  }

  void delete() {
    if (_currentNumber != '0') {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 1);
      changeSizeNumber(_currentNumber.length);
    }
    if (_currentNumber.isEmpty) {
      _currentNumber = '0';
    }

    notifyListeners();
  }

  void clear() {
    _currentNumber = '0';
    _prevNumber = '0';
    notifyListeners();
  }

  compute() {
    double computetion;
    if (_currentNumber != operation) {
      _firstNum = double.parse(_currentNumber);
    } else if (operation == '+' ||
        operation == '-' ||
        operation == '*' ||
        operation == '/') {}

    switch (operation) {
      case '+':
        computetion = _secondNum + _firstNum;
        break;
      case '-':
        computetion = _secondNum - _firstNum;
        break;
      case '*':
        computetion = _secondNum * _firstNum;
        break;
      case '/':
        computetion = _secondNum / _firstNum;
        break;
      default:
        return;
    }

    _currentNumber = computetion.toString();
    changeSizeNumber(_currentNumber.length);
  }
}
