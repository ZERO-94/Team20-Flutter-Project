import 'dart:collection';

import 'package:flutter/material.dart';

class ToDayFoodProvider extends ChangeNotifier {
  List<int> _items =  [];
  UnmodifiableListView<int> get getItems => UnmodifiableListView(_items);
  void addItem(int index){
    _items.add(index);
    notifyListeners();
  }
  void removeItem(int index){
    _items.remove(index);
    notifyListeners();
  }
  void clearItems(){
    _items.clear();
    notifyListeners();
  }


}