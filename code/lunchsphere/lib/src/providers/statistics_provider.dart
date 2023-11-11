import 'dart:async';

import 'package:flutter/cupertino.dart';

class StatisticsProvider with ChangeNotifier {
  int _buttonPressCount = 0;
  int _elapsedTime = 0;
  Timer? _timer;

  int get buttonPressCount => _buttonPressCount;
  int get elapsedTime => _elapsedTime;

  void incrementCount() {
    _buttonPressCount++;
    notifyListeners(); // This will notify all the listeners about the change
  }

  void reset() {
    _buttonPressCount = 0;
    _timer?.cancel();
    _elapsedTime = 0;
    notifyListeners();
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _elapsedTime = 0;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _elapsedTime++;
        notifyListeners();
      },
    );
  }

  void stopTimer() {
    _timer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
