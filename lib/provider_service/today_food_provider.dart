import 'dart:collection';

import 'package:flutter/material.dart';

class ToDayFoodProvider extends ChangeNotifier {
  List<int> _items =  [];
  List<int> _kcals = [];
  List<String> _imageUrls = [];
  List<String> _names = [];
  List<int> get getItems => _items;
  List<int> get getKcals => _kcals;
  List<String> get getImageUrls => _imageUrls;
  List<String> get getNames => _names;
  void addItem(int index,int kcal,String imageUrl,String name){
    _items.add(index);
    _kcals.add(kcal);
    _imageUrls.add(imageUrl);
    _names.add(name);
    notifyListeners();
  }
  void removeItem(int index,int kcal,String imageUrl,String name){
    _items.remove(index);
    _kcals.remove(kcal);
    _imageUrls.remove(imageUrl);
    _names.remove(name);
    notifyListeners();
  }
  void clearItems(){
    _items.clear();
    _kcals.clear();
    _imageUrls.clear();
    _names.clear();
    notifyListeners();
  }


}