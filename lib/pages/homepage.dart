import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100,
            child:Padding(
                padding: EdgeInsets.only(
                    left: 30.0, right: 15.0, top: 5.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          'Hãy để chúng tôi hỗ trợ cho bữa \n                     ăn của bạn',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(children: <Widget> [
                    Image.asset('images/breakfast.png', height: 100, width: 110),
                    const Text(' Bữa sáng\nTừ 6h-10h')
                  ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(children: <Widget> [
                    Image.asset('images/lunch.png', height: 100, width: 110),
                    const Text('   Bữa trưa\nTừ 11h-13h')
                  ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(children: <Widget> [
                    Image.asset('images/fun.png', height: 100, width: 110,),
                    const Text('    Bữa phụ\n Từ 14h-17h')
                  ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(children: <Widget> [
                    Image.asset('images/dinner.png', height: 100, width: 110),
                    const Text('    Bữa tối \nTừ 18h-21h')
                  ],
                  )
              ),
            ],
          )
          ]
            ),
          );
  }

}

