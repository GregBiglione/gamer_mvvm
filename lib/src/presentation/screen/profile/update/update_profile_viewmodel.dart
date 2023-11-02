import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../domain/use_case/user/user_usecase.dart';
import '../../../../domain/utils/resource.dart';
import '../../../utils/validation_item.dart';

class UpdateProfileViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  UpdateProfileState _updateProfileState = UpdateProfileState();
  late Resource _response = Init();
  // Use case ------------------------------------------------------------------
  final UserUseCase _userUseCase;
  File? _imageFile;

  UpdateProfileViewModel(this._userUseCase);

  // Getters -------------------------------------------------------------------
  UpdateProfileState get updateProfileState => _updateProfileState;
  Resource get response => _response;
  File? get imageFile => _imageFile;

  // Setters -------------------------------------------------------------------
  loadData(UserData userData) {
    print("UserData VM: ${userData.toJson()}");
    _updateProfileState = _updateProfileState.copyWith(
      id: ValidationItem(value: userData.id),
      image: ValidationItem(value: userData.image),
      username: ValidationItem(value: userData.username),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  void changeUsername(String value) {
    if(value.length >= 3) {
      _updateProfileState = _updateProfileState.copyWith(username: ValidationItem(
        value: value,
        error: "",
      ));
    } else {
      _updateProfileState = _updateProfileState.copyWith(username: const ValidationItem(
          error: "Al menos 3 caracteres"));
    }
    notifyListeners();
  }

  //----------------------------------------------------------------------------
  // Update
  //----------------------------------------------------------------------------

  updateWithoutImage() async {
    // Loading -----------------------------------------------------------------
    _response = Loading();
    notifyListeners();
    // Update ------------------------------------------------------------------
    _response = await _userUseCase.updateUserUseCaseWithoutImage
        .launch(_updateProfileState.toUser());
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Reset
  // ---------------------------------------------------------------------------

  resetResponse() {
    _response = Init();
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