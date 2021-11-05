import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  String _currentNumber = '0';
  String _prevNumber = '';
  double _firstNum = 0.0;
  double _secondNum = 0.0;
  double _fontsize = 70.0;
  String operation = '';
  String delimetr = '';
  double _opacity = 0.0;

  double get getOpacity => _opacity;
  double get getFontsize => _fontsize;
  String get getCurrentNumber => _currentNumber;
  String get getPrevNumber => _prevNumber;

  updateDisplay(String value) {
    // if (_currentNumber.length >= 16) {

//______________check operations ___________//
    if (_currentNumber == '0' && value == '÷') {
      return _currentNumber;
    } else if (_currentNumber == '0' && value == '*') {
      return _currentNumber;
    } else if (_currentNumber == '0' && value == '-') {
      return _currentNumber;
    } else if (_currentNumber == '0' && value == '+') {
      return _currentNumber;
    }
    if (_currentNumber == '0' && value == '.') {
      _currentNumber = '0';
    } else if (_currentNumber == '0' && value != '.') {
      _currentNumber = '';
    } else if (_currentNumber.contains('.') && value == '.') {
      return _currentNumber;
    }

//__________________________________________________//

    // _prevNumber = removeDecimalZeroFormat(_firstNum);

    addOperation(value);

    if (operation != '') {
      _opacity = 1.0;
    }

    changeSizeNumber(_currentNumber.length);

    notifyListeners();
  }

  void changeSizeNumber(int size) {
    if (size <= 5) {
      _fontsize = 70.0;
    } else if (size <= 9) {
      _fontsize = 60.0;
    } else if (size <= 12) {
      _fontsize = 50.0;
    } else if (size >= 20) {
      _fontsize = 25.0;
    }
    notifyListeners();
  }

  void addOperation(String value) {
    if (value == '+' ||
        value == '-' ||
        value == '*' ||
        value == '÷' ||
        value == '=') {
      operation = value;
    }

    if (value != operation) {
      _currentNumber += value;
      _firstNum = double.parse(_currentNumber);
    } else if (operation == '+' ||
        operation == '-' ||
        operation == '*' ||
        operation == '÷') {
      _secondNum = double.parse(_currentNumber);
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
    _prevNumber = '';
    operation = '';
    _opacity = 0.0;
    changeSizeNumber(_currentNumber.length);
  }

  //__________________remove trailing zeros _____________//
  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
  //__________________________________________________________//

  compute() {
    double computetion;
    if (_currentNumber != operation) {
      _firstNum = double.parse(_currentNumber);
    } else if (operation == '+' ||
        operation == '-' ||
        operation == '*' ||
        operation == '÷') {
      _secondNum = double.parse(_currentNumber);
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
      case '÷':
        computetion = _secondNum / _firstNum;
        break;
      default:
        return;
    }
    changeSizeNumber(_currentNumber.length);
    _currentNumber = removeDecimalZeroFormat(computetion);

    _prevNumber = removeDecimalZeroFormat(_secondNum) +
        ' ' +
        operation +
        ' ' +
        removeDecimalZeroFormat(_firstNum) +
        ' =';
    operation = '';
  }
}
