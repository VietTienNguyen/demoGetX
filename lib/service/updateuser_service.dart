import 'dart:convert';

import 'package:getxappdemo/model/user.dart';
import 'package:http/http.dart' as http;

Future<User> updateUser(Object id, String comments, String postdetails) async {
  final url = "https://60fb626591156a0017b4c7f0.mockapi.io/api/UserTable/$id";
  final http.Client client = http.Client();
  final reponse = await client.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'comments': comments,
      'postdetails':postdetails,
    }),
  );
  if(reponse.statusCode==200){
    return User.fromJson(jsonDecode(reponse.body));
  }
}
