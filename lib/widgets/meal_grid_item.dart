import 'package:flutter/material.dart';
import 'package:food_app/pages/food_list_page.dart';

import 'package:provider/provider.dart';

class MealGridItem extends StatelessWidget {
  String title = "";
  String subtitle = "";
  String imageUrl = "";
  String navigateLink = "";

  MealGridItem (this.title, this.subtitle, this.imageUrl, this.navigateLink);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {

            Navigator.push(context, MaterialPageRoute(builder: (_){
              return FoodListPage(title: title);
            }));

          },
          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white,
          title: Container(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black
                    )
                ),
                Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.grey[500]
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
