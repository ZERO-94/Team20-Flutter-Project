import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/slide_row.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyKitchenPage extends StatefulWidget {
  const MyKitchenPage({Key? key}) : super(key: key);

  @override
  _MyKitchenPageState createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {

  Map todayMealsData = {
    "date": "2020-01-10",
    "mbi" : 18.5,
    "maxKcal": 1000,
    "currentKcal": 800,
    "foodList" : [
      {
        "id": 1,
        "imageUrl": "https://images.unsplash.com/photo-1619095956510-24c12e2c4b9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80",
        "title": "Bánh mì nướng"
      },
      {
        "id": 2,
        "imageUrl": "https://images.unsplash.com/photo-1607532941433-304659e8198a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1078&q=80",
        "title": "Salad"
      },
      {
        "id": 3,
        "imageUrl": "https://images.unsplash.com/photo-1608877907149-a206d75ba011?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
        "title": "Bít tết"
      },
      {
        "id": 4,
        "imageUrl": "https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        "title": "Mì"
      },
    ]
  };

  Map getSatus(double percent) {
    if(percent <= 75)
      return {
        "color": Colors.green,
        "comment": "Bạn đang có một chế độ ăn khỏe mạnh!",
      };
    else if(percent <= 85)
      return {
        "color": Colors.yellow[700],
        "comment": "Bạn nên giảm lượng Kcal lại",
      };
    else
      return {
        "color": Colors.red,
        "comment": "Bạn sắp đạt mức tối đa của ngày!",
    };
  }

  @override
  Widget build(BuildContext context) {
    Map status = getSatus(todayMealsData["currentKcal"] / todayMealsData["maxKcal"] * 100);
    return Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: CircularPercentIndicator(
              radius: 150.0,
              lineWidth: 15.0,
              percent: todayMealsData["currentKcal"] / todayMealsData["maxKcal"],
              center: Text(
                  '${(todayMealsData["currentKcal"] / todayMealsData["maxKcal"] * 100)}%',
                  style: TextStyle(
                    fontSize: 30
                  )
              ),
              progressColor: status["color"],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Text(
                    'Mức độ kcal bạn đã thu nạp: ${todayMealsData["currentKcal"]}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ),
                Text('Bạn sắp đạt mức tối đa của ngày',
                    style: TextStyle(
                      fontSize: 18,
                      color: status["color"],
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            ),
          ),
          Expanded(
              child: BottomTab(todayMealsData["foodList"], todayMealsData["mbi"]),
          )
        ],
      )
    );
  }
}

class BottomTab extends StatelessWidget {
  List<Map> foodList = [];
  double mbi = 0.0;

  BottomTab(List<Map> foodList, double mbi) {
    this.foodList = foodList;
    this.mbi = mbi;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)
          )
      ),
      child: Column(
        children: [
          Text(
            'Chỉ số BMI của tôi: 18.5',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          Text(
            'Lời khuyên: Chỉ số ở mức bình thường, khỏe mạnh',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey[500]
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            'Hôm nay bạn đã ăn',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),
          ),
          SizedBox(height: 5.0),
          SlideRow(foodList),
          SizedBox(height: 5.0),
          TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
              ),
              child: Text(
                'Hoàn thành 1 ngày của tôi',
                style: TextStyle( color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}


