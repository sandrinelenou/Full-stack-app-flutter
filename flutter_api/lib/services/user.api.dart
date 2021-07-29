import 'dart:convert';
//import 'dart:html';
import 'package:flutter_api/models/users.dart';
import 'package:http/http.dart' as http;

class ApiService {
  /*String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000/api/user';
    else // for iOS simulator
      return 'http://localhost:3000/api/user';
  }*/

  //var apiUrl = _localhost(); // 127.0.0.1
  var apiUrl = "http://10.0.2.2:3000/api/user";
//get all users
  Future<List<Users>> getUsers() async {
    final response = await http.get(Uri.parse(
        apiUrl + '/list')); //final response = await get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var decodeBody = json.decode(response.body);
      // //var jsonString = response.body;   //var jsonMap = jsonDecode(jsonString); var result = json.decode(response.body)["results"];
      List<dynamic> result = decodeBody["data"];

      return result
          .map((user) => Users.fromJson(user))
          .toList(); // return userFromJson(response.body);  return Movie.fromJson(result);   // return listResponse = json.decode(res.body);   //body["results"]

    } else {
      throw Exception('Failed to load users ');
    }
  }

//get single user
  Future<Users> getUserById(String id) async {
    final response = await http.get(Uri.parse('$apiUrl/$id'));
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user ');
    }
  }

//create user
  Future<Users> createUser(String name, String email, String password) async {
    Map data = {'name': name, 'email': email, 'password': password};

    final response = await http.post(
      Uri.parse(apiUrl + '/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data), //body: userToJson(users),
    );
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw "Failed to post user";
    }
  }

//update user // Uri.parse(apiUrl + '/update/' + id)
  Future<Users> updateUser(
      String id, String name, String email, String password) async {
    Map data = {'name': name, 'email': email, 'password': password};

    final response = await http.put(
      Uri.parse('$apiUrl/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: userToJson(users),
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw "Failed to update user";
    }
  }

//delete user
  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/delete/$id'));
    if (response.statusCode == 200) {
      print("User deleted");
    } else {
      print("Failed to delete a user");
    }
  }
}
