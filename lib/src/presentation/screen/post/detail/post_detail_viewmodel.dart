import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart';

import '../../../../domain/model/user_data.dart';
import '../../../../domain/use_case/post/post_usecase.dart';

class PostDetailViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final PostUseCase _postUseCase;
  final UserUseCase _userUseCase;

  PostDetailViewModel(this._postUseCase, this._userUseCase);

  // Setters -------------------------------------------------------------------
  Future<UserData> getUser(String id) => _userUseCase.getUserByIdOnceUseCase
      .launch(id);
}