import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/widget/login_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: LoginContent(),
    );
  }
}
