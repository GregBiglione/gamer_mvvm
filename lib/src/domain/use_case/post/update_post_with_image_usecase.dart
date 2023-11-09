import 'dart:io';
import '../../model/post.dart';
import '../../repository/post_repository.dart';

class UpdatePostWithImageUseCase {
  final PostRepository _postRepository;

  UpdatePostWithImageUseCase(this._postRepository);

  launch(Post post, File file) => _postRepository.updateWithImage(post, file);
}