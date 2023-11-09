import '../../model/post.dart';
import '../../repository/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository _postRepository;

  UpdatePostUseCase(this._postRepository);

  launch(Post post) => _postRepository.update(post);
}