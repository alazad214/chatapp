import 'package:chatapp/auth/login_screen.dart';
import 'package:chatapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../widgets/custom_buttom.dart';

class SignUp_Screen extends StatelessWidget {
  SignUp_Screen({super.key});

  final controller = Get.put(Auth_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Image--->>
                  Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Image.asset(
                        "assets/image/chat.png",
                        height: 100,
                      )),

                  //Welcome title--->>
                  const Text(
                    "Just a few quick things to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),

                  const SizedBox(height: 20),
                  //Textfield--->>
                  Custom_textField(
                    hinttext: "email",
                    prefixicon: Icons.email,
                    onchanged: (email) {
                      controller.email.value = email;
                    },
                  ),
                  const SizedBox(height: 15),
                  Custom_textField(
                    hinttext: "password",
                    prefixicon: Icons.remove_red_eye,
                    obscuretext: true,
                    onchanged: (password) {
                      controller.password.value = password;
                    },
                  ),
                  const SizedBox(height: 15),
                  Custom_textField(
                    hinttext: "Confirm password",
                    prefixicon: Icons.remove_red_eye,
                    obscuretext: true,
                    onchanged: (password) {
                      controller.confirmpassword.value = password;
                    },
                  ),
                  const SizedBox(height: 25),
                  //Sign up Button--->>
                  Custom_Button(
                    text: "Sign up",
                    color: Colors.blueGrey,
                    ontap: () {
                      controller.SignUp();
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Get.to(LogIn_Screen());
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(color: Colors.indigo),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
