import 'package:flutter/material.dart';

class BaseConverterProvider extends ChangeNotifier {
  String _input = '';
  String _result = '';
  int _base = 2;

  String get input => _input;
  String get result => _result;
  int get base => _base;

  void setInput(String value) {
    _input = value;
    _convert();
  }

  void setBase(int value) {
    _base = value;
    _convert();
  }

  void _convert() {
    if (_input.isEmpty) {
      _result = '';
      notifyListeners();
      return;
    }

    try {
      final number = int.parse(_input);
      switch (_base) {
        case 2:
          _result = number.toRadixString(2);
          break;
        case 8:
          _result = number.toRadixString(8);
          break;
        case 16:
          _result = number.toRadixString(16).toUpperCase();
          break;
        default:
          _result = number.toString();
      }
    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }
}
