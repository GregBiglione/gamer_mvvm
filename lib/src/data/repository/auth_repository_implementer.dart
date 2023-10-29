import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImplementer implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementer(this._firebaseAuth);

  @override
  Future<Resource> login({required String email, required String password}) async {
    try {
      final data = _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(data);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? "Error desconocido");
    }
  }
}