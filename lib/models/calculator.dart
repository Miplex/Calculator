import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  String _currentNumber = '0';
  String _prevNumber = '0';
  double firstNum = 0.0;
  double secondNum = 0.0;

  String get getCurrentNumber => _currentNumber;
  String get getPrevNumber => _prevNumber;

  updateDisplay(String value) {
    if (_currentNumber == '0') {
      _currentNumber = '';
    }
    _currentNumber += value;

    notifyListeners();
  }

  void delete() {
    if (_currentNumber != '0') {
      _currentNumber = _currentNumber.substring(0, _currentNumber.length - 1);
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
}
