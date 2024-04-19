import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/image/chat.png"),
              Text("Welcome back. Enjoy the time on AKTalk app.")
            ],
          ),
        ),
      ),
    );
  }
}
