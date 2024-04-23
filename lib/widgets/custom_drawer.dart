import 'package:chatapp/screens/example/show_userScreen.dart';
import 'package:chatapp/screens/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';

class Custom_Drawer extends StatelessWidget {
  Custom_Drawer({super.key});

  final controller = Get.put(Auth_Controller());
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: SizedBox(
                      height: 50, child: Image.asset("assets/image/chat.png"))),
              const SizedBox(height: 10),
              Text(
                currentUser!.email.toString(),
                style: const TextStyle(color: Colors.white70),
              )
            ],
          )),
          customListtile(
            Icons.home,
            "H O M E",
            () {
              Navigator.pop(context);
            },
          ),
          customListtile(Icons.logout, "U S E R S", () {
            Get.to(UserScreen());
          }),
          customListtile(Icons.settings, "S E T T I N G S", () {
            Get.to(const Settings_Screen());
          }),
          customListtile(Icons.logout, "L O G  O U T", () {
            controller.signOut();
          }),
        ],
      ),
    );
  }
}

Widget customListtile(icon, text, ontap) {
  return InkWell(
    onTap: ontap,
    child: ListTile(
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.white,
          )),
      title: Text(
        text,
        style:
            const TextStyle(fontWeight: FontWeight.w500, color: Colors.white70),
      ),
    ),
  );
}
