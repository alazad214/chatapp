import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button(
      {super.key, required this.text, this.color, this.ontap, this.isloading});
  final String text;
  final Color? color;
  final ontap;
  final bool? isloading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.blueAccent)),
        child: isloading == true
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
