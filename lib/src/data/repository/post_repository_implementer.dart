import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/domain/repository/post_repository.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

import '../../core/constant.dart';

class PostRepositoryImplementer implements PostRepository {
  final CollectionReference _postsCollection;
  final Reference _postsStorageReference;

  PostRepositoryImplementer(
    @Named(POST) this._postsCollection,
    @Named(POST) this._postsStorageReference,
  );

  @override
  Future<Resource<String>> create(Post post, File image) async {
    try {
      String name = basename(image.path);
      TaskSnapshot taskSnapshot = await _postsStorageReference.child(name).putFile(
        image,
        SettableMetadata(
            contentType: "image/png"
        ),
      );
      String url = await taskSnapshot.ref.getDownloadURL();
      post.image = url;
      await _postsCollection.add(post.toJson());

      return Success("El post se ha creado correctamente");
    } on FirebaseException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Stream<Resource<List<Post>>> getAllPost() {
    try {
      final data = _postsCollection.snapshots(includeMetadataChanges: true);
      final mapData = data.map(
            (document) => Success(
          (document.docs.map(
                  (post) {
                final id = post.id;
                final map = {
                  ...post.data() as Map<String, dynamic>,
                  "id": id,
                };
                return Post.fromJson(map);
              }
          ).toList()
          ),
        ),
      );

      return mapData;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Stream<Resource<List<Post>>> getAllPostById(String id) {
    try {
      final data = _postsCollection
          .where("userId", isEqualTo: id)
          .snapshots(includeMetadataChanges: true);
      final mapData = data.map(
            (document) => Success(
          (document.docs.map(
                (post) {
                  final id = post.id;
                  final map = {
                    ...post.data() as Map<String, dynamic>,
                    "id": id,
                  };
                  return Post.fromJson(map);
                }
                  ).toList()
          ),
        ),
      );

      return mapData;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource<String>> delete(String postId) async {
    try {
      _postsCollection.doc(postId).delete();

      return Success("El post se ha eliminado correctamente");
    } on FirebaseException catch (e) {
      throw Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource<String>> update(Post post) async {
    try {
      Map<String, dynamic> map = {
        "name": post.name,
        "description": post.description,
        "category": post.category,
      };
      await _postsCollection.doc(post.id).update(map);

      return Success("El post se ha actualizado correctamente");
    } on FirebaseException catch (e) {
      throw Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource<String>> updateWithImage(Post post, File image) async {
    try {
      String name = basename(image.path);
      TaskSnapshot taskSnapshot = await _postsStorageReference.child(name).putFile(
        image,
        SettableMetadata(
            contentType: "image/png"
        ),
      );
      String url = await taskSnapshot.ref.getDownloadURL();
      Map<String, dynamic> map = {
        "image": url,
        "name": post.name,
        "description": post.description,
        "category": post.category,
      };
      await _postsCollection.doc(post.id).update(map);

      return Success("El post se ha actualizado correctamente");
    } on FirebaseException catch (e) {
      throw Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource<bool>> like(String postId, String userId) async {
    try {
      await _postsCollection
          .doc(postId)
          .update(
        {
          "likes": FieldValue.arrayUnion([userId]),
        }
      );

      return Success(true);
    } on FirebaseException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource<bool>> unlike(String postId, String userId) async {
    try {
      await _postsCollection
          .doc(postId)
          .update(
          {
            "likes": FieldValue.arrayRemove([userId]),
          }
      );

      return Success(true);
    } on FirebaseException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }
}