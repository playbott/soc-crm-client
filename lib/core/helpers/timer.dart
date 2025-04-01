import 'dart:async';

import 'package:client/global.dart';

class ResettableTimer {
  ResettableTimer({required this.duration, required this.action});

  final Duration duration;
  final VoidCallback action;

  Timer? _timer;
  bool _isActive = false;

  void startTimer() {
    if (_isActive) {
      return;
    }
    _isActive = true;
    _timer = Timer(duration, onTimerComplete);
  }

  void resetTimer() {
    _isActive = false;
    _timer?.cancel();
  }

  void onTimerComplete() {
    action();
    _isActive = false;
  }
}
