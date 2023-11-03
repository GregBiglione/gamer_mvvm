import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/create_post_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/validation_item.dart';

class CreatePostViewModel extends ChangeNotifier{
  // State ---------------------------------------------------------------------
  CreatePostState _createPostState = CreatePostState();
  File? _imageFile;

  // Getters -------------------------------------------------------------------
  CreatePostState get createPostState => _createPostState;
  File? get imageFile => _imageFile;

  // Setters -------------------------------------------------------------------
  void changeName(String value) {
    if(value.length >= 3) {
      _createPostState = _createPostState.copyWith(name: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _createPostState = _createPostState.copyWith(name: const ValidationItem(
          error: "Al menos 3 caracteres"));
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if(value.length >= 6) {
      _createPostState = _createPostState.copyWith(description: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _createPostState = _createPostState.copyWith(description: const ValidationItem(
          error: "Al menos 3 caracteres"));
    }
    notifyListeners();
  }

  void changeCategory(String value) {
    _createPostState = _createPostState.copyWith(category: value);
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Select picture
  // ---------------------------------------------------------------------------

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Take photo
  // ---------------------------------------------------------------------------

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if(image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }
}