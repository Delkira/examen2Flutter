import 'package:flutter/material.dart';

class PrimeCheckerProvider extends ChangeNotifier {
  String _input = '';
  String _result = '';

  String get input => _input;
  String get result => _result;

  void setInput(String value) {
    _input = value;
    _checkPrime();
  }

  void _checkPrime() {
    if (_input.isEmpty) {
      _result = '';
      notifyListeners();
      return;
    }

    try {
      final number = int.parse(_input);
      _result = _isPrime(number) ? 'Es primo' : 'No es primo';
    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }
}
