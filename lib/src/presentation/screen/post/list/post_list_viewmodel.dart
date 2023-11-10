import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/post_usecase.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/utils/resource.dart';

class PostListViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final PostUseCase _postUseCase;
  final AuthUseCase _authUseCase;
  String _id = "";

  PostListViewModel(this._postUseCase, this._authUseCase) {
    _id = _authUseCase.userSessionUseCase.userSession?.uid ?? "";
  }

  // Getters -------------------------------------------------------------------
  String get id => _id;

  // Setters -------------------------------------------------------------------
  Stream<Resource<List<Post>>> getAllPost() => _postUseCase.getAllPostUseCase
      .launch();

  like(String postId) async {
    await _postUseCase.likePostUseCase.launch(postId, id);
    notifyListeners();
  }

  unlike(String postId) async {
    await _postUseCase.unlikePostUseCase.launch(postId, id);
    notifyListeners();
  }
}