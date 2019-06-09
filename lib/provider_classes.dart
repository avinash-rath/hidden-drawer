import 'package:flutter/material.dart';

class HeartCounter with ChangeNotifier{

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