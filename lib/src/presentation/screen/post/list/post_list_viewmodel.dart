import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/post_usecase.dart';

import '../../../../domain/model/post.dart';
import '../../../../domain/utils/resource.dart';

class PostListViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final PostUseCase _postUseCase;

  PostListViewModel(this._postUseCase);

  // Setters -------------------------------------------------------------------
  Stream<Resource<List<Post>>> getAllPost() => _postUseCase.getAllPostUseCase
      .launch();
}