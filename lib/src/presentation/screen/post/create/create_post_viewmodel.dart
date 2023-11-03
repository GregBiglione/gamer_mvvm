import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/create_post_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/validation_item.dart';

class CreatePostViewModel extends ChangeNotifier{
  // State ---------------------------------------------------------------------
  CreatePostState _createPostState = CreatePostState();
  File? _imageFile;
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;

  CreatePostViewModel(this._authUseCase) {
    _createPostState = _createPostState.copyWith(
        userId: _authUseCase.userSessionUseCase.userSession?.uid ?? "",
    );
  }

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
          error: "Al menos 6 caracteres"));
    }
    notifyListeners();
  }

  void changeCategory(String value) {
    _createPostState = _createPostState.copyWith(category: value);
    print("Radio: ${_createPostState.category}");
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
      _createPostState = _createPostState.copyWith(image: _imageFile);
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
      _createPostState = _createPostState.copyWith(image: _imageFile);
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Create post
  // ---------------------------------------------------------------------------

  createPost() {
    if(_createPostState.isValid()) {
      print("Formulario valido !!!!!!!!!!!!!!!!!!!!!!!");
      //notifyListeners();
    }
    else {
      _createPostState = _createPostState.copyWith(error: "Debes completar todos los campos");
      print("Formulario no valido");
      notifyListeners();
    }
  }
}