import 'package:flutter/material.dart';

import 'zoom_scaffold.dart';

class HeartCounter with ChangeNotifier {
  int _heartCounter;

  HeartCounter(this._heartCounter);

  getCounter() => _heartCounter;

  setCounter(int counter) => _heartCounter = counter;

  void increment() {
    _heartCounter++;
    notifyListeners();
  }

  void decrement() {
    _heartCounter--;
    notifyListeners();
  }
}

class ScreenChangeNotifier with ChangeNotifier {
  String _id;
  Screen _activeScreen;

  ScreenChangeNotifier(this._id);

  getId() => _id;
  getScreen() => _activeScreen;

  setId(String id) {
    _id = id;
  }

  setScreen(Screen screen) {
    _activeScreen = screen;
  }

  updateId(String id) {
    _id = id;
    notifyListeners();
  }

  updateScreen(Screen screen) {
    _activeScreen = screen;
    notifyListeners();
  }
}
