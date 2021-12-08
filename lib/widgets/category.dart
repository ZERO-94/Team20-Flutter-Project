import 'package:flutter/material.dart';
import 'package:food_app/widgets/meal_grid_item.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20),
          )
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
              child: const Text(
                  'Chọn bữa ăn',
                style: TextStyle(
                    fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                  childAspectRatio: 2 / 1.8, crossAxisSpacing: 30, mainAxisSpacing: 30,
                children: <Widget>[
                  MealGridItem("Bữa sáng", "Từ 6h-10h", "images/breakfast.png", "/food-list"),
                  MealGridItem("Bữa trưa", "Từ 11h-13h", "images/lunch.png", "/food-list"),
                  MealGridItem("Bữa phụ", "Từ 14h-17h", "images/fun.png", "/food-list"),
                  MealGridItem("Bữa tối", "Từ 18h-21h", "images/dinner.png", "/food-list")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
