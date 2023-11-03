import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamer_mvvm/src/domain/model/post.dart';
import 'package:gamer_mvvm/src/domain/repository/post_repository.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:path/path.dart';

class PostRepositoryImplementer implements PostRepository {
  final CollectionReference _postsCollection;
  final Reference _postsStorageReference;

  PostRepositoryImplementer(this._postsCollection, this._postsStorageReference);

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
     
      await _postsCollection.add(post.toJson());

      return Success("El post se ha creado correctamente");
    } on FirebaseException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }
}