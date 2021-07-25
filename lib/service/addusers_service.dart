import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:getxappdemo/model/user.dart';
import 'package:http/http.dart' as http;

Future<User> AddUser(
    String name, String comments, String postdetails) async {
  final url = "https://60fb626591156a0017b4c7f0.mockapi.io/api/UserTable";
  final http.Client client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'comments': comments,
      'postdetails': postdetails,
    }),
  );
  if(response.statusCode==200){
    return User.fromJson(jsonDecode(response.body));
  }
}