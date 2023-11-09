import 'dart:convert';

class Post {
  String id;
  String image;
  String name;
  String description;
  String category;
  String userId;
  List<String> likes;

  Post({
    this.id = "",
    this.image = "",
    this.name = "",
    this.description = "",
    this.category = "",
    this.userId = "",
    this.likes = const [],
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"] ?? "",
    image: json["image"] ?? "",
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    category: json["category"] ?? "",
    userId: json["userId"] ?? "",
    likes: json["likes"] ?? [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "description": description,
    "category": category,
    "userId": userId,
    "likes": likes,
  };
}

Post fromJson(String str) => Post.fromJson(json.decode(str));

String toJson(Post data) => json.encode(data.toJson());
