import '../../../../domain/model/post.dart';
import '../../../utils/validation_item.dart';

class UpdatePostState {
  String id;
  String image;
  ValidationItem name;
  ValidationItem description;
  String category;
  String userId;
  String error;

  UpdatePostState({
    this.id = "",
    this.image = "",
    this.name = const ValidationItem(),
    this.description = const ValidationItem(),
    this.category = "CATEGORY",
    this.userId = "",
    this.error = "",
  });

  UpdatePostState copyWith({ String? id, String? image, ValidationItem? name,
    ValidationItem? description, String? category, String? userId,
    String? error}) =>  UpdatePostState(
    id: id ?? this.id,
    image: image ?? this.image,
    name: name ?? this.name,
    description: description ?? this.description,
    category: category ?? this.category,
    userId: userId ?? this.userId,
    error: error ?? this.error,
  );

  Post toPost() => Post(
    id: id,
    image: image,
    name: name.value,
    description: description.value,
    category: category,
    userId: userId,
  );

  bool isValid() {
    if(image.isEmpty ||name.value.isEmpty || name.error.isNotEmpty
        || description.value.isEmpty || description.error.isNotEmpty
        || category.isEmpty || userId.isEmpty) {
      return false;
    }
    return true;
  }
}