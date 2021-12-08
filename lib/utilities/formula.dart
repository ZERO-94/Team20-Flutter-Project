import 'package:flutter/material.dart';

class Formula {
  static calculateMbi (double weight, double height) {
    return (weight / (height / 100 * height/ 100) / 10).toStringAsFixed(1);
  }

  static calculateKcalMax (String gender, double weight, double height, int age, int workingLevel) {
    if(gender == 'Nam') {
      return 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    } else {
      return 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
    }
  }
  static calculateTotalKcal(List<int> kcals){
    double totalKcal = 0;
     for(var kcal  in kcals) {
       totalKcal +=kcal;
     }
     print("Total: $totalKcal");
     return totalKcal;
  }
}