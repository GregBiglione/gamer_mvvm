import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';

class AuthRepositoryImplementer implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementer(this._firebaseAuth);

  @override
  Future<Resource> login({required String email, required String password}) async {
    try {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(data);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }

  @override
  Future<Resource> register(UserData userData) async {
    try {
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
          email: userData.email,
          password: userData.password,
      );

      return Success(data);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }
}