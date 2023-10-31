import 'package:flutter/material.dart';
import 'package:gamer_mvvm/src/presentation/screen/home/home_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      body: Center(
        child: DefaultButton(
          text: "Cerrar sesion",
          onPressed: () async {
            await viewModel.logout();
            Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
          }
        ),
      ),
    );
  }
}
