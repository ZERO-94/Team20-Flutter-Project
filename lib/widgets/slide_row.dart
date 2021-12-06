import 'package:flutter/material.dart';

class SlideRow extends StatelessWidget {
  List<Map> itemList = [];

  SlideRow(List<Map> itemList) {
      this.itemList = itemList;
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: itemList.map((item) =>
            Row(
              children: [
                SizedBox(width: 10,),
                SlideItem(item["imageUrl"], item["title"]),
              ]
            )).toList(),
      ),
    );

  }
}

class SlideItem extends StatelessWidget {
  String imageUrl = "";
  String title = "";

  SlideItem(String imageUrl, String title) {
    this.imageUrl = imageUrl;
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
          width: 110,
          height: 105,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
          Text(
              title.length > 7 ? '${title.substring(0, 7)}...' : title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
              )
          ),
      ]
      ),
    );
  }
}
