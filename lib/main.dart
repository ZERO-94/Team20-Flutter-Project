import 'package:food_app/pages/food_list_page.dart';
import 'package:food_app/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/sign_in_page.dart';
import 'package:food_app/provider_service/user_provider.dart';
import 'package:food_app/services/auth.dart';
import '../provider_service/today_food_provider.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<ToDayFoodProvider>(
            create: (context) => ToDayFoodProvider()),
        Provider<AuthBase>(create: (context) => Auth()),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "sign_in_page",
        routes: {
          "sign_in_page": (context) => const SignInPage(),
          "main_page": (context) =>  const MainPage(selectedPage: 0,),
        },
      ),
    );
  }
}
