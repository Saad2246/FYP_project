import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../sizeconfig.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function? press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.sp),
          color: kSecondryColor.withOpacity(0.9),
        ),
        child: TextButton(
            onPressed: press as void Function()?,
            child: Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )),
      ),
    );
  }
}
