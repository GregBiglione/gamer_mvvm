import 'package:gamer_mvvm/src/presentation/utils/validation_item.dart';

import '../../../../domain/model/user_data.dart';

class UpdateProfileState {
  ValidationItem id;
  ValidationItem image;
  ValidationItem username;

  UpdateProfileState({
    this.id = const ValidationItem(),
    this.image = const ValidationItem(),
    this.username = const ValidationItem(),
  });

  UpdateProfileState copyWith({ValidationItem? id, ValidationItem? image,
    ValidationItem? username}) => UpdateProfileState(
    id: id = id ?? this.id,
    image: image = image ?? this.image,
    username: username = username ?? this.username,
  );

  toUser() => UserData(
    id: id.value,
    image: image.value,
    username: username.value,
  );

  bool isValid() {
    if(id.value.isEmpty || id.error.isNotEmpty
        || username.value.isEmpty || username.error.isNotEmpty) {
      return false;
    }
    return true;
  }
}