import '../../model/post.dart';
import '../../repository/post_repository.dart';
import '../../utils/resource.dart';

class GetAllPostUseCase {
  final PostRepository _postRepository;

  GetAllPostUseCase(this._postRepository);

  Stream<Resource<List<Post>>> launch() => _postRepository.getAllPost();
}