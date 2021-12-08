import 'package:flutter/material.dart';
import 'package:food_app/pages/homepage.dart';
import 'package:food_app/pages/profile_page.dart';
import 'package:provider/provider.dart';
import '../provider_service/user_provider.dart';
import '../services/auth.dart';
import './my_kitchen_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, required this.selectedPage}) : super(key: key);
  final int selectedPage;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return DefaultTabController(
      initialIndex: selectedPage ,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.star),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await auth.signOut();
                userProvider.clearUsers();
                Navigator.pushNamed(context, 'sign_in_page');


              },
            ),
            const SizedBox(
              width: 15.0,
            )
          ],
          backgroundColor: Colors.red[800],
          title: const Text('Căn bếp của tôi'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.house,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(Icons.restaurant, color: Colors.white),
              ),
            ],
          ),
        ),
        body: const TabBarView(
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
