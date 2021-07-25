
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxappdemo/model/user.dart';
import 'package:getxappdemo/service/updateuser_service.dart';
import 'package:get/get.dart';
class DialogCustom extends StatelessWidget {
  Object id;
  String name, comments, postdetail;

  TextEditingController controllercomment = TextEditingController();
  TextEditingController controllerpost = TextEditingController();

  DialogCustom(
      {this.id,
        this.name,
        this.comments,
        this.postdetail,
        this.controllercomment,
        this.controllerpost});

  Future<User> _future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          TextField(
            controller: controllercomment,
            decoration: InputDecoration(
                labelText: comments,
                border: OutlineInputBorder()),
          ),
          Padding(padding: EdgeInsets.only(bottom: 12)),
          TextField(
            controller: controllerpost,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          MaterialButton(
              child: Text("Update User"),
              minWidth: 100.0,
              color: Colors.blue,
              onPressed: () {
                _future.obs.value = updateUser(
                    id, controllercomment.text, controllerpost.text);
                Get.back();
              })
        ],
      ),
    );
  }
}
