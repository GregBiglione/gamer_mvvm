import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/post_usecase.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/utils/resource.dart';

class MyPostListViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final PostUseCase _postUseCase;
  final AuthUseCase _authUseCase;

  MyPostListViewModel(this._postUseCase, this._authUseCase);

  // Setters -------------------------------------------------------------------
  Stream<Resource<List<Post>>> getAllPostById() {
    String userId = _authUseCase.userSessionUseCase.userSession?.uid ?? "";

    return _postUseCase.getAllPostByIdUseCase.launch(userId);
  }

  deletePost(String postId) async {
    await _postUseCase.deletePostUseCase.launch(postId);
    notifyListeners();
  }
}