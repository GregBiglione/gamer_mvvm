import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/presentation/widget/default_textfield.dart';

import '../../../../widget/default_button.dart';

class UpdateProfileContent extends StatelessWidget {
  const UpdateProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Background image --------------------------------------------------
          Stack(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
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
              // Back button ---------------------------------------------------
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
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
          // Edit username -----------------------------------------------------
          Container(
            margin: const EdgeInsets.only(
              left: 60,
              top: 40,
              right: 60,
            ),
            child: DefaultTextField(
              label: "Nombre de usuario",
              iconData: Icons.person_2_outlined,
              onChanged: (value) {},
            ),
          ),
          // Edit information button -------------------------------------------
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: DefaultButton(
              text: "Actualizar información",
              onPressed: (){
                Navigator.pushNamed(context, "profile/update");
              },
              iconData: Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
