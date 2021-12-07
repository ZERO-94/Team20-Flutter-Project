import 'package:flutter/material.dart';
import 'package:food_app/pages/homepage.dart';
import 'package:food_app/pages/profile_page.dart';
import './my_kitchen_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: const Text('Căn bếp của tôi'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.house, color: Colors.white,),
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.white,),
              ),
              Tab(
                icon: Icon(Icons.restaurant, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            ProfilePage(),
            MyKitchenPage(),
          ],
        ),
      ),
    );
  }
}
