import 'package:gamer_mvvm/src/domain/use_case/post/create_post_usecase.dart';

import 'get_all_post_usecase.dart';

class PostUseCase {
  final CreatePostUseCase createPostUseCase;
  final GetAllPostUseCase getAllPostUseCase;

  PostUseCase({required this.createPostUseCase, required this.getAllPostUseCase});
}