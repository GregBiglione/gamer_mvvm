import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../../utils/base_color.dart';
import '../../../../widget/default_button.dart';
import '../../../../widget/default_textfield.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper part with wave ----------------------------------------------
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              color: baseColor,
              height: MediaQuery.of(context).size.height * 0.32,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 5,
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                        ),
                    ),
                  ),
                  Row(
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
                ],
              ),
            ),
          ),
          // Black part --------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 15,
              top: 15,
            ),
            child: const Text(
              "Continua con tu",
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
              "Registo",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Username ----------------------------------------------------------
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: DefaultTextField(
              onChanged: (value) {
                //loginViewModel.changeEmail(value);
              },
              label: "Nombre de usario",
              //error: loginViewModel.loginState.email.error,
              iconData: Icons.person_outlined,
            ),
          ),
          // Email -------------------------------------------------------------
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: DefaultTextField(
              onChanged: (value) {
                //loginViewModel.changeEmail(value);
              },
              label: "Correo electronico",
              //error: loginViewModel.loginState.email.error,
              iconData: Icons.email_outlined,
            ),
          ),
          // Password ----------------------------------------------------------
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: DefaultTextField(
              onChanged: (value) {
                //loginViewModel.changePassword(value);
              },
              label: "Contraseña",
              //error: loginViewModel.loginState.password.error,
              iconData: Icons.lock_outlined,
            ),
          ),
          // Confirm password --------------------------------------------------
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: DefaultTextField(
              onChanged: (value) {
                //loginViewModel.changePassword(value);
              },
              label: "Confirmar contraseña",
              //error: loginViewModel.loginState.password.error,
              iconData: Icons.lock_outlined,
            ),
          ),
          // Button ------------------------------------------------------------
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            child: DefaultButton(
              text: "Registarse",
              onPressed: () {
                //loginViewModel.login();
              },
            ),
          ),
        ],
      ),
    );
  }
}
