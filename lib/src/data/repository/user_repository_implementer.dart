import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/domain/repository/user_repository.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';

class UserRepositoryImplementer implements UserRepository {
  final CollectionReference _userReference;

  UserRepositoryImplementer(this._userReference);

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
  Future<Resource<bool>> updateWithoutImage(UserData userData) async {
    try {
      Map<String, dynamic> map = {
        "image": userData.image,
        "username": userData.username,
      };
      final data = await _userReference.doc(userData.id).update(map);

      return Success(true);
    } on FirebaseException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }
}