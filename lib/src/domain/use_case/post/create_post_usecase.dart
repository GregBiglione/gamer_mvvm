import 'dart:io';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/domain/repository/post_repository.dart';

class CreatePostUseCase {
  final PostRepository _postRepository;

  CreatePostUseCase(this._postRepository);

  launch(Post post, File image) => _postRepository.create(post, image);
}