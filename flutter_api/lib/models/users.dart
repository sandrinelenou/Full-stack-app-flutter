import 'dart:convert';

class Users {
  String id;
  String name;
  String email;
  String password;

  Users(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['_id'], //id: json['id'] ?? "",     id: json['_id'] as String,
        name: json['name'] ?? "",
        email: json['email'] ?? "",
        password: json['password'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "password": password};
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password}';
  }
}

List<Users> userFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Users>.from(str.map((item) {
    return Users.fromJson(item);
  }));
  //return User.fromJson((str));
}

String userToJson(Users data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
