import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamer_mvvm/src/domain/use_case/auth/auth_usecase.dart';
import 'package:gamer_mvvm/src/injection.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_screen.dart';
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
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
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
        },
      ),
    );
  }
}
