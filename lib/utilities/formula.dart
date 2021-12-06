import 'package:flutter/material.dart';

class Formula {
  static calculateMbi (double weight, double height) {
    return weight / (height * height);
  }

  static calculateKcal (bool isMale, double weight, double height, int age, double workingLevel) {
    if(isMale) return 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    else return 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
  }
}