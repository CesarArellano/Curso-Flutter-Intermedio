import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  AnimationController _controller;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);

  String get songTotalDuration => this.printDuration(this._songDuration);
  String get currentSecond => this.printDuration(this._current);

  double get percentage => (this._songDuration.inSeconds > 0)
                          ? this._current.inSeconds / this._songDuration.inSeconds
                          : 0;
  Duration get songDuration => this._songDuration;
  
  set songDuration(Duration value) {
    this._songDuration = value;
    notifyListeners();
  }

  Duration get current => this._current;
  
  set current(Duration value) {
    this._current= value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if(n >= 10) return '$n';
      return '0$n';
    }
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  AnimationController get controller => this._controller;

  set controller(AnimationController value) {
    this._controller = value;
  }
}