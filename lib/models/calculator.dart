import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  String _currentNumber = '0';
  String _prevNumber = '0';
  double _firstNum = 0.0;
  double _secondNum = 0.0;
  double _fontsize = 53.2;
  String operation = '';

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
    if (value == '+' ||
        value == '-' ||
        value == '*' ||
        value == '/' ||
        value == '=') {
      operation = value;
      //print(operation);
    }
    if (value != operation) {
      _currentNumber += value;
      _firstNum = double.parse(_currentNumber);
      // print(_firstNum);
    } else if (operation == '+' ||
        operation == '-' ||
        operation == '*' ||
        operation == '/') {
      //не правильно работает разобраться
      _secondNum = double.parse(_currentNumber);
      _prevNumber = _currentNumber += value;
      _currentNumber = '0';

      // print(_secondNum);
    }
    // _currentNumber += value;
    changeSizeNumber(_currentNumber.length);
    notifyListeners();
  }

  changeSizeNumber(int size) {
    if (size <= 9) {
      _fontsize = 53.2;
    } else if (size == 10) {
      _fontsize = 43.0;
    } else if (size == 15) {
      _fontsize = 35.0;
    }

    return _fontsize;
  }

  void delete() {
    if (_currentNumber != '0') {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 1);
    }
    if (_currentNumber.isEmpty) {
      _currentNumber = '0';
    }
    changeSizeNumber(_currentNumber.length);
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
      // print(_firstNum);
    } else if (operation == '+' ||
        operation == '-' ||
        operation == '*' ||
        operation == '/') {
      // _prevNumber = _currentNumber + operation;
      // _currentNumber = '0';
      // _secondNum = double.parse(_currentNumber);
      // print(_secondNum);
    }

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

    // print(_firstNum);
    // print(_secondNum);
    // print(operation);
    // print(computetion);
    // print(_currentNumber);
  }
}
