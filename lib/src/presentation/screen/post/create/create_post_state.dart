import 'dart:io';
import 'package:gamer_mvvm/src/presentation/utils/validation_item.dart';

class CreatePostState {
  File? image;
  ValidationItem name;
  ValidationItem description;
  String category;
  String userId;
  String error;

  CreatePostState({
    this.image = null,
    this.name = const ValidationItem(),
    this.description = const ValidationItem(),
    this.category = "CATEGORY",
    this.userId = "",
    this.error = "",
  });

  CreatePostState copyWith({File? image, ValidationItem? name,
    ValidationItem? description, String? category, String? userId,
    String? error}) =>  CreatePostState(
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      userId: userId ?? this.userId,
      error: error ?? this.error,
  );

  bool isValid() {
    if(image == null ||name.value.isEmpty || name.error.isNotEmpty
        || description.value.isEmpty || description.error.isNotEmpty
        || category.isEmpty || userId.isEmpty) {
      return false;
    }
    return true;
  }
}