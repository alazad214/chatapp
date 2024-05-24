import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../route/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
          () => Get.toNamed(signUp),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/chat.png',
          width: 150,
        ),
      ),
    );
  }
}