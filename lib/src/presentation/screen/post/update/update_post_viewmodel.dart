import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/update_post_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/use_case/post/post_usecase.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';

class UpdatePostViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  UpdatePostState _state = UpdatePostState();
  Resource _response = Init(); // remove late
  File? _imageFile;
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final PostUseCase _postUseCase;

  UpdatePostViewModel(this._authUseCase, this._postUseCase) {
    _state = _state.copyWith(
      userId: _authUseCase.userSessionUseCase.userSession?.uid ?? "",
    );
  }

  // Getters -------------------------------------------------------------------
  UpdatePostState get state => _state;
  File? get imageFile => _imageFile;
  Resource get response => _response;


  // Setters -------------------------------------------------------------------
  Future<void> loadData(Post post) async {
    print("UserData VM: ${post.toJson()}");
    if(_state.id.isEmpty) {
      _state = _state.copyWith(
        id: post.id,
        image: post.image,
        name: ValidationItem(value: post.name),
        description: ValidationItem(value: post.description),
        category: post.category,
        userId: post.userId,
      );
    }
  }

  void changeName(String value) {
    if(value.length >= 3) {
      _state = _state.copyWith(name: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _state = _state.copyWith(name: const ValidationItem(
          error: "Al menos 3 caracteres"));
    }
    notifyListeners();
  }

  void changeDescription(String value) {
    if(value.length >= 6) {
      _state = _state.copyWith(description: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _state = _state.copyWith(description: const ValidationItem(
          error: "Al menos 6 caracteres"));
    }
    notifyListeners();
  }

  void changeCategory(String value) {
    _state = _state.copyWith(category: value);
    print("Radio: ${_state.category}");
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
      //_state = _state.copyWith(image: _imageFile);
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
      //_state = _state.copyWith(image: _imageFile);
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Update post
  // ---------------------------------------------------------------------------

  updatePost() async {
    print("State: ${_state.toPost().toJson()}");
    if(_state.isValid()) {
      _response = Loading();
      notifyListeners();
      if (_imageFile == null) {
        _response = await _postUseCase.updatePostUseCase.launch(
          _state.toPost(),
        );
        //print("Update without photo: ${_state.toPost().toJson()}");
      }
      else {
        _response = await _postUseCase.updatePostWithImageUseCase.launch(
          _state.toPost(),
          _imageFile!,
        );
        //print("Update with photo: ${_state.toPost().toJson()}\nImage: $_imageFile");
      }
      notifyListeners();
      //print("Post added succesfully");
    }
    else {
      _state = _state.copyWith(error: "Debes completar todos los campos");
      print("Formulario no valido");
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Reset response
  // ---------------------------------------------------------------------------

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Reset state
  // ---------------------------------------------------------------------------

  /*resetState() {
    _state = UpdatePostState();
    notifyListeners();
  }*/
}