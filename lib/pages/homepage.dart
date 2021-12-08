import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/widgets/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[800],
      body:Column(
        children: <Widget>[
          Container(
            height: 100,
            child:Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 15.0, top: 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Hãy để chúng tôi hỗ trợ cho',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)
                          ),
                          Text(
                              'bữa ăn của bạn',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          const Flexible(child: Category())
        ]
      ),
    );
  }

}

