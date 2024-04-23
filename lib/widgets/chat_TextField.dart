import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat_TextField extends StatelessWidget {
  Chat_TextField(
      {super.key,
      this.hinttext,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.controller});
  final hinttext;

  final validation;
  final obscuretext;
  final onchanged;
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      validator: validation,
      controller: controller,
      obscureText: obscuretext ?? false,
      decoration: InputDecoration(
        hintText: hinttext,

        filled: true,
        fillColor: Colors.white,

        //enable-->
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54, width: 2),
            borderRadius: BorderRadius.circular(14.0)),
        //focus-->
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.withOpacity(0.5),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(14.0)),
        //focus-->
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    );
  }
}
