import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxappdemo/service/service_user.dart';
import 'package:getxappdemo/model/user.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getAllUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: FutureBuilder<List<User>>(
          future: getAllUsers(),
          builder: (context, indext) {
            if (indext.hasError) print(indext.error);
            return indext.hasData
                ? ListUsers(
                    users: indext.data,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),

    );
  }
}

class ListUsers extends StatelessWidget {
  final List<User> users;

  ListUsers({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var test = getAllUsers().obs;
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, int) {
          return InkWell(
              child: Card(
            color: Colors.blue,
            child: ListTile(
              title: Text('${users[int].name}'),
            ),
          ));
        });
  }
}
