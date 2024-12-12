import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pci/constants.dart';

// ignore: must_be_immutable
class CustomBottomBarItem extends StatelessWidget {
  VoidCallback onTap;
  String icon;
  String text;
  int indexNumber;
  int currentIndex;
  CustomBottomBarItem({
    required this.icon,
    required this.text,
    required this.indexNumber,
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: indexNumber == currentIndex
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.r),
                color: kSecondryColor.withOpacity(0.9),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      icon,
                      height: 24.h,
                      width: 24.w,
                      color: kWhiteColor,
                    ),
                    SizedBox(width: 10.w),
                    Text(text,
                        style: const TextStyle(
                          color: Colors.white,
                        )
                        //     color: kWhiteColor, fontWeight: FontWeight.w500),
                        )
                  ],
                ),
              ),
            )
          : SvgPicture.asset(
              icon,
              height: 24.h,
              width: 24.w,
              color: kWhiteColor,
            ),
    );
  }
}
