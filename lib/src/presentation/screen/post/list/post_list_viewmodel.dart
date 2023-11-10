import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/utils/resource.dart';

class PostListViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final PostUseCase _postUseCase;
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;
  String _id = "";

  PostListViewModel(this._postUseCase, this._authUseCase, this._userUseCase) {
    _id = _authUseCase.userSessionUseCase.userSession?.uid ?? "";
  }

  // Getters -------------------------------------------------------------------
  String get id => _id;

  // Setters -------------------------------------------------------------------
  Stream<Resource<List<Post>>> getAllPost() => _postUseCase.getAllPostUseCase
      .launch();

  Future<UserData> getUserInfo(String userId) => _userUseCase
      .getUserByIdOnceUseCase.launch(userId);

  like(String postId) async {
    await _postUseCase.likePostUseCase.launch(postId, id);
  }

  unlike(String postId) async {
    await _postUseCase.unlikePostUseCase.launch(postId, id);
  }
}