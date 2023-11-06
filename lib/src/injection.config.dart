// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:gamer_mvvm/src/di/app_module.dart' as _i13;
import 'package:gamer_mvvm/src/di/firebase_service.dart' as _i7;
import 'package:gamer_mvvm/src/domain/repository/auth_repository.dart' as _i3;
import 'package:gamer_mvvm/src/domain/repository/post_repository.dart' as _i9;
import 'package:gamer_mvvm/src/domain/repository/user_repository.dart' as _i11;
import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart' as _i4;
import 'package:gamer_mvvm/src/domain/use_case/post/post_usecase.dart' as _i10;
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i4.AuthUseCase>(() => appModule.loginUseCase);
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.usersCollection,
      instanceName: 'Users',
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.postsCollection,
      instanceName: 'Posts',
    );
    gh.factory<_i6.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i7.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i8.FirebaseStorage>(() => appModule.firebaseStorage);
    gh.factory<_i9.PostRepository>(() => appModule.postRepository);
    gh.factory<_i10.PostUseCase>(() => appModule.postUseCase);
    gh.factory<_i8.Reference>(
      () => appModule.userStorageReference,
      instanceName: 'Users',
    );
    gh.factory<_i8.Reference>(
      () => appModule.postsStorageReference,
      instanceName: 'Posts',
    );
    gh.factory<_i11.UserRepository>(() => appModule.userRepository);
    gh.factory<_i12.UserUseCase>(() => appModule.userUseCase);
    return this;
  }
}

class _$AppModule extends _i13.AppModule {}
