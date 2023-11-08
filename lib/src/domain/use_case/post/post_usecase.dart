import 'package:gamer_mvvm/src/domain/use_case/post/create_post_usecase.dart';

import 'get_all_post_by_id_usecase.dart';
import 'get_all_post_usecase.dart';

class PostUseCase {
  final CreatePostUseCase createPostUseCase;
  final GetAllPostUseCase getAllPostUseCase;
  final GetAllPostByIdUseCase getAllPostByIdUseCase;

  PostUseCase({required this.createPostUseCase, required this.getAllPostUseCase,
    required this.getAllPostByIdUseCase});
}