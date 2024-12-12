import 'package:flutter/material.dart';

import '../sizeconfig.dart';

// ignore: must_be_immutable
class CustomSuffixIcon extends StatelessWidget {
  CustomSuffixIcon({Key? key, required this.icon, this.onTap})
      : super(key: key);
  VoidCallback? onTap;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(
          getProportionateScreenWidth(20),
        ),
        child: SizedBox(
          height: getProportionateScreenWidth(20),
          width: getProportionateScreenWidth(20),
          child: icon,
        ),
      ),
    );
  }
}
