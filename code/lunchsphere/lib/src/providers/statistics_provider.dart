import 'dart:async';

import 'package:flutter/cupertino.dart';

class StatisticsProvider with ChangeNotifier {
  int _buttonPressCount = 0;
  int _elapsedTime = 0;
  int _cardTimerDuration = 0;
  final _cardTimers = <int, int>{};
  Timer? _timer;
  Timer? _cardTimer;

  int get buttonPressCount => _buttonPressCount;
  int get elapsedTime => _elapsedTime;
  int get cardTimerDuration => _cardTimerDuration;
  Map<int, int> get cardTimers => _cardTimers;

  void incrementCount() {
    _buttonPressCount++;
    notifyListeners(); // This will notify all the listeners about the change
  }

  void reset() {
    _buttonPressCount = 0;
    _cardTimers.clear();
    _cardTimerDuration = 0;
    _cardTimer?.cancel();
    _timer?.cancel();
    _elapsedTime = 0;
    notifyListeners();
  }

  void startCardTimer() {
    _cardTimer?.cancel(); // Cancel any existing timer
    _cardTimerDuration = 0;
    _cardTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _cardTimerDuration++;
        notifyListeners();
      },
    );
  }

  void stopCardTimer(int groupScheduleId) {
    _cardTimer?.cancel();
    _cardTimers[groupScheduleId] =
        (_cardTimers[groupScheduleId] ?? 0) + _cardTimerDuration;
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
    _cardTimer?.cancel();
    super.dispose();
  }
}
