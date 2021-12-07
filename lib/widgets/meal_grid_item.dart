import 'package:flutter/material.dart';

class MealGridItem extends StatelessWidget {
  String title = "";
  String subtitle = "";
  String imageUrl = "";
  String navigateLink = "";

  MealGridItem (String title, String subtitle, String imageUrl, String navigateLink) {
    this.title = title;
    this.subtitle = subtitle;
    this.imageUrl = imageUrl;
    this.navigateLink = navigateLink;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "food_list");
          },
          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white,
          title: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
