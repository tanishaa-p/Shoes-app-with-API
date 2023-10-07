import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:second_project/user.dart';

class UserApi{
  Future<List<User>?> fetchUsers() async {
    var client=http.Client();
    var uri=Uri.parse("https://webinar-test-git-main-vendz.vercel.app/api/products");
    final response= await client.get(uri);
    if (response.statusCode==200){
      var json=response.body;
      return userFromJson(json);
    }
  }
}