import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/domain/repository/user_repository.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

import '../../core/constant.dart';

class UserRepositoryImplementer implements UserRepository {
  final CollectionReference _userReference;
  final Reference _userStorageReference;

  UserRepositoryImplementer(
    @Named(USER) this._userReference,
    @Named(USER) this._userStorageReference,
  );

  @override
  Stream<Resource<UserData>> getUserById(String id) {
    try {
      final data = _userReference.doc(id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map(
              (document) => Success(
                  UserData.fromJson(document.data() as Map<String, dynamic>),
              ),
      );

      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource<String>> updateWithoutImage(UserData userData) async {
    try {
      Map<String, dynamic> map = {
        "image": userData.image,
        "username": userData.username,
      };
      final data = await _userReference.doc(userData.id).update(map);

      return Success("El usario se ha actualizado correctamente");
    } on FirebaseException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource<String>> updateWithImage(UserData userData, File image) async {
    try {
      String name = basename(image.path);
      TaskSnapshot taskSnapshot = await _userStorageReference.child(name).putFile(
        image,
        SettableMetadata(
          contentType: "image/png"
        ),
      );
      String url = await taskSnapshot.ref.getDownloadURL();
      Map<String, dynamic> map = {
        "image": url,
        "username": userData.username,
      };
      await _userReference.doc(userData.id).update(map);

      return Success("El usario se ha actualizado correctamente");
    } on FirebaseException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<UserData> getUserByIdOnce(String id) async {
    try {
      final document = await _userReference.doc(id).get();

      if(document.exists) {
        UserData userData = UserData.fromJson(document.data() as Map<String, dynamic>);

        return userData;
      }

      return UserData();
    } on FirebaseException catch (e) {
      throw Error(e.message ?? "Error desconocido");
    }
  }
}