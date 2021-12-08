import 'package:food_app/utilities/text_field_widget.dart';
import 'package:flutter/material.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}
class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                color: const Color(0xFFF6284D),
                width: width,
                height: height,
              ),
            ),
            Positioned(
              top: 55.0,
              left: width / 3.9,
              child: Row(
                children: [
                  Hero(
                    tag: '/food',
                    child: Image.asset(
                      'images/food.png',
                      width: width  /2,
                      height: height / 7
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: height / 4.5,
              bottom: 0.0,
              child: Container(
                width: width,
                height: height / 1.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      35.0,
                    ),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 55.0,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 35.0,
                                color: Color(0xFFF6284D),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      TextFieldWidget(
                        iconEmail: const Icon(Icons.mail),
                        hintTextEmail: 'Email ID',
                        iconPassword: const Icon(Icons.lock),
                        hintTextPassword: 'Password',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
