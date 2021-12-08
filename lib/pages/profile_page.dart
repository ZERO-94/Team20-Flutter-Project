import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/widgets/user_infor_form.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String id = 'profile_page';
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red[800],
      body:Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              height: 100,
                child: const Text(
                    'Thông tin cá nhân',
                        style: TextStyle(fontSize: 32, color: Colors.white)
                )
            ),
            const Expanded(child: UserInforForm()),
          ],
        ),
      ),
    );
  }
}


