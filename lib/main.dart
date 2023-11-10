import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/post/post_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart';
import 'package:gamer_mvvm/src/injection.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/create_post_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/create/create_post_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/detail/post_detail_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/detail/post_detail_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/list/post_list_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/my_list/my_post_list_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/update_post_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/update/update_post_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/info/profile_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp(locator<AuthUseCase>()));
}

class MyApp extends StatelessWidget {
  final AuthUseCase _authUseCase;

  const MyApp(this._authUseCase, {super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final sessionId = _authUseCase.userSessionUseCase.userSession?.uid ?? "";
    print(sessionId);
    return MultiProvider(
      key: Key(sessionId),
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel(locator<AuthUseCase>())),
        ChangeNotifierProvider(create: (context) => RegisterViewModel(locator<AuthUseCase>())),
        ChangeNotifierProvider(create: (context) => HomeViewModel(locator<AuthUseCase>(), 0)),
        ChangeNotifierProvider(create: (context) => ProfileViewModel(
          locator<UserUseCase>(),
          locator<AuthUseCase>(),),
        ),
        ChangeNotifierProvider(create: (context) => UpdateProfileViewModel(locator<UserUseCase>())),
        ChangeNotifierProvider(create: (context) => CreatePostViewModel(
            locator<AuthUseCase>(),
            locator<PostUseCase>(),),
        ),
        ChangeNotifierProvider(create: (context) => PostListViewModel(
          locator<PostUseCase>(),
          locator<AuthUseCase>(),
          locator<UserUseCase>(),),
        ),
        ChangeNotifierProvider(create: (context) => PostDetailViewModel(
          locator<PostUseCase>(),
          locator<UserUseCase>(),),
        ),
        ChangeNotifierProvider(create: (context) => MyPostListViewModel(
          locator<PostUseCase>(),
          locator<AuthUseCase>(),),
        ),
        ChangeNotifierProvider(create: (context) => UpdatePostViewModel(
          locator<AuthUseCase>(),
          locator<PostUseCase>(),),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: sessionId.isEmpty ? "login" : "home",
        routes: {
          "login": (BuildContext context) => const LoginScreen(),
          "register": (BuildContext context) => const RegisterScreen(),
          "home": (BuildContext context) => const HomeScreen(),
          "profile/update": (BuildContext context) => const UpdateProfileScreen(),
          "post/create": (BuildContext context) => const CreatePostScreen(),
          "post/detail": (BuildContext context) => const PostDetailScreen(),
          "post/update": (BuildContext context) => const UpdatePostScreen(),
        },
      ),
    );
  }
}
