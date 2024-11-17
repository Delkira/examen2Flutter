import 'package:flutter/material.dart';

class CurrencyConverterProvider extends ChangeNotifier {
  final double _exchangeRate = 6.96;
  String _input = '';
  String _result = '';
  bool _isToDollars = true;

  String get input => _input;
  String get result => _result;
  bool get isToDollars => _isToDollars;

  void setInput(String value) {
    _input = value;
    _convert();
  }

  void toggleConversion() {
    _isToDollars = !_isToDollars;
    _convert();
  }

  void _convert() {
    if (_input.isEmpty) {
      _result = '';
      notifyListeners();
      return;
    }

    try {
      final amount = double.parse(_input);
      _result = _isToDollars
          ? (amount / _exchangeRate).toStringAsFixed(2) + ' USD'
          : (amount * _exchangeRate).toStringAsFixed(2) + ' BOB';
    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }
}
