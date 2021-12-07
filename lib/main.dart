import 'package:food_app/pages/food_list_page.dart';
import 'package:food_app/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/services/database.dart';
import '../provider_service/today_food_provider.dart';
import 'package:provider/provider.dart';
import './models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ToDayFoodProvider()),
        StreamProvider.value(value: DatabaseService().userData, initialData: User(userId: "0ZAa0wCsFtZdlosqlkwSfLcAO1w2",userName: "Đức",userAge: 19,userGender: "male",userWeight: 65,userHeight: 175,userWorkingLevel: 1.29))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/" : (context) => MainPage(),
          "/food-list": (context) => FoodListPage(),
        },
      ),
    );
  }
}
