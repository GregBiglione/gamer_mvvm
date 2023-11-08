import 'dart:io';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import '../utils/resource.dart';

abstract class PostRepository {
  Future<Resource<String>> create(Post post, File image);
  Future<Resource<String>> delete(String postId);
  Stream<Resource<List<Post>>> getAllPost();
  Stream<Resource<List<Post>>> getAllPostById(String id);
}