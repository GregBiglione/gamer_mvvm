import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm/src/presentation/utils/base_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper part with wave ----------------------------------------------
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
          // Black part --------------------------------------------------------
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
          // Email -------------------------------------------------------------
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: const TextField(
              decoration: InputDecoration(
                label: Text(
                  "Correo electronico",
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
          // Password ----------------------------------------------------------
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: const TextField(
              decoration: InputDecoration(
                label: Text(
                  "Contraseña",
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                suffixIcon: Icon(
                  Icons.lock_outlined,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          // Button ------------------------------------------------------------
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 40,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: baseColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: const Text(
                      "Iniciar sesion",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 50,
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Text button -------------------------------------------------------
          Container(
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
        ],
      )
    );
  }
}
