
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget authButton(String title, final Function onAction) {
  return InkWell(
    onTap: () {
      onAction();
    },
    child: Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17.sp,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}