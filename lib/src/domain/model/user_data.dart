import 'dart:convert';

class UserData {
  String id;
  String image;
  String username;
  String email;
  String password;

  UserData({
    this.id = "",
    this.image = "",
    this.username = "",
    this.email = "",
    this.password = "",
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    username: json["username"] ?? "",
    email: json["email"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "username": username,
    "email": email,
  };
}

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());