import '../../repository/post_repository.dart';

class UnlikePostUseCase {
  final PostRepository _repository;

  UnlikePostUseCase(this._repository);

  launch(String postId, String userId) => _repository.unlike(postId, userId);
}