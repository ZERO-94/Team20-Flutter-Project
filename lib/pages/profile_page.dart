import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/user.dart';
import 'package:food_app/widgets/user_infor_form.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
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
              padding: EdgeInsets.only(top: 30),
              height: 100,
                child: Text(
                    'Thông tin cá nhân',
                        style: TextStyle(fontSize: 32, color: Colors.white)
                )
            ),
            Expanded(child: UserInforForm()),
          ],
        ),
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return Container(
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage:
                AssetImage("images/user_icon.png"),
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 5.0),
            child: Text(
              user.userName!,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
