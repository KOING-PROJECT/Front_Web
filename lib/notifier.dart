import 'package:flutter/material.dart';

IndexNotifier indexNotifier=IndexNotifier();

class IndexNotifier extends ChangeNotifier{
int _selectedIndex=0;
int get selectedIndex=>_selectedIndex;
  void updateIndex(int index){
    _selectedIndex=index;
    notifyListeners();
  }

}