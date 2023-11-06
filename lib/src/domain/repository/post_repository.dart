import 'dart:io';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import '../utils/resource.dart';

abstract class PostRepository {
  Future<Resource<String>> create(Post post, File image);
  Stream<Resource<List<Post>>> getAllPost();
}