import 'dart:convert';
import 'package:flutter_api/models/users.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_api/services/api.dart';

//class ApiService {
final String apiUrl = "http://10.0.2.2:3000";

//get all users
Future<List<Users>> getUsers() async {
  final response = await http
      .get(Uri.parse(apiUrl)); //final response = await get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    List<dynamic> result = json.decode(response
        .body); // //var jsonString = response.body;   //var jsonMap = jsonDecode(jsonString); var result = json.decode(response.body)["results"];

    return result
        .map((user) => Users.fromJson(user))
        .toList(); // return userFromJson(response.body);  return Movie.fromJson(result);   // return listResponse = json.decode(res.body);   //body["results"]

  } else {
    throw Exception('Failed to load user list');
  }
}

//get single user
Future<Users> getUserById(String id) async {
  final response = await http.get(Uri.parse('$apiUrl/$id'));
  if (response.statusCode == 200) {
    return Users.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load a User');
  }
}

//create user
Future<Users> createUser(Users users) async {
  Map data = {
    'name': users.name,
    'email': users.email,
    'password': users.password
  };

  final response = await http.post(
    Uri.parse(apiUrl),
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

//update user
Future<Users> updateUsers(String id, Users users) async {
  Map data = {
    'name': users.name,
    'email': users.email,
    'password': users.password
  };

  final response = await http.put(
    Uri.parse('$apiUrl/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    //body: userToJson(users),
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
  final response = await http.delete(Uri.parse('$apiUrl/$id'));
  if (response.statusCode == 200) {
    print("User deleted");
  } else {
    throw "Failed to delete a user";
  }
}
//}
