import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utilities/formula.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../provider_service/today_food_provider.dart';
import '../provider_service/user_provider.dart';

class MyKitchenPage extends StatefulWidget {
  const MyKitchenPage({Key? key}) : super(key: key);

  @override
  _MyKitchenPageState createState() => _MyKitchenPageState();
}

class _MyKitchenPageState extends State<MyKitchenPage> {
  Map todayMealsData = {
    "date": "2020-01-10",
    "mbi": 18.5,
    "maxKcal": 1000,
    "currentKcal": 600,
    "foodList": [
      {
        "id": 1,
        "imageUrl":
            "https://images.unsplash.com/photo-1619095956510-24c12e2c4b9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80",
        "title": "Bánh mì nướng"
      },
      {
        "id": 2,
        "imageUrl":
            "https://images.unsplash.com/photo-1607532941433-304659e8198a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1078&q=80",
        "title": "Salad"
      },
      {
        "id": 3,
        "imageUrl":
            "https://images.unsplash.com/photo-1608877907149-a206d75ba011?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80",
        "title": "Bít tết"
      },
      {
        "id": 4,
        "imageUrl":
            "https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
        "title": "Mì"
      },
    ]
  };

  Map getStatus(double percent) {
    if (percent <= 0.75) {
      return {
        "color": Colors.green,
        "comment": "Bạn đang có một chế độ ăn khỏe mạnh!",
      };
    } else if (percent <= 0.85) {
      return {
        "color": Colors.yellow[700],
        "comment": "Bạn nên giảm lượng Kcal lại",
      };
    } else {
      return {
        "color": Colors.red,
        "comment": "Bạn sắp đạt mức tối đa của ngày!",
      };
    }
  }

  final formula = Formula();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final todayFoodProvider = Provider.of<ToDayFoodProvider>(context);
    double percent = userProvider.getUsers.isNotEmpty && todayFoodProvider.getItems.isNotEmpty ? Formula.calculateTotalKcal(todayFoodProvider.getKcals)  / Formula.calculateKcalMax(userProvider.getUsers[0].userGender, userProvider.getUsers[0].userWeight, userProvider.getUsers[0].userHeight, userProvider.getUsers[0].userAge, userProvider.getUsers[0].userWorkingLevel)  : 0;
    
  

    return Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 15.0,
                percent:
                    //         todayFoodProvider.getItems.isNotEmpty && userProvider.getUsers.isNotEmpty ?  double.parse(Formula.calculateTotalKcal(todayFoodProvider.getKcals) / Formula.calculateKcalMax(userProvider.getUsers[0].userGender, userProvider.getUsers[0].userWeight, userProvider.getUsers[0].userHeight, userProvider.getUsers[0].userAge, userProvider.getUsers[0].userWorkingLevel) * 100) : 0 );
                    // todayFoodProvider.getItems.isNotEmpty && userProvider.getUsers.isNotEmpty ?  double.parse(Formula.calculateTotalKcal(todayFoodProvider.getKcals) / Formula.calculateKcalMax(userProvider.getUsers[0].userGender, userProvider.getUsers[0].userWeight, userProvider.getUsers[0].userHeight, userProvider.getUsers[0].userAge, userProvider.getUsers[0].userWorkingLevel) * 100) : 0 );
                    todayFoodProvider.getItems.isNotEmpty &&
                            userProvider.getUsers.isNotEmpty
                        ? (percent > 1.0 ? 1.0 : percent)

                        : 0,
                center: Text('${(percent * 100  > 100 ? 100 : percent * 100).toStringAsFixed(1)}%', style: TextStyle(fontSize: 30)),
                progressColor: getStatus(percent)["color"],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      'Mức độ kcal bạn đã thu nạp: ${todayFoodProvider.getItems.isNotEmpty ? '${Formula.calculateTotalKcal(todayFoodProvider.getKcals).toString()}kcal' : '0 kcal \n (do bạn chưa thêm món)'} ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(getStatus(percent)["comment"],
                      style: TextStyle(
                        fontSize: 18,
                        color: getStatus(percent)["color"],
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Expanded(
              child: BottomTab(),
            )
          ],
        ));
  }
}

class BottomTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final todayFoodProvider = Provider.of<ToDayFoodProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: [
          userProvider.getUsers.isNotEmpty
              ? Text(
                  'Chỉ số BMI của tôi: ${Formula.calculateMbi(userProvider.getUsers[0].userWeight, userProvider.getUsers[0].userWeight)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )
              : const Text(
                  'Chỉ số BMI của tôi: 0(do chưa cập nhật thông tin)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
          Text(
            'Lời khuyên: Chỉ số ở mức bình thường, khỏe mạnh',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey[500]),
          ),
          const SizedBox(height: 5.0),
          const Text(
            'Hôm nay bạn đã ăn',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 5.0),
          // SlideRow(),
          todayFoodProvider.getItems.isNotEmpty
              ? Container(
                  height: 175.0,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      itemCount: todayFoodProvider.getItems.length,
                      controller: PageController(viewportFraction: 0.5),
                      itemBuilder: (_, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 155,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                todayFoodProvider
                                                    .getImageUrls[index]))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 9.0,
                                ),
                                Text(
                                  todayFoodProvider.getNames[index]
                                      .toString(),
                                  style: const TextStyle(fontSize: 15.0),
                                )
                              ],
                            ));
                      }),
                )
              : const Text(
                  'Hãy thêm món ăn 😜',
                  style: TextStyle(fontSize: 25.0),
                ),
          const SizedBox(height: 9.0),
          TextButton(
            onPressed: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: const Text(
                'Hoàn thành 1 ngày của tôi',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
