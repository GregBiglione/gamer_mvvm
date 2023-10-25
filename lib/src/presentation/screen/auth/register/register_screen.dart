import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/widget/register_content.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterContent(),
    );
  }
}
