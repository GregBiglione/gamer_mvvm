import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart';
import 'package:gamer_mvvm/src/domain/use_case/user/user_usecase.dart';
import 'package:gamer_mvvm/src/injection.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/post/my_list/my_post_list_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/info/profile_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/update/update_profile_viewmodel.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_screen.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel(locator<AuthUseCase>())),
        ChangeNotifierProvider(create: (context) => RegisterViewModel(locator<AuthUseCase>())),
        ChangeNotifierProvider(create: (context) => HomeViewModel(locator<AuthUseCase>(), 0)),
        ChangeNotifierProvider(create: (context) => ProfileViewModel(
          locator<UserUseCase>(),
          locator<AuthUseCase>(),),
        ),
        ChangeNotifierProvider(create: (context) => UpdateProfileViewModel(locator<UserUseCase>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "login",
        routes: {
          "login": (BuildContext context) => const LoginScreen(),
          "register": (BuildContext context) => const RegisterScreen(),
          "home": (BuildContext context) => const HomeScreen(),
          "profile/update": (BuildContext context) => const UpdateProfileScreen(),
          "profile/update": (BuildContext context) => const MyPostListScreen(),
        },
      ),
    );
  }
}
