import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamer_mvvm/src/core/constant.dart';
import 'package:gamer_mvvm/src/data/repository/auth_repository_implementer.dart';
import 'package:gamer_mvvm/src/data/repository/post_repository_implementer.dart';
import 'package:gamer_mvvm/src/data/repository/user_repository_implementer.dart';
import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:gamer_mvvm/src/domain/repository/post_repository.dart';
import 'package:gamer_mvvm/src/domain/repository/user_repository.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/login_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/logout_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/register_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/user_session_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/create_post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/get_all_post_by_id_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/get_all_post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/get_user_by_id_once_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/get_user_by_id_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/update_image_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/update_user_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart';
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
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @injectable
  AuthRepository get authRepository => AuthRepositoryImplementer(
    firebaseAuth,
    usersCollection,
  );

  @injectable
  UserRepository get userRepository => UserRepositoryImplementer(
    usersCollection,
    userStorageReference,
  );

  @injectable
  PostRepository get postRepository => PostRepositoryImplementer(
    postsCollection,
    postsStorageReference,
  );

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @Named(USER)
  @injectable
  CollectionReference get usersCollection => firebaseFirestore.collection(USER);

  @Named(USER)
  @injectable
  Reference get userStorageReference => firebaseStorage.ref().child(USER);

  @Named(POST)
  @injectable
  CollectionReference get postsCollection => firebaseFirestore.collection(POST);

  @Named(POST)
  @injectable
  Reference get postsStorageReference => firebaseStorage.ref().child(POST);

  @injectable
  AuthUseCase get loginUseCase => AuthUseCase(
    loginUseCase: LoginUseCase(authRepository), 
    registerUseCase: RegisterUseCase(authRepository),
    userSessionUseCase: UserSessionUseCase(authRepository),
    logoutUseCase: LogoutUseCase(authRepository),
  );

  @injectable
  UserUseCase get userUseCase => UserUseCase(
    getUserByIdUseCase: GetUserByIdUseCase(userRepository), 
    updateUserUseCaseWithoutImage: UpdateUserUseCase(userRepository),
    updateImageUseCase: UpdateImageUseCase(userRepository),
    getUserByIdOnceUseCase: GetUserByIdOnceUseCase(userRepository),
  );

  @injectable
  PostUseCase get postUseCase => PostUseCase(
    createPostUseCase: CreatePostUseCase(postRepository),
    getAllPostUseCase: GetAllPostUseCase(postRepository),
    getAllPostByIdUseCase: GetAllPostByIdUseCase(postRepository),
  );
}