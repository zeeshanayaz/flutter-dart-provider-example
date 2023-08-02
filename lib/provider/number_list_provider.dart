import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, ];

  void add() {
    numbers.add(numbers.isEmpty ? 1 : numbers.last + 1);
    notifyListeners();
  }
}
