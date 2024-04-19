import 'package:chatapp/auth/signup_screen.dart';
import 'package:chatapp/widgets/custom_buttom.dart';
import 'package:chatapp/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn_Screen extends StatelessWidget {
  const LogIn_Screen({super.key});

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
                    "Welcome back. Enjoy the time on AKTalk app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),

                  const SizedBox(height: 20),
                  //Textfield--->>
                  Custom_textField(
                    hinttext: "email",
                    prefixicon: Icons.email,
                  ),
                  const SizedBox(height: 15),
                  Custom_textField(
                    hinttext: "password",
                    prefixicon: Icons.remove_red_eye,
                    obscuretext: true,
                  ),
                  const SizedBox(height: 25),

                  //Sign in Button--->>
                  const Custom_Button(
                    text: "Sign in",
                    color: Colors.blueGrey,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a account?"),
                      TextButton(
                          onPressed: () {
                            Get.to(SignUp_Screen());
                          },
                          child: const Text(
                            "Sign Up",
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
