import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get darkTheme => this._darkTheme;

  set darkTheme(bool value) {
    this._customTheme = false;
    this._darkTheme = value;
    notifyListeners();
  }
  bool get customTheme => this._customTheme;

  set customTheme(bool value) {    
    this._darkTheme = false;
    this._customTheme = value;
    notifyListeners();
  }
}