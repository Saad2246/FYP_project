import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomBackButton extends StatelessWidget {
  final onPressed;
  final icon;
  final iconColor;
  Color? backGroundColor;

  CustomBackButton(
      {required this.onPressed,
      required this.icon,
      required this.iconColor,
      this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.all(17.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: backGroundColor ?? Color.fromRGBO(84, 84, 84, 0.81),
          ),
          child: Image.asset(
            icon,
            height: 24.h,
            width: 24.w,
            color: iconColor,
          )),
    );
  }
}
