import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_response.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/widget/register_content.dart';
import 'package:provider/provider.dart';

import '../../../utils/base_color.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RegisterResponse(viewModel, context);
    });
    
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: RegisterContent(registerViewModel: viewModel,),
    );
  }
}
