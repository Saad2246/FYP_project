import 'package:flutter/material.dart';
import 'package:pci/constants.dart';
import 'maps.dart';
import 'package:pci/sizeconfig.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);
  static String routeName = "maps1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondryColor,
        centerTitle: true,
        title: Text(
          "Maps",
          style: TextStyle(
              color: kWhiteColor,
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.w700
              // backgroundColor: kPrimaryColor,
              ),
        ),
      ),
      body: const MapsHome(),
    );
  }
}
