import 'package:gamer_mvvm/src/domain/repository/post_repository.dart';

import '../../model/post.dart';
import '../../utils/resource.dart';

class GetAllPostByIdUseCase {
  final PostRepository _postRepository;

  GetAllPostByIdUseCase(this._postRepository);

  Stream<Resource<List<Post>>> launch(String id) => _postRepository
      .getAllPostById(id);
}