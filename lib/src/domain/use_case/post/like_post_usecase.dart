import 'package:gamer_mvvm/src/domain/repository/post_repository.dart';

class LikePostUseCase {
  final PostRepository _repository;

  LikePostUseCase(this._repository);

  launch(String postId, String userId) => _repository.like(postId, userId);
}