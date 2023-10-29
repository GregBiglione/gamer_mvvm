import 'package:gamer_mvvm/src/data/repository/auth_repository_implementer.dart';
import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  AuthRepository get authRepository => AuthRepositoryImplementer(firebaseAuth);
}