import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_state.dart';
import '../../../../domain/use_case/user/user_usecase.dart';
import '../../../utils/validation_item.dart';

class UpdateProfileViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  UpdateProfileState _updateProfileState = UpdateProfileState();
  // Use case ------------------------------------------------------------------
  final UserUseCase _userUseCase;

  UpdateProfileViewModel(this._userUseCase);

  // Getters -------------------------------------------------------------------
  UpdateProfileState get updateProfileState => _updateProfileState;

  // Setters -------------------------------------------------------------------
  loadData(UserData userData) {
    print("UserData VM: ${userData.toJson()}");
    _updateProfileState = _updateProfileState.copyWith(
      id: ValidationItem(value: userData.id),
      image: ValidationItem(value: userData.image),
      username: ValidationItem(value: userData.username),
    );
    //notifyListeners();
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
}