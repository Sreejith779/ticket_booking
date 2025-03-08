import 'package:flutter/cupertino.dart';

class BottomNavController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void isSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
