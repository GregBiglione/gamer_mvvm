import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_response.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/widget/login_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      LoginResponse(viewModel, context);
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: LoginContent(loginViewModel: viewModel,),
    );
  }
}
