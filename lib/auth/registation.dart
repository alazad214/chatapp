import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textField.dart';
import 'login.dart';

class Ragistation extends StatelessWidget {
  Ragistation({super.key});
  final _emailformkey = GlobalKey<FormState>();
  final _passformkey = GlobalKey<FormState>();
  final _nameformkey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.blueAccent,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Create an account!",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          Column(
                            children: [
                              Form(
                                key: _nameformkey,
                                child: CustomformField(
                                  prefixicon:
                                      Icons.drive_file_rename_outline_rounded,
                                  hinttext: "name",
                                  onchanged: (emeil) {
                                    controller.email.value = emeil;
                                  },
                                  validation: (value) {
                                    if (value!.isEmpty) {
                                      return "Fill The Form";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Form(
                                key: _emailformkey,
                                child: CustomformField(
                                  prefixicon: Icons.email,
                                  hinttext: "email",
                                  onchanged: (emeil) {
                                    controller.email.value = emeil;
                                  },
                                  validation: (value) {
                                    if (value!.isEmpty) {
                                      return "Fill The Form";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Form(
                                key: _passformkey,
                                child: CustomformField(
                                  prefixicon: Icons.remove_red_eye_sharp,
                                  hinttext: "Password",
                                  obscuretext: true,
                                  onchanged: (password) {
                                    controller.password.value = password;
                                  },
                                  validation: (value) {
                                    if (value!.isEmpty) {
                                      return "Fill The Form";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomformField(
                                prefixicon: Icons.remove_red_eye_sharp,
                                hinttext: "Confirm Password",
                                obscuretext: true,
                                onchanged: (confirmpassword) {
                                  controller.confirmpassword.value =
                                      confirmpassword;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            text: "SIGN UP",
                            ontap: () {
                              if (_emailformkey.currentState!.validate() &&
                                  _passformkey.currentState!.validate() &&
                                  _nameformkey.currentState!.validate()) {
                                controller.Register();
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.offAll(() => LogInScreen());
                                },
                                child: const Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Already have in account?",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                  TextSpan(
                                      text: " Log In",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                ])),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} /**/
