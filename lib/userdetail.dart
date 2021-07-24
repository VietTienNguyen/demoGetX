import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxappdemo/service/service_user.dart';
import 'package:getxappdemo/user.dart';

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
        ));
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
          return Card(
            color: Colors.blue,
            child: ListTile(
              title: Text('${user[int].name}'),
              subtitle: Text('${user[int].postdetails}'),
              trailing: Text('${user[int].comments}'),
            ),
          );
        });
  }
}
