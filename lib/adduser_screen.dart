import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxappdemo/service/addusers_service.dart';
import 'package:getxappdemo/model/user.dart';
import 'package:get/get.dart';

class AddUserScreen extends StatelessWidget {
  final TextEditingController _controllername = TextEditingController();
  final TextEditingController _controllercomment = TextEditingController();
  final TextEditingController _controllerpost = TextEditingController();
  Future<User> _futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controllername,
            decoration: InputDecoration(
              hintText: 'Nhập tên của bạn',
            ),
          ),
          TextField(
            controller: _controllercomment,
            decoration: InputDecoration(
              hintText: 'Nhập commment của bạn',
            ),
          ),
          TextField(
            controller: _controllerpost,
            decoration: InputDecoration(
              hintText: 'Nhập postdetails của bạn',
            ),
          ),
          MaterialButton(
              child: Text("Add User"),
              minWidth: 100.0,
              color: Colors.blue,
              onPressed: () {
                _futureUser.obs.value = AddUser(_controllername.text,
                    _controllercomment.text, _controllerpost.text);
                Get.back();
              })
        ],
      ),
    );
  }
}
