import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamer_mvvm/src/data/repository/auth_repository_implementer.dart';
import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/login_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/register_usecase.dart';
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
  AuthRepository get authRepository => AuthRepositoryImplementer(
    firebaseAuth,
    usersCollection,
  );

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @injectable
  CollectionReference get usersCollection => firebaseFirestore.collection("Users");

  @injectable
  AuthUseCase get loginUseCase => AuthUseCase(
    loginUseCase: LoginUseCase(authRepository), 
    registerUseCase: RegisterUseCase(authRepository),
  );
}