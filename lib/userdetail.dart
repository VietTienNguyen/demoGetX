import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxappdemo/dialog.dart';
import 'package:getxappdemo/service/delete_service.dart';
import 'package:getxappdemo/service/service_user.dart';
import 'package:getxappdemo/model/user.dart';
import 'package:get/get.dart';
import 'adduser_screen.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<List<User>>(
        future: getAllUsers(),
        builder: (context, indext) {
          if (indext.hasError) print('${indext.error}');
          return indext.hasData
              ? ListDetails(
                  user: indext.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(AddUserScreen());
        },
      ),
    );
  }
}

class ListDetails extends StatelessWidget {
  List<User> user;

  ListDetails({this.user});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, int) {
          return InkWell(
            onTap: () {
              Get.defaultDialog(
                  title: "test",
                  middleText: "Bạn có muốn xóa không",
                  onConfirm: () {
                    getAllUsers().obs.value =
                        deleteUser(user[int].id.toString());
                    Get.back();
                  },
                  onCancel: () => Get.back());
            },
            onLongPress: () {
              Get.to(DialogCustom(
                id: user[int].id,
                name: user[int].name,
                comments: user[int].comments,
              ));
            },
            child: Card(
              color: Colors.greenAccent,
              child: ListTile(
                title: Text('${user[int].name}'),
                subtitle: Text('${user[int].postdetails}'),
                trailing: Text('${user[int].comments}'),
              ),
            ),
          );
        });
  }
}
