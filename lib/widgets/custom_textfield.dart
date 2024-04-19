import 'package:flutter/material.dart';

class Custom_textField extends StatelessWidget {
  Custom_textField(
      {super.key,
      this.hinttext,
      this.prefixicon,
      this.validation,
      this.obscuretext,
      this.onchanged});

  final hinttext;
  final IconData? prefixicon;
  final validation;
  final obscuretext;
  final onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      validator: validation,
      obscureText: obscuretext ?? false,
      decoration: InputDecoration(
        hintText: hinttext,

        prefixIcon: Icon(
          prefixicon,
          color: Colors.blueGrey,
        ),
        filled: true,
        fillColor: Colors.white,

        //enable-->
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Colors.black54, width: 2),
        ),
        //focus-->
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.teal,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        //focus-->
        errorBorder: OutlineInputBorder(
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
