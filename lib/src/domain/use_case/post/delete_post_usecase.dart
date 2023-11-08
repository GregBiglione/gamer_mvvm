import '../../repository/post_repository.dart';

class DeletePostUseCase {
  final PostRepository _postRepository;

  DeletePostUseCase(this._postRepository);

  launch(String postId) => _postRepository.delete(postId);
}