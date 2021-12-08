import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];

  UnmodifiableListView<User> get getUsers => UnmodifiableListView(_users);

  void addUser(String name, int age, double weight, double height,
      int workingLevel, String gender) {
    _users.add(User(
        username: name,
        userAge: age,
        userGender: gender,
        userWeight: weight,
        userHeight: height,
        userWorkingLevel: workingLevel));
    notifyListeners();
  }
  void clearUsers(){
    _users.clear();
    notifyListeners();
  }
}
