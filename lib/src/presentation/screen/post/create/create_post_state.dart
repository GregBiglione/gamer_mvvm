import 'package:gamer_mvvm/src/presentation/utils/validation_item.dart';

class CreatePostState {
  String image;
  ValidationItem name;
  ValidationItem description;
  String category;
  String userId;
  String error;

  CreatePostState({
    this.image = "",
    this.name = const ValidationItem(),
    this.description = const ValidationItem(),
    this.category = "",
    this.userId = "",
    this.error = "",
  });

  CreatePostState copyWith({String? image, ValidationItem? name,
    ValidationItem? description, String? category, String? userId,
    String? error}) =>  CreatePostState(
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      userId: userId ?? this.userId,
      error: error ?? this.error,
  );
}