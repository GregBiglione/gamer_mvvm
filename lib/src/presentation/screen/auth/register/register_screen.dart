import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/register/widget/register_content.dart';
import 'package:provider/provider.dart';
import '../../../../../main.dart';
import '../../../../domain/use_case/auth/auth_usecase.dart';
import '../../../../domain/utils/resource.dart';
import '../../../../injection.dart';
import '../../../utils/base_color.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);
    
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
          RegisterContent(registerViewModel: viewModel,),
        ],
      ),
    );
  }
}
