import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  String _currentNumber = '0';
  String _prevNumber = '';

  String get getCurrentNumber => _currentNumber;
  String get getPrevNumber => _prevNumber;

  updateDisplay(String value) {
    _currentNumber += value;
    _prevNumber += value;
    notifyListeners();
  }
}
