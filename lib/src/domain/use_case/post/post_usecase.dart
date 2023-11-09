import 'package:gamer_mvvm/src/domain/use_case/post/create_post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/unlike_post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/update_post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/update_post_with_image_usecase.dart';
import 'delete_post_usecase.dart';
import 'get_all_post_by_id_usecase.dart';
import 'get_all_post_usecase.dart';
import 'like_post_usecase.dart';

class PostUseCase {
  final CreatePostUseCase createPostUseCase;
  final GetAllPostUseCase getAllPostUseCase;
  final GetAllPostByIdUseCase getAllPostByIdUseCase;
  final DeletePostUseCase deletePostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final UpdatePostWithImageUseCase updatePostWithImageUseCase;
  final LikePostUseCase likePostUseCase;
  final UnlikePostUseCase unlikePostUseCase;

  PostUseCase({required this.createPostUseCase, required this.getAllPostUseCase,
    required this.getAllPostByIdUseCase, required this.deletePostUseCase,
    required this.updatePostUseCase, required this.updatePostWithImageUseCase,
    required this.likePostUseCase, required this.unlikePostUseCase});
}