import 'dart:io';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import '../utils/resource.dart';

abstract class PostRepository {
  Future<Resource<String>> create(Post post, File image);
  Future<Resource<String>> delete(String postId);
  Future<Resource<String>> update(Post post);
  Future<Resource<String>> updateWithImage(Post post, File image);
  Stream<Resource<List<Post>>> getAllPost();
  Stream<Resource<List<Post>>> getAllPostById(String id);
  Future<Resource<bool>> like(String postId, String userId);
  Future<Resource<bool>> unlike(String postId, String userId);
}