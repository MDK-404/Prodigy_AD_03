import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  late Timer _timer;
  int _hour = 0;
  int _minute = 0;
  int _seconds = 0;
  int _miliseconds = 0;
  bool _startEnable = true;
  bool _stopEnable = true;
  bool _continueEnable = false;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  int get miliseconds => _miliseconds;
  bool get startEnable => _startEnable;
  bool get stopEnable => _stopEnable;
  bool get continueEnable => _continueEnable;

  void startTimer() {
    _hour = 0;
    _seconds = 0;
    _seconds = 0;
    _miliseconds = 0;
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_miliseconds < 59) {
        _miliseconds++;
      } else if (_miliseconds == 59) {
        _miliseconds = 0;
        if (_seconds == 59) {
          _minute++;
          _seconds = 0;
        } else {
          _seconds++;
        }
      }
      notifyListeners();
    });
  }

  void pauseTimer() {
    if (_startEnable == false) {
      _startEnable = false;
      _stopEnable = false;
      _continueEnable = true;
      _timer.cancel();
    }

    notifyListeners();
  }

  void continueTimer() {
    _startEnable = false;
    _stopEnable = true;
    _continueEnable = false;

    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_miliseconds < 59) {
        _miliseconds++;
      } else if (_miliseconds == 59) {
        _miliseconds = 0;
        if (_seconds == 59) {
          _minute;
          _seconds = 0;
        } else {
          _seconds++;
        }
      }
      notifyListeners();
    });
  }

  void resetTimer() {
    _hour = 0;
    _minute = 0;
    _seconds = 0;
    _miliseconds = 0;
    _startEnable = true;
    _stopEnable = true;
    _continueEnable = true;
    _timer.cancel();
    notifyListeners();
  }
}
