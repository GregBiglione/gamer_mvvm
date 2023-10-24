import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/presentation/screen/auth/login/login_viewmodel.dart';

import '../../../../utils/base_color.dart';
import '../../../../widget/default_button.dart';
import '../../../../widget/default_textfield.dart';

class LoginContent extends StatelessWidget {
  final LoginViewModel loginViewModel;

  const LoginContent({super.key, required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upper part with wave ------------------------------------------------
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            color: baseColor,
            height: MediaQuery.of(context).size.height * 0.32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/gamepad.png",
                  width: 150,
                  height: 100,
                ),
                const Text(
                  "Facil y Rapido",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Black part ----------------------------------------------------------
        Container(
          margin: const EdgeInsets.only(
            left: 15,
            top: 15,
          ),
          child: const Text(
            "Continua con",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(
            "Login",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        // Email ---------------------------------------------------------------
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: DefaultTextField(
            onChanged: (value) {
              loginViewModel.changeEmail(value);
            },
            label: "Correo electronico",
            error: loginViewModel.loginState.email.error,
            iconData: Icons.email_outlined,
          ),
        ),
        // Password ------------------------------------------------------------
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: DefaultTextField(
            onChanged: (value) {
              loginViewModel.changePassword(value);
            },
            label: "Contraseña",
            error: loginViewModel.loginState.password.error,
            iconData: Icons.lock_outlined,
          ),
        ),
        // Button --------------------------------------------------------------
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 40,
          ),
          child: DefaultButton(
            text: "Iniciar sesion",
            onPressed: () {
              loginViewModel.login();
            },
          ),
        ),
        // Text button ---------------------------------------------------------
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              bottom: 40,
            ),
            child: const Text(
              "¿No tienes cuenta?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}