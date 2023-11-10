import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm/src/domain/utils/resource.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/widget/login_content.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../injection.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          StreamBuilder(
            stream: viewModel.response,
            builder: (context, snapshot) {
              final response = snapshot.data;

              if(response is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if (response is Error){
                final data = response;

                Fluttertoast.showToast(
                  msg: "Error: ${data.error}",
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 3,
                );
              }
              else if (response is Success) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(locator<AuthUseCase>()),
                    ),
                        (route) => false,
                  );
                });
              }

              return Container();
            },
          ),
          LoginContent(loginViewModel: viewModel,),
        ],
      ),
    );
  }
}
