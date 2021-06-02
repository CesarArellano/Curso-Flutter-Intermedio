import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  
  ThemeData _currentTheme;
  
  ThemeChanger( int theme ) {
    switch(theme) {
      case 1: // Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.pink
        );
      break;

      case 2: // Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink,
          primaryColorLight: Colors.white,
        );
      break;

      case 3: // Custom theme
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.dark();
      break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;
    }
  }
  
  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    this._customTheme = false;
    this._darkTheme = value;
    if(value) {
      this._currentTheme = ThemeData.dark().copyWith(
        accentColor: Colors.pink,
        primaryColorLight: Colors.white,
      );
    } else {
      this._currentTheme = ThemeData.light().copyWith(
        accentColor: Colors.pink
      );
    }
    notifyListeners();
  }

  set customTheme(bool value) {    
    this._darkTheme = false;
    this._customTheme = value;

    if(value) {
      this._currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),

        
      );
    } else {
      this._currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}