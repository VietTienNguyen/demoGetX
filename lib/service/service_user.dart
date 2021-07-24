import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:getxappdemo/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getAllUsers() async{
  final url="https://60fb626591156a0017b4c7f0.mockapi.io/api/UserTable";
  final http.Client client = http.Client();

    final response =await client.get(Uri.parse(url));
    if(response.statusCode==200){
      return compute(listuser,response.body);
  }
}

List<User> listuser(String user){
  final parser = jsonDecode(user).cast<Map<String,dynamic>>();
  return parser.map<User>((json)=> User.fromJson(json)).toList();
}