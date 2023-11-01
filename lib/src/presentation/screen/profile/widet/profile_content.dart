import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/domain/model/user_data.dart';
import 'package:gamer_mvvm/src/presentation/screen/profile/profile_viewmodel.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_button.dart';

class ProfileContent extends StatelessWidget {
  final UserData userData;

  const ProfileContent({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Background image --------------------------------------------------
          Stack(
            children: [
              ClipPath(
                clipper: DiagonalPathClipperTwo(),
                child: Image.asset(
                  "assets/images/background.jpg",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black38,
                ),
              ),
              Column(
                children: [
                  // Title -----------------------------------------------------
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 130,
                    ),
                    child: const Text(
                      "Bienvenido",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Profile image ---------------------------------------------
                  Image.asset(
                    "assets/images/user_menu.png",
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
            ],
          ),
          // Username ----------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            child: Text(
              userData.username,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          // Email -------------------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              userData.email,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          // Edit button -------------------------------------------------------
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: DefaultButton(
              text: "Editar datos",
              onPressed: (){},
              iconData: Icons.edit,
              color: Colors.white,
            ),
          ),
          // Logout button -----------------------------------------------------
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 15,
            ),
            child: DefaultButton(
              text: "Cerrar sesion",
              onPressed: (){},
              iconData: Icons.power_settings_new,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
