import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/auth.dart';
import '../route/route.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class SignUp extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create\nYour Account",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Create your account and start your journey......",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              customTextField(
                _nameController,
                TextInputType.text,
                "name",
                prefixIcon: Icons.person_outline,
              ),
              customTextField(
                _emailController,
                TextInputType.emailAddress,
                "email",
                prefixIcon: Icons.email_outlined,
              ),
              customTextField(
                _passwordController,
                TextInputType.text,
                "password",
                obscureText: true,
                prefixIcon: Icons.remove_red_eye_outlined,
              ),
              SizedBox(
                height: 40.h,
              ),
              authButton(
                "Create Account",
                () => Auth().registration(
                  _nameController.text,
                  _emailController.text,
                  _passwordController.text,
                  context,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "--OR--",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                text: TextSpan(
                  text: "Already an user?  ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Log In",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(signIn),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
