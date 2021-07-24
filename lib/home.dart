import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxappdemo/myhomepage.dart';
import 'package:get/get.dart';
import 'package:getxappdemo/userdetail.dart';
class Home extends StatelessWidget {

  var selected=0.obs;
  List<Widget> data =<Widget>[
    MyHomePage(),
    UserDetails()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Obx((){
          return data[selected.toInt()];
        }),
        bottomNavigationBar: BottomNavigationBar(
          items:const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'User',
                icon: Icon(Icons.supervised_user_circle_outlined)),
            BottomNavigationBarItem(
                label: 'Details',
                icon: Icon(Icons.web_asset))
          ],
          currentIndex: selected.toInt(),
          onTap: (value){
            selected.value = value;
          },
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.blue,
        ));
  }
}
