import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:getxappdemo/model/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> deleteUser(String id) async {
  final url = 'https://60fb626591156a0017b4c7f0.mockapi.io/api/UserTable/$id';
  final reponse = await http.Client().delete(Uri.parse(url),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },);

  if (reponse.statusCode == 200) {
    return compute(listusers,reponse.body);
  }
}

List<User> listusers(String user){
  final paser =  jsonDecode(user).cast<Map<String,dynamic>>();
  return paser.map<User>((json)=>User.fromJson(json)).toList();
}
