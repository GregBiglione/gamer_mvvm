import 'dart:convert';

class Post {
  String id;
  String image;
  String name;
  String description;
  String category;
  String userId;

  Post({
    this.id = "",
    this.image = "",
    this.name = "",
    this.description = "",
    this.category = "",
    this.userId = "",
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    category: json["category"] ?? "",
    userId: json["userId"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "description": description,
    "category": category,
    "userId": userId,
  };
}

Post PostFromJson(String str) => Post.fromJson(json.decode(str));

String PostToJson(Post data) => json.encode(data.toJson());
