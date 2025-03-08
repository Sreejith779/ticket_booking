import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeController extends ChangeNotifier{

  int _selectedTripIndex = 0;
int _selectedPassengersCount = 0;
int get  selectedPassengersCount => _selectedPassengersCount;

  int get selectedIndex => _selectedTripIndex;

  void selectedTrip(int index){
    _selectedTripIndex = index;
    notifyListeners();
  }

  void updateSelectedPassengersCount(int index){
    _selectedPassengersCount = index;
    notifyListeners();
  }
}